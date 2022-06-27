import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/build_app_bar.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);
  final String _aboutText =
      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus pellentesque laoreet cum nunc vestibulum amet. Scelerisque auctor natoque morbi scelerisque pulvinar a donec. Ac placerat erat lectus arcu interdum euismod. Aliquet urna, nisl integer quis.''';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: BuildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText('BOPPO STREAM Privacy',
                    style: TextStyle(fontSize: 14.sp)),
              ),
              SizedBox(height: 2.5.h),
              AutoSizeText(_aboutText, style: TextStyle(fontSize: 12.sp)),
              SizedBox(height: 1.5.h),
              AutoSizeText(_aboutText, style: TextStyle(fontSize: 12.sp)),
              SizedBox(height: 8.h),
              ImageHelper(
                image: kSplashImage,
                imageType: ImageType.asset,
                height: 20.w,
                width: 50.w,
                boxFit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ));
}
