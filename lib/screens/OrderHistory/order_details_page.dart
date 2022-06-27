import 'package:boppo_stream/CommomWidgets/back_button_widget.dart';
import 'package:boppo_stream/CommomWidgets/gradient_container.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/Details/bloc/detail_bloc.dart';
import 'package:boppo_stream/screens/Details/components/components.dart';
import 'package:boppo_stream/screens/Details/model/movie_cast.dart';
import 'package:boppo_stream/screens/OrderHistory/components/payment_info_widget.dart';
import 'package:boppo_stream/screens/PlayerView/player_screen.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:boppo_stream/utils/progress_loader.dart';
import 'package:boppo_stream/utils/share.dart';
import 'package:boppo_stream/utils/validation_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';

class OrderDetailsPage extends StatefulWidget {
  final int id;
  final int contentTypeId;
  final List<String> previews;
  final String? movieImage;
  final String? movieName;
  final String? movieDescription;
  final List<String> movieCasts;
  final String? purchaseAmount;
  final String? purchaseDate;
  final String? totalAmount;
  final String? orderId;
  final String? subTotal;
  final String? taxAmount;
  final String? discount;
  final String? movieFile;
  final List<MovieCast>? castsList;
  const OrderDetailsPage({
    Key? key,
    required this.id,
    required this.contentTypeId,
    required this.previews,
    this.movieName,
    this.movieDescription,
    this.movieImage,
    this.movieCasts = const [],
    this.purchaseAmount,
    this.purchaseDate,
    this.totalAmount,
    this.orderId,
    this.subTotal,
    this.taxAmount,
    this.discount,
    this.movieFile,
    this.castsList,
  }) : super(key: key);

  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final DetailBloc _bloc = DetailBloc();

  bool _isAddedToWatchLater = false;
  final List<MovieCast> _castsList = [];
  List<String> _previews = [];

  String? _shareUrl;

  void _onWatchLaterClick() {
    if (_isAddedToWatchLater == true) {
      _bloc.add(RemoveFromWatchLater(
          contentTypeId: widget.contentTypeId, contentId: widget.id));
    } else {
      _bloc.add(AddtoWatchLater(
          contentTypeId: widget.contentTypeId, contentId: widget.id));
    }
    setState(() => _isAddedToWatchLater = !_isAddedToWatchLater);
  }

  void _onShare() async {
    Share.instance.share();
  }

  void _onTrailer() {
    if (_previews.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlayerScreen(
                    videoList: _previews,
                  )));
    }
  }

  @override
  void initState() {
    super.initState();
    this._previews = widget.previews;
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _buildBloc(),
      );

  BlocConsumer<DetailBloc, DetailState> _buildBloc() =>
      BlocConsumer<DetailBloc, DetailState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is DetailLoading) {
            showProgressDialog(context);
          } else if (state is GetDetailLoading) {
            showProgressDialog(context);
          } else if (state is DetailSuccess) {
            hideProgressDialog(context);
          } else if (state is DetailMovieSuccess) {
            hideProgressDialog(context);
          } else if (state is DetailFavLoading) {
            hideProgressDialog(context);
          } else if (state is DetailAddFavSuccess) {
            hideProgressDialog(context);
          } else if (state is DetailError) {
            hideProgressDialog(context);
            showValidationAlert(context, errorMessage: state.error,
                onClose: () {
              Navigator.pop(context);
            });
          }
        },
        builder: (context, state) =>
            (state is GetDetailLoading) ? Container() : _buildBody(),
      );

  SingleChildScrollView _buildBody() => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ImageHelper(
                    image: '${widget.movieImage}',
                    imageType: ImageType.network,
                    boxFit: BoxFit.fill,
                    height: 35.h,
                    width: double.infinity),
                GradientContainer(),
                BackButtonWidget(context: context),
                MovieDetailsHeaderWidget(
                    isAddedToWatchLater: _isAddedToWatchLater,
                    movieThumbnailUrl: '${this.widget.movieImage}',
                    movieDescription: widget.movieDescription,
                    movieName: widget.movieName ?? '',
                    onWatchLaterClick: _onWatchLaterClick,
                    onShareClick: _onShare,
                    onWatchTrailerClick: _onTrailer)
              ],
            ),
            // const SizedBox(height: 20),
            // AutoSizeText(
            //   widget.movieDescription ?? '',
            //   style: TextStyle(
            //       // color: Color(0xFF515C6F),
            //       fontSize: 8.0.sp,
            //       fontWeight: FontWeight.w400),
            // ),
            const SizedBox(height: 20),
            MovieCastDetailsWidget(castsList: _castsList),
            PaymentInfoWidget(
              purchaseDate: widget.purchaseDate,
              totalAmount: widget.totalAmount,
              orderId: widget.orderId,
              subTotal: widget.subTotal,
              taxAmount: widget.taxAmount,
              discount: widget.discount,
              onWatchClick: _onWatchClick,
            ),
          ],
        ),
      );

  void _onWatchClick() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlayerScreen(
                  videoList: ['$kImageBaseUrl${widget.movieFile}'],
                )));
  }
}
