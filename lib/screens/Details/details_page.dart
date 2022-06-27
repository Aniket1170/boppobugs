import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/back_button_widget.dart';
import 'package:boppo_stream/CommomWidgets/custom_button.dart';
import 'package:boppo_stream/CommomWidgets/gradient_container.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/Sizer/sizer.dart';

import 'package:boppo_stream/screens/PlayerView/player_screen.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:boppo_stream/utils/payment.dart';
import 'package:boppo_stream/utils/progress_loader.dart';
import 'package:boppo_stream/utils/share.dart';
import 'package:boppo_stream/utils/validation_alert.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boppo_stream/screens/Details/bloc/detail_bloc.dart';
import 'package:boppo_stream/screens/Details/components/components.dart';

import 'model/detail_movie_response.dart';
import 'model/movie_cast.dart';

class DetailsPage extends StatefulWidget {
  final int contentTypeId;
  final int? seasonId;
  final int id;
  final int selectedSeason;
  final String movieThumbnailUrl;

  const DetailsPage({
    Key? key,
    required this.contentTypeId,
    this.seasonId,
    required this.id,
    this.selectedSeason = 0,
    required this.movieThumbnailUrl,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final DetailBloc _bloc = DetailBloc();
  final List<String> _languages = [];
  final List<String> _genres = [];
  final List<String> _casts = [];
  final List<String> _previews = [];
  List<EpisodeListData>? _episodesList;
  List<SeasonListData>? _seasonList;
  int? _seasonId;
  String? _directorName;
  String? _vendorName;
  String? _companyLogo;
  String? _file;
  String? _movieUrl;
  String? _movieBannerImage;
  String? _movieImage;
  String? _movieName;
  String? _movieDescription;
  String? _shareUrl;
  String? _currency;
  bool _isAddedToWatchLater = false;
  bool _isPurchased = false;
  int _selectedSeason = 0;

  List<MovieCast> _castsList = [];

  late Payment _payment;

  void _initPayment() {
    _payment = Payment(context: context, addRefreshEvent: _addRefreshEvent);
    _payment.init();
  }

  void _getMovieDetails(DetailMovieData detailMovieData) {
    _clearAllLists();
    final seasonList = detailMovieData.seasonList;
    if (widget.contentTypeId == movieContentTypeId) {
      final languageList = detailMovieData.languageList;
      if (languageList != null && languageList.isNotEmpty) {
        languageList.forEach((i) {
          _languages.add(i.languageName ?? '');
        });
      }
    } else {
      if (seasonList != null && seasonList.isNotEmpty) {
        final languageList = detailMovieData.seasonList?[0].LanguageList;
        if (languageList != null && languageList.isNotEmpty) {
          languageList.forEach((i) {
            _languages.add(i.seasonLanguageName ?? '');
          });
        }
      }
    }

    if (widget.contentTypeId == movieContentTypeId) {
      final castList = detailMovieData.castList;
      if (castList != null && castList.isNotEmpty) {
        castList.forEach((i) {
          if (i.movieCastType == 'director') {
            _directorName = i.movieCastName ?? '';
          } else
            _casts.add(i.movieCastName ?? '');
        });
      }
    } else {
      if (seasonList != null && seasonList.isNotEmpty) {
        final castList = detailMovieData.seasonList?[0].castList;
        if (castList != null && castList.isNotEmpty) {
          castList.forEach((i) {
            if (i.movieCastType == 'director') {
              _directorName = i.movieCastName ?? '';
            } else
              _casts.add(i.movieCastName ?? '');
          });
        }
      }
    }

    if (widget.contentTypeId == movieContentTypeId) {
      final genreList = detailMovieData.genreList;
      if (genreList != null && genreList.isNotEmpty) {
        genreList.forEach((i) {
          _genres.add(i.movieTagName ?? '');
        });
      }
    } else {
      if (seasonList != null && seasonList.isNotEmpty) {
        final genreList = detailMovieData.seasonList?[0].List;
        if (genreList != null && genreList.isNotEmpty) {
          genreList.forEach((i) {
            _genres.add(i.seasonTagName ?? '');
          });
        }
      }
    }

    // if (widget.contentTypeId == movieContentTypeId) {
    final previewList = detailMovieData.previewList;
    if (previewList != null && previewList.isNotEmpty)
      previewList.forEach((i) {
        _previews.add('$kImageBaseUrl${i.movieFilePath}');
      });
    // } else {
    //   if (seasonList != null && seasonList.isNotEmpty) {
    //     final previewList = detailMovieData.seasonList?[0].PreviewList;
    //     if (previewList != null && previewList.isNotEmpty) {
    //       previewList.forEach((i) {
    //         _previews.add('$kImageBaseUrl${i.movieFilePath}');
    //       });
    //     }
    //   }
    // }

    _seasonId = detailMovieData.seasonId;
    _seasonList = detailMovieData.seasonList?.toList();
    _episodesList = detailMovieData.episodeList?.toList();
    _vendorName = detailMovieData.vendorName ?? '';
    _companyLogo = detailMovieData.companyLogo ?? '';
    _file = detailMovieData.file ?? '';
    if (widget.contentTypeId == movieContentTypeId) {
      _movieName = detailMovieData.name ?? '';
    } else {
      _movieName = detailMovieData.seasonName ?? '';
    }

    _movieBannerImage = detailMovieData.file ?? '';
    _movieImage = detailMovieData.file ?? '';
    if (widget.contentTypeId == movieContentTypeId) {
      _movieUrl = detailMovieData.movieFile ?? '';
    } else {
      if (_episodesList != null && _episodesList!.isNotEmpty) {
        _movieUrl = _episodesList![0].episodeUrl ?? '';
      }
    }

    _movieDescription = detailMovieData.description;
    _shareUrl = detailMovieData.shareUrl;
    _currency = detailMovieData.inr?.toString() ?? '';
    _isAddedToWatchLater = ((detailMovieData.favouriteList ?? 0) == 1);
    _isPurchased = (detailMovieData.isPurchased ?? 0) == 1;

    _castsList = [
      MovieCast(header: 'Genre', castList: _genres),
      MovieCast(header: 'Languages', castList: _languages),
      MovieCast(header: 'Director', singleCast: _directorName),
      MovieCast(header: 'Star Cast', castList: _casts),
    ];
  }

  void _clearAllLists() {
    _languages.clear();
    _casts.clear();
    _genres.clear();
  }

  void _navToSeasonDetailPage(int index) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(
                  contentTypeId: widget.contentTypeId,
                  id: widget.id,
                  seasonId: this._seasonList![index].seasonId,
                  movieThumbnailUrl: widget.movieThumbnailUrl,
                  selectedSeason: index,
                )));
  }

  void _onWatchPurchase() {
    _bloc.add(AddOrder(
        amountType: 'inr',
        contentTypeId: widget.contentTypeId,
        contentId: widget.id,
        seasonId: _seasonId ?? -1));
  }

  void _onWatch() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlayerScreen(videoList: [
                  '$kImageBaseUrl$_movieUrl',
                  'https://d28qk5m15i8chy.cloudfront.net/movie/OoAntava_1643357776055.mp4'
                ])));
  }

  void _onWatchEpisode(int index) {
    if (_isPurchased) {
      if (_episodesList != null && _episodesList!.isNotEmpty) {
        final movieUrl = _episodesList![index].episodeUrl;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PlayerScreen(videoList: ['$kImageBaseUrl$movieUrl'])));
      }
    } else {
      showValidationAlert(
        context,
        errorMessage: 'Season not purchased',
        errorDescription: 'Please purchase season to continue streaming',
        buttonMessage: 'Not now',
        showPurchaseButton: true,
        onClose: () {
          Navigator.pop(context);
        },
        onPurchased: () {
          Navigator.pop(context);
          _onWatchPurchase();
        },
      );
    }
  }

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

  void _addRefreshEvent() {
    if (widget.contentTypeId == movieContentTypeId) {
      _bloc.add(RefreshMovieDetail(
          id: widget.id, contentTypeId: widget.contentTypeId));
    } else {
      _bloc.add(RefreshWebseriesDetail(
          id: widget.id, seasonId: widget.seasonId ?? 1));
    }
  }

  void _getData() {
    _selectedSeason = widget.selectedSeason;
    if (widget.contentTypeId == movieContentTypeId) {
      _bloc.add(
          GetMovieDetail(id: widget.id, contentTypeId: widget.contentTypeId));
    } else {
      _bloc.add(
          GetWebseriesDetail(id: widget.id, seasonId: widget.seasonId ?? 1));
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getData();
    _initPayment();
  }

  @override
  void dispose() {
    _bloc.close();
    _payment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      extendBodyBehindAppBar: true,
      body: RefreshIndicator(
        onRefresh: () async => _addRefreshEvent(),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: _buildBloc(),
        ),
      ));

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
            _getMovieDetails(state.data[0]);
            hideProgressDialog(context);
          } else if (state is DetailFavLoading) {
            hideProgressDialog(context);
          } else if (state is DetailAddFavSuccess) {
            hideProgressDialog(context);
            _addRefreshEvent();
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
                  movieName: _movieName ?? '');
            }
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

  Widget _buildBody() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ImageHelper(
                  image: '$kImageBaseUrl$_movieBannerImage',
                  imageType: ImageType.network,
                  boxFit: BoxFit.fill,
                  height: 35.h,
                  width: double.infinity),
              GradientContainer(),
              BackButtonWidget(context: context),
              MovieDetailsHeaderWidget(
                isAddedToWatchLater: _isAddedToWatchLater,
                movieThumbnailUrl: '${this.widget.movieThumbnailUrl}',
                movieDescription: _movieDescription,
                movieName: _movieName ?? '',
                onWatchLaterClick: _onWatchLaterClick,
                onShareClick: _onShare,
                onWatchTrailerClick: _onTrailer,
              )
            ],
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MovieCastDetailsWidget(
                    castsList: _castsList,
                    showSeeAll: (widget.contentTypeId != movieContentTypeId)),
                if (_seasonList != null && _seasonList!.isNotEmpty)
                  _seasonListWidget(),
                if (_episodesList != null && _episodesList!.isNotEmpty)
                  EpisodeListWidget(
                      isPurchased: _isPurchased,
                      episodeList: this._episodesList ?? [],
                      onWatchPurchase: _onWatchPurchase),
                // if (_seasonList != null && _seasonList!.isNotEmpty)
                //   Padding(
                //     padding: const EdgeInsets.fromLTRB(0.0, 12.0, 4.0, 8.0),
                //     child: AutoSizeText(
                //       'Seasons',
                //       textAlign: TextAlign.start,
                //       style: TextStyle(
                //           fontSize: 8.sp, fontWeight: FontWeight.w600),
                //     ),
                //   ),
                // if (_seasonList != null && _seasonList!.isNotEmpty)
                //   _seasonListWidget(),
              ],
            ),
          ),
          // if (widget.contentTypeId == movieContentTypeId)
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: (!_isPurchased)
                ? CustomButton(
                    onPressed: _onWatchPurchase,
                    label: 'WATCH WITH $rupeeSymbol $_currency')
                : CustomButton(onPressed: _onWatch, label: 'WATCH'),
          ),
        ],
      );

  void _onSeasonTap(int index) {
    setState(() => _selectedSeason = index);
  }

  Widget _seasonListWidget() => Container(
        height: 10.h,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: this._seasonList?.length,
          itemBuilder: (context, index) => SeasonItem(
            color: _selectedSeason == index
                ? Colors.lightBlue
                : Colors.transparent,
            borderColor:
                _selectedSeason == index ? Colors.transparent : Colors.white,
            seasonName: 'Season ${index + 1}',
            // onTap: () => _onSeasonTap(index),
            onTap: () => _navToSeasonDetailPage(index),
          ),
        ),
      );

  // Widget _seasonListWidget() => Container(
  //       height: 28.h,
  //       child: ListView.builder(
  //         padding: EdgeInsets.zero,
  //         shrinkWrap: true,
  //         physics: BouncingScrollPhysics(),
  //         scrollDirection: Axis.horizontal,
  //         itemCount: this._seasonList?.length,
  //         itemBuilder: (context, index) => WebSeriesSeasonListItem(
  //             onTap: () => _navToSeasonDetailPage(index),
  //             watchingListData: this._seasonList![index],
  //             seriesSeasonName: this._seasonList![index].seasonName ?? '',
  //             imageUrl: '$kImageBaseUrl${this._seasonList![index].thumbnail}'),
  //       ),
  //     );
}

class SeasonItem extends StatelessWidget {
  final String seasonName;
  final Color color;
  final Color borderColor;
  final Function()? onTap;
  const SeasonItem({
    Key? key,
    required this.seasonName,
    this.onTap,
    required this.color,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(4.0, 12.0, 4.0, 12.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
            margin: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 8.0),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: borderColor)),
            child: Center(
                child: AutoSizeText(seasonName,
                    style: TextStyle(fontSize: 10.sp))),
          ),
        ),
      );
}
