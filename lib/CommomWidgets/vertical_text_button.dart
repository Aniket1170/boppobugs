import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:flutter/material.dart';

class VerticalTextButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final bool isSelected;
  final bool showBorder;
  final Function()? onTap;
  const VerticalTextButton({
    Key? key,
    this.icon = Icons.list_alt,
    required this.label,
    this.onTap,
    this.isSelected = false,
    this.showBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: showBorder ? Colors.white : Colors.transparent,
                      width: 2.0),
                  shape: BoxShape.circle),
              child: Icon(
                icon,
                // color: isSelected ? Color(0xFF2ECC71) : Colors.lightBlue,
              ),
            ),
            const SizedBox(height: 8.0),
            AutoSizeText(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  // color: isSelected ? Color(0xFF2ECC71) : Color(0xFF8B8B8B),
                  fontSize: 8.sp),
            )
          ],
        ),
      );
}
