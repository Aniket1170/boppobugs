import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/AppDrawer/app_drawer.dart';
import 'package:boppo_stream/screens/WishList/wishlist_page.dart';
import 'package:boppo_stream/screens/Profile/profile_page.dart';
import 'package:boppo_stream/screens/Search/search_page.dart';
import 'package:boppo_stream/utils/confirmation_alert.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:boppo_stream/utils/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';
import 'dart:io' show Platform, exit;
import 'HomePage/home_page.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({
    Key? key,
  }) : super(key: key);
  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  bool _swipeTop = true;

  int _selectedTabPosition = 0;

  void _onItemTapped(int index) {
    // if (index == 1) {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => SearchPage()));
    // } else if (index == 2) {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => FavouritesPage()));
    // } else if (index == 3) {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => ProfilePage()));
    // } else {
    // if (index == 1) {

    if (index == 0) {
      if (_swipeTop == true && _selectedTabPosition == 0)
        _scrollController.animateTo(
          0.0,
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
        );
      _swipeTop = true;
    } else {
      _swipeTop = false;
    }
    setState(() {
      _selectedTabPosition = index;
    });
    // } else {
    //   setState(() {
    //     _swipeTop = false;
    //     _selectedTabPosition = index;
    //   });
    // }

    // }
  }

  void _onAccept() {
    if (Platform.isAndroid) {
      exit(0);
    }
  }

  void _onCancel() {
    Navigator.pop(context);
  }

  Future<bool> _onWillPop() async {
    if (this._selectedTabPosition != 0) {
      setState(() {
        _selectedTabPosition = 0;
      });
    } else {
      showConfirmationAlert(context,
          message: 'Are you sure you want to exit the app?',
          acceptLabel: 'Yes',
          rejectLabel: 'Cancel',
          onAccept: _onAccept,
          onReject: _onCancel);
    }

    return false;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: AppDrawer(),
          body: ProsteIndexedStack(
            index: _selectedTabPosition,
            children: [
              IndexedStackChild(
                  child: HomePage(scrollController: _scrollController)),
              IndexedStackChild(child: SearchPage()),
              IndexedStackChild(child: WishListPage()),
              IndexedStackChild(child: ProfilePage()),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.home, size: 6.w),
                // icon: FaIcon(FontAwesomeIcons.house),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 6.w),
                label: 'Find',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border, size: 6.w),
                // icon: Icon(Icons.playlist_add_check, size: 6.w),
                label: 'Favourites',
                // label: 'My List',
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.account, size: 6.w),
                // icon: Icon(Icons.person_outline, size: 5.w),
                label: 'Account',
              ),
            ],
            currentIndex: _selectedTabPosition,
            selectedIconTheme: IconThemeData(color: primarybuttonColor),
            selectedItemColor: primarybuttonColor,
          ),
        ),
      );
}
