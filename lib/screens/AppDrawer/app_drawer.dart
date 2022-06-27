import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/custom_button.dart';
import 'package:boppo_stream/CommomWidgets/custom_drawer_header.dart';
import 'package:boppo_stream/CommomWidgets/custom_expansion_tile.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/CommomWidgets/rounded_rupee_Symbol_widget.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/OrderHistory/order_history_page.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _drawerHeader(context),
            _drawerBodyItem(icon: Icons.home, text: 'Home'),
            _drawerBodyItem(
                icon: Icons.account_circle,
                text: 'Movies',
                children: <Widget>[
                  _drawerBodyItem(icon: Icons.home, text: 'Continue Watching'),
                  _drawerBodyItem(icon: Icons.home, text: 'Trending'),
                  _drawerBodyItem(icon: Icons.home, text: 'Latest'),
                  _drawerBodyItem(icon: Icons.home, text: 'Popular'),
                  _drawerBodyItem(icon: Icons.home, text: 'Action'),
                  // _drawerBodyItem(icon: Icons.home, text: 'Hollywood'),
                  // _drawerBodyItem(icon: Icons.home, text: 'Asian'),
                  // _drawerBodyItem(icon: Icons.home, text: 'Dual Audio'),
                  // _drawerBodyItem(icon: Icons.home, text: 'Multi Audio'),
                  // _drawerBodyItem(icon: Icons.home, text: 'Marvel'),
                ]),
            _drawerBodyItem(
              icon: Icons.event_note,
              text: 'Web Series',
            ),
            // _drawerBodyItem(
            //     icon: Icons.event_note,
            //     text: 'Year',
            //     children: <Widget>[
            //       _drawerBodyItem(icon: Icons.home, text: 'Home'),
            //     ]),
            // _drawerBodyItem(
            //     icon: Icons.event_note,
            //     text: 'Genre',
            //     children: <Widget>[
            //       _drawerBodyItem(icon: Icons.home, text: 'Home'),
            //       _drawerBodyItem(icon: Icons.home, text: 'Home'),
            //     ]),
            // _drawerBodyItem(
            //     icon: Icons.event_note,
            //     text: 'TV Show',
            //     children: <Widget>[
            //       _drawerBodyItem(icon: Icons.home, text: 'Home'),
            //     ]),
            // _drawerBodyItem(
            //     icon: Icons.event_note,
            //     text: 'Kids',
            //     children: <Widget>[
            //       _drawerBodyItem(icon: Icons.home, text: 'Home'),
            //     ]),
          ],
        ),
      );

  void onMyPurchaseClick(BuildContext context) {
    _close(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OrderHistoryPage()));
  }

  void _close(BuildContext context) {
    Navigator.pop(context);
  }

  void onClose(BuildContext context) {
    Navigator.pop(context);
  }

  Widget _drawerHeader(BuildContext context) => CustomDrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () => onClose(context), icon: Icon(Icons.close)),
          ),
          // ColorFiltered(
          //   colorFilter: ColorFilter.matrix([
          //     1,
          //     -1,
          //     0,
          //     0,
          //     0,
          //     0,
          //     0.3,
          //     0,
          //     -0.1,
          //     0,
          //     0,
          //     -0.5,
          //     1,
          //     0.1,
          //     0,
          //     0,
          //     0,
          //     0,
          //     1,
          //     0,
          //   ]),
          //   child: ImageHelper(
          //     image: kSplashImage,
          //     imageType: ImageType.asset,
          //     height: 20.w,
          //     width: 50.w,
          //     boxFit: BoxFit.fill,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ImageHelper(
              image: kSplashImage,
              imageType: ImageType.asset,
              height: 16.w,
              width: 40.w,
              boxFit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w, top: 16.0, right: 8.w),
            child: CustomButton(
                onPressed: () => onMyPurchaseClick(context),
                icon: RoundedRupeeSymbolWidget(
                    borderColor: Colors.white,
                    fillColor: Colors.white,
                    textColor: primarybuttonColor),
                label: 'My Purchase'),
          )
        ],
      ));

  Widget _drawerBodyItem({
    required IconData icon,
    required String text,
    GestureTapCallback? onTap,
    List<Widget> children = const <Widget>[],
  }) =>
      (!children.isNotEmpty)
          ? ListTile(
              contentPadding: EdgeInsets.fromLTRB(18.w, 0.0, 18.w, 0.0),
              // leading: Icon(icon),
              title: AutoSizeText(text,
                  style:
                      // TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700)),
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300)),
              // onTap: onTap,
              onTap: () => _close(context))
          : ExpansionTile(
              tilePadding: EdgeInsets.fromLTRB(18.w, 0.0, 18.w, 0.0),
              // leading: Icon(icon),
              title: AutoSizeText(text,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
              children: children,
              collapsedIconColor: Colors.white,
              trailing: Icon(Icons.arrow_drop_down, size: 9.w),
            );
}
