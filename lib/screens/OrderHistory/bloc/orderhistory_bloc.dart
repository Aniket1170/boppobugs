import 'package:boppo_stream/APIService/OrderHistory/OrderHistoryService.dart';
import 'package:boppo_stream/Chopper/ApiErrorMessage.dart';
import 'package:boppo_stream/screens/Details/model/ContentList.dart';
import 'package:boppo_stream/screens/Details/model/add_order.dart';
import 'package:boppo_stream/screens/OrderHistory/model/OrderResponse.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'orderhistory_event.dart';
part 'orderhistory_state.dart';

class OrderhistoryBloc extends Bloc<OrderhistoryEvent, OrderhistoryState> {
  ApiErrorMessage _apiErrorMessage = ApiErrorMessage();

  OrderhistoryBloc() : super(const OrderhistoryState()) {
    on<GetOrderHistory>(_getProductList);
    on<AddOrder>(_addOrder);
  }

  void _getProductList(
      GetOrderHistory event, Emitter<OrderhistoryState> emit) async {
    try {
      emit(OrderhistoryLoading());

      final Response<OrderResponse> _homeResponse =
          await OrderHistoryService.create().productHistory();
      if (_homeResponse.isSuccessful) {
        // successful request
        final body = _homeResponse.body;
        debugPrint("home log $body");
        if (body != null) {
          final _data = body.data;
          if (_data.isNotEmpty) {
            final List<MovieData> _orderList = [];
            _orderList.addAll(_data[0].movies?.toList() ?? []);
            _orderList.addAll(_data[0].Season?.toList() ?? []);
            emit(OrderhistorySuccess(orderList: _orderList));
          }
        } else
          emit(OrderhistoryError(error: EXCEPTIONAL_MESSAGE));
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_homeResponse);
        emit(OrderhistoryError(error: message));
      }
    } catch (e) {
      emit(OrderhistoryError(error: EXCEPTIONAL_MESSAGE));
    }
  }

  void _addOrder(AddOrder event, Emitter<OrderhistoryState> emit) async {
    try {
      emit(OrderhistoryLoading());
      ContentList data;

      if (event.seasonId == -1) {
        data = ContentList(
            contentTypeId: event.contentTypeId,
            contentId: event.contentId,
            seasonId: null);
      } else {
        data = ContentList(
            contentTypeId: event.contentTypeId,
            contentId: event.contentId,
            seasonId: event.seasonId);
      }

      Map<String, dynamic> body = {
        "amount_type": event.amountType,
        "cartList": [data.toJson()],
      };

      final Response<AddOrderResponse> _homeResponse =
          await OrderHistoryService.create().addorder(body);
      if (_homeResponse.isSuccessful) {
        // successful request
        final body = _homeResponse.body;
        debugPrint("home log $body");
        if (body != null) {
          // final _data = body.data;
          emit(AddOrderMovieSuccess(data: body.data, name: event.name));
        } else
          emit(OrderhistoryError(error: EXCEPTIONAL_MESSAGE));
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_homeResponse);
        emit(OrderhistoryError(error: message));
      }
    } catch (e) {
      emit(OrderhistoryError(error: e.toString()));
    }
  }
}
