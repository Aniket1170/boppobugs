import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';

class RoundedRupeeSymbolWidget extends StatelessWidget {
  const RoundedRupeeSymbolWidget(
      {Key? key,
      this.borderColor,
      this.fillColor = Colors.transparent,
      this.textColor = Colors.white})
      : super(key: key);
  final Color? borderColor;
  final Color? fillColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    Color _borderColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    if (this.borderColor != null) {
      _borderColor = this.borderColor!;
    }

    return Container(
      padding: EdgeInsets.all(1.2.w),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: this.fillColor,
          border: Border.all(color: _borderColor, width: 1.5)),
      child: AutoSizeText('$rupeeSymbol',
          style: TextStyle(color: this.textColor, fontSize: 13.sp)),
    );
  }
}
