import 'package:boppo_stream/CommomWidgets/build_app_bar.dart';
import 'package:boppo_stream/screens/OrderHistory/order_details_page.dart';
import 'package:boppo_stream/screens/PlayerView/player_screen.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:boppo_stream/utils/payment.dart';
import 'package:boppo_stream/utils/progress_loader.dart';
import 'package:boppo_stream/utils/validation_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/orderhistory_bloc.dart';
import 'components/order_history_list_item.dart';
import 'model/OrderResponse.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final OrderhistoryBloc _bloc = OrderhistoryBloc();
  final List<MovieData> _orderList = [];
  final List<String> _castsList = [];
  String? _directorName;

  late Payment _payment;

  void _initPayment() {
    _payment = Payment(context: context, addRefreshEvent: _addRefreshEvent);
    _payment.init();
  }

  Future<void> _addRefreshEvent() async {
    _bloc.add(GetOrderHistory());
  }

  @override
  void initState() {
    super.initState();
    _addRefreshEvent();
    _initPayment();
  }

  @override
  void dispose() {
    _payment.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: BuildAppBar(),
        body: _buildOrderhistoryBloc(),
      );

  BlocConsumer<OrderhistoryBloc, OrderhistoryState> _buildOrderhistoryBloc() =>
      BlocConsumer<OrderhistoryBloc, OrderhistoryState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is OrderhistoryLoading) {
            showProgressDialog(context);
          } else if (state is OrderhistorySuccess) {
            hideProgressDialog(context);
            _orderList.clear();
            _orderList.addAll(state.orderList);
          } else if (state is AddOrderMovieSuccess) {
            hideProgressDialog(context);
            final amount = state.data.amount;
            final orderId = state.data.orderId;
            final receipt = state.data.receipt;
            if (amount != null && orderId != null && receipt != null) {
              // _openCheckout(
              //     amount: amount * 100, orderId: orderId, receipt: receipt);
              _payment.openCheckout(
                  amount: amount * 100,
                  orderId: orderId,
                  receipt: receipt,
                  movieName: state.name);
            }
          } else if (state is OrderhistoryError) {
            hideProgressDialog(context);
            showValidationAlert(context, errorMessage: state.error,
                onClose: () {
              Navigator.pop(context);
            });
          }
        },
        builder: (context, state) =>
            (state is OrderhistoryLoading) ? Container() : _buildBody(),
      );

  Widget _buildBody() => RefreshIndicator(
        onRefresh: _addRefreshEvent,
        child: (_orderList.length > 0)
            ? ListView.builder(
                // padding: const EdgeInsets.only(
                //     left: 8, right: 8, top: 0, bottom: 20),
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: _orderList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  _getCastingDetails(index);
                  return OrderHistoryListItem(
                    movieName: _orderList[index].movieName,
                    movieImage: '$kImageBaseUrl${_orderList[index].thumbnail}',
                    purchaseAmount: _orderList[index].amount,
                    movieCasts: _castsList,
                    purchaseDate: _orderList[index].createdAt,
                    transactionStatus: _orderList[index].transactionStatus,
                    currency: _orderList[index].totalAmount,
                    rePurchase: () => _onWatchPurchase(index),
                    onViewDetails: () => _showDetailsScreen(index),
                    onMoviePlay: () => _playMovie(index),
                  );
                },
              )
            : Center(
                child: Text('No purchased movie found'),
              ),
      );

  void _onWatchPurchase(int index) {
    if (_orderList[index].contentTypeId != null &&
        _orderList[index].id != null) {
      _bloc.add(AddOrder(
          name: _orderList[index].movieName ?? '',
          amountType: 'inr',
          contentTypeId: _orderList[index].contentTypeId!,
          contentId: _orderList[index].id!,
          seasonId: _orderList[index].id ?? -1));
    }
  }

  void _getCastingDetails(int index) {
    final castList = _orderList[index].castList;
    print('my list: $castList');
    if (castList != null && castList.isNotEmpty) {
      _castsList.clear();
      castList.forEach((i) {
        debugPrint('my list:1 castList $_castsList $castList');
        if (i.movieCastType == 'director') {
          _directorName = i.movieCastName ?? '';
        } else {
          _castsList.add(i.movieCastName ?? '');
        }
      });
    }
  }

  void _showDetailsScreen(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderDetailsPage(
                  id: _orderList[index].id ?? 1,
                  contentTypeId: _orderList[index].contentTypeId ?? 1,
                  previews: ['$kImageBaseUrl${_orderList[index].movieFile}'],
                  movieName: _orderList[index].movieName,
                  movieImage: '$kImageBaseUrl${_orderList[index].thumbnail}',
                  purchaseAmount: _orderList[index].amount,
                  movieCasts: _castsList,
                  purchaseDate: _orderList[index].createdAt,
                  totalAmount: _orderList[index].totalAmount,
                  orderId: _orderList[index].orderNo.toString(),
                  subTotal: _orderList[index].amount,
                  taxAmount: _orderList[index].taxAmount,
                  discount: _orderList[index].discount,
                  movieFile: _orderList[index].movieFile,
                  // castList: _castList,
                )));
  }

  void _playMovie(int index) {
    if (_orderList[index].transactionStatus == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlayerScreen(
                    videoList: ['$kImageBaseUrl${_orderList[index].movieFile}'],
                  )));
    }
  }
}
