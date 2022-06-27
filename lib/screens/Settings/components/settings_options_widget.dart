import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:flutter/material.dart';

class SettingsOptionsWidget extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Widget? trailing;

  const SettingsOptionsWidget({
    Key? key,
    required this.title,
    this.onPressed,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        title: AutoSizeText(title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400)),
        trailing: trailing,
        onTap: onPressed,
      );
}
