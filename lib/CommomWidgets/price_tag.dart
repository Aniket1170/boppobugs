import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  const PriceTag({
    Key? key,
    this.currentValue = 99,
    this.originalValue,
  }) : super(key: key);

  final num? currentValue;
  final num? originalValue;

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: BoxConstraints(minHeight: 20, minWidth: 50),
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 4.0),
            decoration: BoxDecoration(
              color: Color(0xFF000000).withOpacity(0.88),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Text.rich(
              (this.currentValue != null)
                  ? TextSpan(
                      text: '$currentValue $rupeeSymbol',
                      style:
                          TextStyle(color: Color(0xFFFFFFFF), fontSize: 8.sp),
                      children: <InlineSpan>[
                          if (originalValue != null)
                            TextSpan(
                                text: '$originalValue $rupeeSymbol',
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 8.sp,
                                    decoration: TextDecoration.lineThrough)),
                        ])
                  : TextSpan(
                      text: '$originalValue $rupeeSymbol',
                      style:
                          TextStyle(color: Color(0xFFFFFFFF), fontSize: 8.sp),
                    ),
            )),
      );
}
