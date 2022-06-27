import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/build_app_bar.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/CommomWidgets/rounded_rupee_Symbol_widget.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/ContactUs/contact_us_page.dart';
import 'package:boppo_stream/screens/Login/login_page.dart';
import 'package:boppo_stream/screens/MyAccount/my_account_page.dart';
import 'package:boppo_stream/screens/OrderHistory/order_history_page.dart';
import 'package:boppo_stream/screens/Settings/settings_page.dart';
import 'package:boppo_stream/utils/app_preference.dart';
import 'package:boppo_stream/utils/confirmation_alert.dart';
import 'package:boppo_stream/utils/custom_icons.dart';
import 'package:boppo_stream/utils/progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/profile_bloc.dart';
import 'model/profile_option.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileBloc _profileBloc = ProfileBloc();
  final AppPreferences _preferences = AppPreferences();
  bool _isNotificationEnabled = true;
  String _fullName = '';

  Future<void> _getPrefsData() async {
    _isNotificationEnabled = await _preferences.isNotificationEnabled();
    await _preferences.getFullName().then((_value) {
      final _v = _value.split(' ');
      _fullName = (_v.isNotEmpty) ? _v[0] : _value;
    });
    setState(() {});
  }

  void _navToSettings() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SettingsPage(isNotificationEnabled: _isNotificationEnabled)));
  }

  @override
  void initState() {
    _getPrefsData();
    super.initState();
    // _profileBloc.add(GetProfile());
  }

  @override
  void dispose() {
    _profileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: BuildAppBar(
        showBackbutton: false,
        actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: _navToSettings)
        ],
      ),
      body: SafeArea(
        child: _buildProfileBloc(),
      ));

  // List<String> _optionList = [
  //   'My Account',
  //   'My Orders',
  //   'Notifications',
  //   'Contact Us',
  //   'Help Us',
  //   'About & Legal',
  //   'Logout'
  // ];

  List<ProfileOption> _optionList = [
    ProfileOption(Icon(CustomIcons.account), 'My Account'),
    ProfileOption(RoundedRupeeSymbolWidget(), 'My Purchase'),
    ProfileOption(Icon(Icons.messenger_outline), 'Contact Us'),
    ProfileOption(Icon(CustomIcons.logout), 'Log Out'),
  ];

  BlocConsumer<ProfileBloc, ProfileState> _buildProfileBloc() =>
      BlocConsumer<ProfileBloc, ProfileState>(
        bloc: _profileBloc,
        listener: (context, state) {
          if (state is ProfileLoading) {
            showProgressDialog(context);
          } else if (state is ProfileSuccess) {
            hideProgressDialog(context);
          } else if (state is ProfileError) {
            hideProgressDialog(context);
          }
        },
        builder: (context, state) => _buildBody(),
      );

  Widget _buildBody() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ImageHelper(
                  image: 'assets/images/profile_placeholder.png',
                  imageType: ImageType.asset,
                  imageShape: ImageShape.circle,
                  width: 30.w,
                  height: 30.w,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: AutoSizeText(
                    'Welcome $_fullName !!',
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                    onTap: () => _onOptionClick(index),
                    leading: _optionList[index].icon,
                    title: AutoSizeText(
                      _optionList[index].optionName,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 9.sp, fontWeight: FontWeight.w400),
                    ),
                    // trailing: (index == 2)
                    //     ? Switch(
                    //         value: _isNotificationEnabled,
                    //         onChanged: (_value) {
                    //           _preferences.setNotificationEnabled(
                    //               notificationEnabled: _value);
                    //           setState(() => _isNotificationEnabled = _value);
                    //         })
                    //     : Icon(Icons.arrow_forward_ios),
                  ),
              separatorBuilder: (context, index) => Divider(
                    height: 2.0,
                  ),
              itemCount: _optionList.length),
        ],
      );

  void _onOptionClick(int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyAccountPage()));
        break;

      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OrderHistoryPage()));
        break;

      // case 2:
      //   break;

      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ContactUsPage()));
        break;

      // case 4:
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => FaqPage()));
      //   break;

      // case 5:
      //   break;

      case 3:
        showConfirmationAlert(context,
            message: 'Are you sure you want to log out?', onAccept: () {
          _preferences.clearAll();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
              (_) => false);
        }, onReject: () {
          Navigator.pop(context);
        });
        break;
    }
  }
}
