import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:flutter/material.dart';

class PersonImageTopWidget extends StatelessWidget {
  const PersonImageTopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 70, left: 25, bottom: 20),
        child: Column(
          children: [
            ImageHelper(
              image: 'assets/images/stream_placeholder.png',
              imageType: ImageType.asset,
              height: 40.w,
              width: 60.w,
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                'LOG IN',
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      );
}
