import 'dart:async';

import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/utils/app_preference.dart';
import 'package:flutter/material.dart';

class WelcomeBackWidget extends StatefulWidget {
  final bool isNewRegistration;
  final String mobileNumber;

  WelcomeBackWidget(
      {Key? key, this.isNewRegistration = false, required this.mobileNumber})
      : super(key: key);

  @override
  _WelcomeBackWidgetState createState() => _WelcomeBackWidgetState();
}

class _WelcomeBackWidgetState extends State<WelcomeBackWidget> {
  late Timer _timer;
  final AppPreferences _appPreferences = AppPreferences();

  void _navToHome() {
    _timer = Timer(const Duration(milliseconds: 2500), () {
      _appPreferences.setWelcomebackShown(welcomeBackShown: true);
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    _navToHome();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black.withOpacity(0.45),
        extendBodyBehindAppBar: false,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: _buildLoginAlertBody(context),
        ),
      );

  Widget _buildLoginAlertBody(BuildContext context) => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: (this.widget.isNewRegistration)
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            if ((this.widget.isNewRegistration)) const SizedBox(height: 40),
            if (this.widget.isNewRegistration)
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFF395185).withOpacity(0.77),
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(10.0),
                child: AutoSizeText(
                  this.widget.isNewRegistration
                      ? 'You are logged in as \n\n +91 ${widget.mobileNumber}'
                      : 'You are logged in as ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            if ((this.widget.isNewRegistration)) const SizedBox(height: 80),
            Container(
              margin: const EdgeInsets.all(30.0),
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0)),
              child: Column(
                children: [
                  AutoSizeText(
                    this.widget.isNewRegistration ? 'Hurray' : 'Welcome back',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF395185),
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20),
                  Icon(
                    Icons.check_box_rounded,
                    color: Colors.lightBlue,
                    size: 48,
                  ),
                  const SizedBox(height: 20),
                  AutoSizeText(
                    '+91 ${this.widget.mobileNumber}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xFF395185),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 16),
                  AutoSizeText(
                    this.widget.isNewRegistration
                        ? 'Now you are signed up \n Successfully'
                        : 'Now You are logged in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 8.sp,
                        color: Color(0xFF395185),
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 16),
                  // if (!this.widget.isNewRegistration)
                  TextButton(
                    child: AutoSizeText(
                      'Thank You',
                      style: TextStyle(
                          color: Color(0xFFEC4823),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      _timer.cancel();
                      _appPreferences.setWelcomebackShown(
                          welcomeBackShown: true);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
