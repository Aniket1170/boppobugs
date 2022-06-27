import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:flutter/material.dart';

class SettingsOptionHeaderWidget extends StatelessWidget {
  final String title;
  const SettingsOptionHeaderWidget({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0.0),
      child: AutoSizeText(title,
          style: TextStyle(
              color: Color(0xFF929292),
              fontSize: 9.sp,
              fontWeight: FontWeight.w400)));
}
