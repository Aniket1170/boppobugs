import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: TextButton.icon(
          icon: Icon(Icons.arrow_back),
          label: AutoSizeText(
            'Back',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 9.5.sp, fontWeight: FontWeight.w500),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        // child: Container(
        //   color: (Theme.of(context).brightness == Brightness.light)
        //       ? Colors.white38
        //       : Colors.black38,
        //   child: TextButton.icon(
        //     icon: Icon(Icons.arrow_back_ios_outlined),
        //     label: AutoSizeText(
        //       'Back',
        //       textAlign: TextAlign.start,
        //       style:
        //           TextStyle(fontSize: 6.sp, fontWeight: FontWeight.w600
        //               // color: Color(0xFF414141),
        //               ),
        //     ),
        //     onPressed: () => Navigator.pop(context),
        //   ),
        // ),
      );
}
