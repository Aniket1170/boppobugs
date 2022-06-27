import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'back_button_widget.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackbutton;
  final String title;
  final List<Widget>? actions;
  const BuildAppBar(
      {Key? key, this.showBackbutton = true, this.title = '', this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Brightness brightness = themeData.brightness;
    final SystemUiOverlayStyle overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;
    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Material(
          elevation: 0.0,
          child: Semantics(
            explicitChildNodes: true,
            child: SafeArea(
              child: AppBar(
                elevation: 0,
                titleSpacing: 16.0,
                automaticallyImplyLeading: false,
                leadingWidth: 25.w,
                centerTitle: true,
                backgroundColor: primarybackgroundColor,
                title: AutoSizeText(
                  title,
                  textAlign: TextAlign.start,
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
                ),
                leading: showBackbutton
                    ? BackButtonWidget(context: context)
                    : Container(),
                actions: actions,
              ),
            ),
          ),
        ),
      ),
    );
    // return ;
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
