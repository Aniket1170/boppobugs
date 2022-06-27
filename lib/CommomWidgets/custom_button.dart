import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final Widget? icon;
  const CustomButton(
      {Key? key, required this.onPressed, this.icon, this.label = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints:
            BoxConstraints.tightFor(height: 12.w, width: double.infinity),
        child: (icon != null)
            ? ElevatedButton.icon(
                icon: icon!,
                label: AutoSizeText(label,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                onPressed: onPressed)
            : ElevatedButton(
                child: AutoSizeText(label,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                onPressed: onPressed),
      );
}
