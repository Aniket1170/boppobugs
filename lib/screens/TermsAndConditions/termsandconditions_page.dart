import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/build_app_bar.dart';
import 'package:boppo_stream/CommomWidgets/custom_button.dart';
import 'package:boppo_stream/CommomWidgets/custom_check_list_tile.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:boppo_stream/utils/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  final String _tcData = """<div>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus pellentesque laoreet cum nunc vestibulum amet. Scelerisque auctor natoque morbi scelerisque pulvinar a donec. Ac placerat erat lectus arcu interdum euismod. Aliquet urna, nisl integer quis.</p>
        <ul>
          <li> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus pellentesque laoreet cum nunc vestibulum amet. Scelerisque auctor natoque morbi scelerisque pulvinar a donec. Ac placerat erat lectus arcu interdum euismod. Aliquet urna, nisl integer quis.</li>
        </ul>
        <!--You can pretty much put any html in here!-->
      </div>""";

  bool _termsChecked = false;
  bool _privacyChecked = false;

  void _onTermsCheckChanged(bool? value) {
    setState(() {
      _termsChecked = !_termsChecked;
    });
  }

  void _onPrivacyCheckChanged(bool? value) {
    setState(() {
      _privacyChecked = !_privacyChecked;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: BuildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Row(
              children: [
                AutoSizeText('Term & Conditions',
                    style: TextStyle(fontSize: 14.sp)),
                SizedBox(width: 4.w),
                FaIcon(CustomIcons.check_box)
              ],
            ),
            SizedBox(height: 2.h),
            HtmlWidget(_tcData),
            SizedBox(height: 2.h),
            CustomCheckboxListTile(
                contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                checkColor: tileColor,
                activeColor: Colors.white,
                controlAffinity: ListTileControlAffinity.leading,
                value: _termsChecked,
                onChanged: _onTermsCheckChanged,
                title: AutoSizeText('I agree with term & conditions',
                    style: TextStyle(fontSize: 10.sp))),
            CustomCheckboxListTile(
                contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                checkColor: tileColor,
                activeColor: Colors.white,
                controlAffinity: ListTileControlAffinity.leading,
                value: _privacyChecked,
                onChanged: _onPrivacyCheckChanged,
                title: AutoSizeText('I agree with Privacy policy',
                    style: TextStyle(fontSize: 10.sp))),
            SizedBox(height: 2.h),
            CustomButton(
              onPressed: () => Navigator.pop(context),
              label: 'Submit',
            )
          ]),
        ),
      ));
}
