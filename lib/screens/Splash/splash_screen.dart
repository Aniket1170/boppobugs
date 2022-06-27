import 'dart:async';

import 'package:boppo_stream/APIService/AuthApiService/AuthApiService.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/main/model/RefreshTokenResponse.dart';
import 'package:boppo_stream/screens/Home/home_tab_page.dart';
import 'package:boppo_stream/screens/Login/login_page.dart';
import 'package:boppo_stream/utils/app_preference.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = new FlutterSecureStorage();

  final DateFormat inputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');

  bool _isLoggedIn = false;

  void _checkTime() async {
    _isLoggedIn = await AppPreferences().isLoggedIn();

    if (_isLoggedIn == true) {
      final d = await AppPreferences().getLastLoginCallTime();
      final currentTime = DateTime.now();

      var parsedDate = inputFormat.parse(d);
      var difference = currentTime.difference(parsedDate);
      // if (difference.inHours >= 20) {
      if (difference.inSeconds >= 30) {
        print('GetnewToken_if');
        _getNewToken();
      } else {
        print('OldToken_else');
        Future.delayed(Duration(milliseconds: 2000), () {
          _navToHomePage();
        });
      }
    } else {
      _navToLoginPage();
    }
  }

  void _getNewToken() async {
    print('newTokenfinal');

    final mobileNumber = await AppPreferences().getMobileNumber();

    try {
      Map<String, dynamic> loginBody = {
        "mobile_no": mobileNumber,
        "country_code": "+91"
      };
      debugPrint('$loginBody');
      final Response<RefreshTokenResponse> _login =
          await AuthApiService.create().refreshToken(loginBody);
      print('already registered getting loginResponse...');

      if (_login.isSuccessful) {
        // successful request
        if (_login.body != null) {
          final data = _login.body?.data;
          debugPrint('$data');
          if (data != null && data.isNotEmpty) {
            if (data[0].accessToken != null)
              await storage.write(key: token, value: data[0].accessToken);
            if (data[0].refreshToken != null)
              await storage.write(
                  key: refreshToken, value: data[0].refreshToken);
            final currentDateTime = DateTime.now();
            var formattedDate = inputFormat.format(currentDateTime);
            AppPreferences().saveLastLoginCallTime(time: formattedDate);
            _navToHomePage();
          }
        }
      } else {
        // error from server
        final code = _login.statusCode;
        print("code: $code");

        final Map<String, dynamic> error = _login.error as Map<String, dynamic>;
        final e = error['errors'][0]['message'] ?? 'error';
        print("AppLaunch Error: $e");
        _navToHomePage();
      }
    } catch (e) {
      debugPrint("AppLaunch Error: $e");
      _navToHomePage();
    }
  }

  void _navToLoginPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void _navToHomePage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeTabPage()));
  }

  @override
  void initState() {
    super.initState();
    _checkTime();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          // child: ColorFiltered(
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
          //   child: Image.asset(
          //     kSplashImage,
          //     width: 208,
          //     height: 156,
          //   ),
          // ),
          child: ImageHelper(
            image: kSplashImage,
            imageType: ImageType.asset,
            height: 30.w,
            width: 60.w,
            boxFit: BoxFit.fill,
          ),
        ),
      );
}
