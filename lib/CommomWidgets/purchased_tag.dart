import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:flutter/material.dart';

class PurchasedTag extends StatelessWidget {
  const PurchasedTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: BoxConstraints(minHeight: 20, minWidth: 50),
        child: Container(
            margin: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0.0),
            padding: const EdgeInsets.fromLTRB(6.0, 4.0, 6.0, 4.0),
            decoration: BoxDecoration(
              color: Color(0xFFFF2929),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: AutoSizeText(
              'Purchased',
              style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 6.sp),
            )),
      );
}
