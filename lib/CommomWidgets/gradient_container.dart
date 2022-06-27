import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 40.h,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
              0.0,
              0.2,
              0.4,
              0.6,
              0.8,
              1.0
            ],
                colors: [
              Colors.black26,
              Colors.black26,
              primarybackgroundColor.withOpacity(0.6),
              primarybackgroundColor.withOpacity(0.8),
              primarybackgroundColor,
              primarybackgroundColor,
              // primarybackgroundColor,
              // Theme.of(context).brightness == Brightness.dark
              //     ? Colors.black26
              //     : Colors.white30,
              // Theme.of(context).brightness == Brightness.dark
              //     ? Colors.black26
              //     : Colors.white38,
              // Theme.of(context).brightness == Brightness.dark
              //     ? Colors.black38
              //     : Colors.white38,
              // Theme.of(context).brightness == Brightness.dark
              //     ? Colors.black45
              //     : Colors.white54,
              // Theme.of(context).brightness == Brightness.dark
              //     ? Colors.black54
              //     : Colors.white60,
              // Theme.of(context).brightness == Brightness.dark
              //     ? Colors.black
              //     : Colors.white,
            ])),
      );
}
