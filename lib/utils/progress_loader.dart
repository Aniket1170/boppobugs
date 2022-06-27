import 'package:flutter/material.dart';

/// to show progress of asyc call
void showProgressDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(12.0),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    ),
  );
}

/// to hide progress of asyc call
void hideProgressDialog(BuildContext context) {
  // Hide the progress dialog
  Navigator.of(context).pop(); //maybePop -> to not pop always
}
