import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';

typedef void AcceptClick();
typedef void RejectClick();

void showConfirmationAlert(
  BuildContext context, {
  required String message,
  String acceptLabel = 'Log out',
  String rejectLabel = 'Cancel',
  Color labelColor = Colors.lightBlue,
  bool hasSelectionList = false,
  required AcceptClick onAccept,
  required RejectClick onReject,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.75),
    barrierDismissible: false,
    builder: (_) => Theme(
      data:
          Theme.of(context).copyWith(dialogBackgroundColor: Colors.transparent),
      child: Dialog(
        insetPadding: const EdgeInsets.only(left: 20.0, right: 16.0),
        backgroundColor: tileColor,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              AutoSizeText(
                message,
                style: TextStyle(fontSize: 12.sp, color: Colors.white),
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: onReject,
                    child: Container(
                      height: 5.h,
                      width: 20.w,
                      child: Center(
                          child: AutoSizeText(
                        rejectLabel,
                        style: TextStyle(fontSize: 10.sp, color: Colors.white),
                      )),
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  InkWell(
                    onTap: onAccept,
                    child: Container(
                      height: 5.h,
                      width: 20.w,
                      child: Center(
                          child: AutoSizeText(
                        acceptLabel,
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
