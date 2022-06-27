import 'package:boppo_stream/CommomWidgets/build_app_bar.dart';
import 'package:boppo_stream/screens/About/about_screen.dart';
import 'package:boppo_stream/screens/ContactUs/contact_us_page.dart';
import 'package:boppo_stream/screens/FAQs/faq_page.dart';
import 'package:boppo_stream/screens/Login/login_page.dart';
import 'package:boppo_stream/screens/Privacy/privacy_page.dart';
import 'package:boppo_stream/screens/TermsAndConditions/termsandconditions_page.dart';
import 'package:boppo_stream/utils/app_preference.dart';
import 'package:boppo_stream/utils/confirmation_alert.dart';
import 'package:flutter/material.dart';

import 'components/settings_option_header_widget.dart';
import 'components/settings_options_widget.dart';
import 'components/settings_tile_widget.dart';

class SettingsPage extends StatefulWidget {
  final bool isNotificationEnabled;
  const SettingsPage({Key? key, required this.isNotificationEnabled})
      : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AppPreferences _preferences = AppPreferences();
  bool _isNotificationEnabled = true;
  String _fullName = '';

  Future<void> _getPrefsData() async {
    // _isNotificationEnabled = await _preferences.isNotificationEnabled();
    _isNotificationEnabled = widget.isNotificationEnabled;
    setState(() {});
  }

  void _navToPage(Widget screenWidget) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => screenWidget));
  }

  void _navToFaqPage() {
    _navToPage(FaqPage());
  }

  void _navToPrivacyPage() {
    _navToPage(PrivacyPage());
  }

  void _navToContactUsPage() {
    _navToPage(ContactUsPage());
  }

  void _navToAboutPage() {
    _navToPage(AboutusPage());
  }

  void _navToTermsPage() {
    _navToPage(TermsAndConditionsPage());
  }

  void _onLogoutClick() {
    showConfirmationAlert(context, message: 'Are you sure you want to log out?',
        onAccept: () {
      _preferences.clearAll();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => LoginPage()), (_) => false);
    }, onReject: () {
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    _getPrefsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: BuildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SettingsTileWidget(
                children: [
                  SettingsOptionHeaderWidget(title: 'Support'),
                  SettingsOptionsWidget(
                      title: 'Help Us', onPressed: _navToFaqPage),
                  SettingsOptionsWidget(
                      title: 'Contact US', onPressed: _navToContactUsPage),
                ],
              ),
              SettingsTileWidget(
                children: [
                  SettingsOptionHeaderWidget(
                    title: 'Notifications',
                  ),
                  SettingsOptionsWidget(
                    title: 'Notification',
                    trailing: Switch(
                        value: _isNotificationEnabled,
                        activeTrackColor: Color(0xFFC4D7FF),
                        activeColor: Color(0xFF164DC5),
                        onChanged: (_value) {
                          _preferences.setNotificationEnabled(
                              notificationEnabled: _value);
                          setState(() => _isNotificationEnabled = _value);
                        }),
                  ),
                ],
              ),
              // SettingsTileWidget(
              //   children: [
              //     SettingsOptionHeaderWidget(
              //       title: 'Video and Subtitles',
              //     ),
              //     SettingsOptionsWidget(
              //       title: 'Auto Play',
              //       trailing: Switch(
              //           value: true,
              //           activeTrackColor: Color(0xFFC4D7FF),
              //           activeColor: Color(0xFF164DC5),
              //           onChanged: (_value) {
              //             _preferences.setNotificationEnabled(
              //                 notificationEnabled: _value);
              //             setState(() => _isNotificationEnabled = _value);
              //           }),
              //     ),
              //     SettingsOptionsWidget(
              //       title: 'Subtitles display',
              //       trailing: Switch(
              //           value: true,
              //           activeTrackColor: Color(0xFFC4D7FF),
              //           activeColor: Color(0xFF164DC5),
              //           onChanged: (_value) {
              //             // _preferences.setNotificationEnabled(
              //             //     notificationEnabled: _value);
              //             // setState(() => _isNotificationEnabled = _value);
              //           }),
              //     ),
              //   ],
              // ),
              SettingsTileWidget(
                children: [
                  SettingsOptionHeaderWidget(
                    title: 'About Boppo',
                  ),
                  SettingsOptionsWidget(
                    title: 'About Boppo',
                    onPressed: _navToAboutPage,
                  ),
                  SettingsOptionsWidget(
                    title: 'Terms & Conditions',
                    onPressed: _navToTermsPage,
                  ),
                  SettingsOptionsWidget(
                    title: 'FAQs',
                    onPressed: _navToFaqPage,
                  ),
                  SettingsOptionsWidget(
                    title: 'Privacy Policy',
                    onPressed: _navToPrivacyPage,
                  ),
                ],
              ),
              // SettingsTileWidget(
              //   children: [
              //     SettingsOptionHeaderWidget(
              //       title: 'Language',
              //     ),
              //     SettingsOptionsWidget(
              //       title: 'English',
              //       onPressed: _navToAboutPage,
              //     ),
              //     SettingsOptionsWidget(
              //       title: 'Hindi',
              //       onPressed: _navToAboutPage,
              //     ),
              //   ],
              // ),
              SettingsTileWidget(
                children: [
                  SettingsOptionsWidget(
                      title: 'Log Out', onPressed: _onLogoutClick)
                ],
              ),
            ],
          ),
        ),
      );
}
