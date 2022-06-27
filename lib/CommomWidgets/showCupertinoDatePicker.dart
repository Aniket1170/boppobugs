export 'dart:ui' show ImageFilter;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showCupertinoDatePicker(
  BuildContext context, {
  Key? key,
  CupertinoDatePickerMode mode = CupertinoDatePickerMode.dateAndTime,
  required Function(DateTime value) onDateTimeChanged,
  required DateTime initialDateTime,
  DateTime? minimumDate,
  DateTime? maximumDate,
  int minimumYear = 1,
  int? maximumYear,
  int minuteInterval = 1,
  bool use24hFormat = false,
  Color? backgroundColor,
  // ImageFilter filter,
  bool useRootNavigator = true,
  bool? semanticsDismissible,
  Widget? cancelText,
  Widget? doneText,
  bool useText = false,
  bool leftHanded = false,
}) {
  // Default to right now.
  // initialDateTime ??= DateTime.now();

  if (!useText) {
    cancelText = Icon(CupertinoIcons.clear_circled);
  } else {
    if (cancelText == null)
      cancelText = Text(
        'Cancel',
        style: CupertinoTheme.of(context).textTheme.actionTextStyle.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
      );
  }

  if (!useText) {
    doneText = Icon(CupertinoIcons.check_mark_circled);
  } else {
    if (doneText == null)
      doneText = Text(
        'Save',
        style: CupertinoTheme.of(context)
            .textTheme
            .actionTextStyle
            .copyWith(fontWeight: FontWeight.w600),
      );
  }

  var cancelButton = CupertinoButton(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: cancelText,
    onPressed: () {
      // onDateTimeChanged(DateTime(0000, 01, 01, 0, 0, 0, 0, 0));
      Navigator.of(context).pop();
    },
  );

  var doneButton = CupertinoButton(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: doneText,
    onPressed: () {
      onDateTimeChanged(initialDateTime);
      Navigator.of(context).pop();
    },
  );

  //
  showCupertinoModalPopup(
    context: context,
    builder: (context) => Container(
      color: Colors.white,
      height: 240.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(249, 249, 247, 1.0),
              border: Border(
                bottom: const BorderSide(width: 0.5, color: Colors.black38),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                leftHanded ? doneButton : cancelButton,
                leftHanded ? cancelButton : doneButton,
              ],
            ),
          ),
          Expanded(
              child: CupertinoDatePicker(
            key: key,
            mode: mode,
            onDateTimeChanged: (DateTime value) {
              // if (onDateTimeChanged == null) return;
              if (mode == CupertinoDatePickerMode.time) {
                onDateTimeChanged(
                    DateTime(0000, 01, 01, value.hour, value.minute));
              } else {
                initialDateTime = value;
                onDateTimeChanged(value);
              }
            },
            initialDateTime: initialDateTime,
            minimumDate: minimumDate,
            maximumDate: maximumDate,
            minimumYear: minimumYear,
            maximumYear: maximumYear,
            minuteInterval: minuteInterval,
            use24hFormat: use24hFormat,
            backgroundColor: backgroundColor,
          )),
        ],
      ),
    ),
    // filter: filter,
    useRootNavigator: useRootNavigator,
    semanticsDismissible: semanticsDismissible,
  );
}
