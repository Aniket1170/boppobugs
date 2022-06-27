import 'package:boppo_stream/screens/Login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'validation_alert.dart';

void logoutUser(BuildContext context, int code,
    {required String errorMessage, bool willPop = false, bool showAlert = true}) async {
  // flutter defined function
  if (code == 401) {
    showValidationAlert(context,
        errorMessage: 'Your Session Has Timed Out',
        willPop: willPop, onClose: () async {
      SharedPreferences _myPrefs = await SharedPreferences.getInstance();
      await _myPrefs.clear();
      Navigator.pushAndRemoveUntil<void>(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false);
    });
  } else if (showAlert == true) {
    showValidationAlert(context, errorMessage: errorMessage, onClose: () {
      Navigator.pop(context);
    });
  }
}
