import 'package:flutter/material.dart';

import 'flushbar.dart';
import 'flushbar_helper.dart';

void showSimpleFlushbar(BuildContext context,
    {required String title, required String message}) {
  FlushbarHelper.createInformation(
    title: title,
    message: message,
  ).show(context);
}

void showSuccessFlushbar(BuildContext context,
    {String? title, required String message}) {
  Flushbar(
    title: title,
    message: message,
    icon: Icon(
      Icons.check,
      size: 28,
      color: Colors.green.shade300,
    ),
    duration: Duration(seconds: 3),
  )..show(context);
}

void showErrorFlushbar(BuildContext context,
    {String? title, required String message}) {
  Flushbar(
    title: title,
    message: message,
    icon: Icon(
      Icons.error,
      size: 28,
      color: Colors.red.shade300,
    ),
    duration: Duration(seconds: 3),
  )..show(context);
}

void showFlushBarTitle(BuildContext context, {required String? title}) {
  Flushbar(
    message: title,
    // icon: Icon(
    //   Icons.check,
    //   size: 28,
    //   color: Colors.green.shade300,
    // ),
    // leftBarIndicatorColor: Colors.blue.shade300,
    duration: Duration(seconds: 4),
  )..show(context);
}

void showCustomFlushBarTitle(BuildContext context, {required String title}) {
  Flushbar(
    messageText: Text(
      title,
      style: const TextStyle(color: Colors.black, fontSize: 16.0),
    ),
    padding: const EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 20.0),
    margin: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 90.0),
    borderRadius: BorderRadius.circular(20),
    backgroundColor: Colors.white,
    borderColor: Color(0xFF58CBF5),
    borderWidth: 2,
    duration: const Duration(seconds: 3),
  )..show(context);
}

void showFlushBarMessage(BuildContext context, {required String title}) {
  Flushbar(
    message: title,
    // icon: Icon(
    //   Icons.check,
    //   size: 28,
    //   color: Colors.green.shade300,
    // ),
    // leftBarIndicatorColor: Colors.blue.shade300,
    duration: Duration(seconds: 4),
  )..show(context);
}

void showFlushBarNoConnection(BuildContext context) {
  Flushbar(
    message: "Check your internet connection",
    // icon: Icon(
    //   Icons.check,
    //   size: 28,
    //   color: Colors.green.shade300,
    // ),
    // leftBarIndicatorColor: Colors.blue.shade300,
    duration: Duration(seconds: 4),
  )..show(context);
}

void showFloatingFlushbar(BuildContext context,
    {required String title, required String message}) {
  Flushbar(
    padding: EdgeInsets.all(10),
    // borderRadius: 8,
    // backgroundGradient: Gradients.greenHorizontalLinear,
    boxShadows: [
      BoxShadow(
        color: Colors.black45,
        offset: Offset(3, 3),
        blurRadius: 3,
      ),
    ],
    // All of the previous Flushbars could be dismissed by swiping down
    // now we want to swipe to the sides
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    // The default curve is Curves.easeOut
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    title: title,
    message: message,
  )..show(context);
}
