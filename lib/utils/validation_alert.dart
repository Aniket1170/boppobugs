import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';

void showValidationAlert(
  BuildContext context, {
  required String errorMessage,
  String? errorDescription,
  String buttonMessage = "Close",
  required Function() onClose,
  Function()? onPurchased,
  bool willPop = false,
  bool showPurchaseButton = false,
}) {
  // flutter defined function
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        backgroundColor: tileColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              AutoSizeText(
                errorMessage,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 8.sp),
              ),
              const SizedBox(height: 20),
              if (errorDescription != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: AutoSizeText(
                    errorDescription,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 6.sp),
                  ),
                ),
              if (showPurchaseButton)
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                      height: 40, width: double.infinity),
                  child: ElevatedButton(
                    child: AutoSizeText('Purchase Now'),
                    onPressed: onPurchased,
                  ),
                ),
              const SizedBox(height: 10),
              Container(
                width: 100,
                height: 40,
                child: TextButton(
                  child: AutoSizeText(buttonMessage),
                  onPressed: () {
                    onClose();
                    if (willPop) Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
