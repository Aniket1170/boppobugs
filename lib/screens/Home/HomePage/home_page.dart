import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/rounded_rupee_Symbol_widget.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/AppDrawer/app_drawer.dart';
import 'package:boppo_stream/screens/Home/HomePage/components/WelcomeBackDialog.dart';
import 'package:boppo_stream/screens/Home/HomePage/components/home_continue.dart';
import 'package:boppo_stream/screens/OrderHistory/order_history_page.dart';
import 'package:boppo_stream/utils/app_preference.dart';
import 'package:boppo_stream/utils/custom_icons.dart';
import 'package:boppo_stream/utils/logout_user.dart';
import 'package:boppo_stream/utils/progress_loader.dart';
import 'package:boppo_stream/utils/static_repository.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bloc/home_bloc.dart';
import 'components/banner_item.dart';
import 'components/movie_horizontal_list.dart';
import 'model/HomeResponse.dart';

class HomePage extends StatefulWidget {
  final ScrollController scrollController;
  const HomePage({Key? key, required this.scrollController}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _homeBloc = HomeBloc();
  final AppPreferences _appPreferences = AppPreferences();
  int _current = 0;

  List<WatchingListData>? _movieList;
  List<WatchingListData>? _topBannerList;
  List<WatchingListData>? _continueWatchingList;
  List<WatchingListData>? _trendingList;
  List<WatchingListData>? _webSeriesList;
  List<WatchingListData>? _shortFilmsList;

  void _handleWelcomeDialog() async {
    final mNumber = await _appPreferences.getMobileNumber();
    await _appPreferences.isWelcomeBackShown().then((value) {
      if (!value)
        Navigator.push(
            context,
            PageRouteBuilder(
                opaque: false,
                pageBuilder: (context, _, __) => WelcomeBackWidget(
                    mobileNumber: mNumber,
                    isNewRegistration: StaticRepository().isRegister)));
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void _openDrawer() {
    Scaffold.of(context).openDrawer();
  }

  void _navToMyPurchase() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OrderHistoryPage()));
  }

  Future<void> _addRefreshEvent() async {
    _homeBloc.add(GetHomeData());
  }

  @override
  void initState() {
    super.initState();
    _addRefreshEvent();
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        // key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: _openDrawer,
            icon: SvgPicture.asset(
              'assets/icons/hamburger_icon.svg',
              fit: BoxFit.cover,
              height: 5.w,
              width: 5.w,
            ),
          ),
          actions: [
            InkWell(
              onTap: _navToMyPurchase,
              child: Row(
                children: [
                  RoundedRupeeSymbolWidget(),
                  const SizedBox(width: 8.0),
                  AutoSizeText('My Purchase', style: TextStyle(fontSize: 8.sp)),
                  const SizedBox(width: 8.0),
                ],
              ),
            )
          ],
        ),
        // drawer: AppDrawer(),
        body: RefreshIndicator(
          onRefresh: _addRefreshEvent,
          child: SingleChildScrollView(
            controller: widget.scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            child: _buildHomeBloc(),
          ),
        ),
      );

  BlocConsumer<HomeBloc, HomeState> _buildHomeBloc() =>
      BlocConsumer<HomeBloc, HomeState>(
        bloc: _homeBloc,
        listener: (context, state) {
          if (state is HomeLoading) {
            showProgressDialog(context);
          } else if (state is HomeSuccess) {
            hideProgressDialog(context);
            this._topBannerList = state.homeData.banner?.toList();
            this._movieList = state.homeData.moviesList?.toList();
            this._continueWatchingList = state.homeData.watchingList?.toList();
            this._trendingList = state.homeData.latestTrendMovies?.toList();
            this._webSeriesList = state.homeData.webseries?.toList();
            this._shortFilmsList = state.homeData.docshortfilm?.toList();
            _handleWelcomeDialog();
          } else if (state is HomeError) {
            hideProgressDialog(context);
            logoutUser(context, state.code, errorMessage: state.error);
          }
        },
        builder: (context, state) =>
            (state is HomeLoading) ? Container() : _buildHomeBody(),
      );

  Widget _buildHomeBody() => Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // const SizedBox(height: 8),
          // Image.asset(
          //   kSplashImage,
          //   width: 100,
          //   height: 60,
          //   fit: BoxFit.cover,
          // ),
          SizedBox(height: 2.w),
          if (this._topBannerList != null && this._topBannerList!.isNotEmpty)
            CarouselSlider.builder(
              itemCount: this._topBannerList!.length,
              options: CarouselOptions(
                  autoPlay: true,
                  height: 50.w,
                  // viewportFraction: 1.0,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() => _current = index);
                  }),
              itemBuilder: (context, index, realIndex) => Builder(
                  builder: (BuildContext context) => BannerItem(
                      currentIndexCount: index + 1,
                      totalSlides: this._topBannerList!.length,
                      watchingListData: this._topBannerList![index])),
            ),
          const SizedBox(height: 10),
          // if (this._topBannerList != null && this._topBannerList!.isNotEmpty)
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: _topBannerList!
          //         .asMap()
          //         .entries
          //         .map((entry) => Container(
          //               width: 8.0,
          //               height: 8.0,
          //               margin: EdgeInsets.symmetric(
          //                   vertical: 8.0, horizontal: 4.0),
          //               decoration: BoxDecoration(
          //                   shape: BoxShape.circle,
          //                   color:
          //                       (Theme.of(context).brightness == Brightness.dark
          //                               ? Colors.white
          //                               : Colors.black)
          //                           .withOpacity(
          //                               _current == entry.key ? 0.9 : 0.4)),
          //             ))
          //         .toList(),
          //   ),

          MovieHorizontalList(
              title: 'Continue Watching', movieList: _continueWatchingList),

          MovieHorizontalList(title: 'Trending', movieList: _trendingList),

          MovieHorizontalList(title: 'Latest Released', movieList: _movieList),

          MovieHorizontalList(title: 'Popular', movieList: _movieList),

          MovieHorizontalList(title: 'Action', movieList: _movieList),

          MovieHorizontalList(title: 'Movies', movieList: _movieList),

          MovieHorizontalList(
              title: 'Webseries',
              // showPriceTag: false,
              movieList: _webSeriesList),

          // if (_webSeriesList != null && _webSeriesList!.isNotEmpty)
          //   ListTile(
          //     // onTap: () =>
          //     //     Navigator.pushNamed(context, ContinueWatchingPageRoute),
          //     contentPadding: const EdgeInsets.fromLTRB(8.0, 0.0, 4.0, 0.0),
          //     onTap: () => Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) =>
          //                 WebSeriesPage(list: _webSeriesList ?? []))),
          //     title: AutoSizeText(
          //       'Web Series',
          //       style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w600),
          //     ),
          //     trailing: Icon(
          //       Icons.arrow_forward_ios_outlined,
          //       size: 20,
          //     ),
          //   ),
          // if (_webSeriesList != null && _webSeriesList!.isNotEmpty)
          //   _webSeriesListWidget(),
          // if (_shortFilmsList != null && _shortFilmsList!.isNotEmpty)
          //   ListTile(
          //     // onTap: () =>
          //     //     Navigator.pushNamed(context, ContinueWatchingPageRoute),
          //     onTap: () => Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) =>
          //                 ContinueWatchingPage(list: _shortFilmsList ?? []))),
          //     title: Text(
          //       'Short Films',
          //     ),
          //     trailing: Icon(
          //       Icons.arrow_forward_ios_outlined,
          //       size: 20,
          //     ),
          //   ),
          // if (_shortFilmsList != null && _shortFilmsList!.isNotEmpty)
          //   _shortFilmsListWidget(),
          const SizedBox(height: 20)
        ],
      );

  // Widget _webSeriesListWidget() => Container(
  //       height: MediaQuery.of(context).size.height / 5,
  //       // margin: const EdgeInsets.only(bottom: 4.0, left: 6.0),
  //       child: ListView.builder(
  //         physics: BouncingScrollPhysics(),
  //         scrollDirection: Axis.horizontal,
  //         itemCount: this._webSeriesList?.length,
  //         itemBuilder: (context, index) => WebSeriesListItem(
  //             watchingListData: this._webSeriesList![index],
  //             imageUrl:
  //                 // '${this._continueWatchingList[index].baseUrl}${this._continueWatchingList[index].file}' ??
  //                 '$kImageBaseUrl${this._webSeriesList![index].file}'),
  //       ),
  //     );

  // Container _shortFilmsListWidget() => Container(
  //       height: 120,
  //       margin: const EdgeInsets.only(bottom: 10, left: 12.0, right: 12.0),
  //       child: ListView.builder(
  //         scrollDirection: Axis.horizontal,
  //         itemCount: this._shortFilmsList?.length,
  //         itemBuilder: (context, index) => ContinueWatchingListItem(
  //             watchingListData: this._shortFilmsList![index],
  //             imageUrl:
  //                 // '${this._continueWatchingList[index].baseUrl}${this._continueWatchingList[index].file}' ??
  //                 '$kImageBaseUrl${this._shortFilmsList![index].file}'),
  //       ),
  //     );
}
