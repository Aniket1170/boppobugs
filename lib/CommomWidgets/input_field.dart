import 'dart:io' show Platform;
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_keyboard_done.dart';

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final Color? labelColor;
  final TextEditingController? textEditingController;
  final Color? focusColor;
  final FocusNode? focusNode;
  final Color fillColor;
  final bool isFilled;
  Color? focusedBorderColor;
  Color? borderColor;
  final Color? hoverColor;
  final Color? textColor;
  final double fontSize;
  final Color? hintColor;
  final bool obscureText;
  final Function? onPressed;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool hasBorder;
  final double borderRadius;
  final double contentPadding;
  final bool multilines;
  final bool enabled;
  final bool autofocus;
  final bool showCursor;
  final double topPadding;
  final int? charLimit;
  final TextInputAction textInputAction;
  InputKeyboardDone _inputDone = InputKeyboardDone();

  InputField({
    this.hintText,
    this.textInputType,
    this.inputFormatters,
    this.textEditingController,
    this.focusNode,
    this.prefixIcon,
    this.focusColor,
    this.fillColor = Colors.white,
    this.focusedBorderColor,
    this.hintColor,
    this.hoverColor,
    this.textColor,
    this.borderColor,
    this.fontSize = 16.0,
    this.obscureText = false,
    this.onPressed,
    this.labelText,
    this.suffixIcon,
    this.hasBorder = true,
    this.borderRadius = 12.0,
    this.contentPadding = 0.0,
    this.labelColor,
    this.multilines = false,
    this.topPadding = 10.0,
    this.isFilled = true,
    this.onChanged,
    this.onSubmitted,
    this.charLimit,
    this.errorText,
    this.enabled = true,
    this.autofocus = true,
    this.showCursor = true,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS &&
        focusNode != null &&
        (this.textInputType == TextInputType.number ||
            this.textInputType == TextInputType.phone))
      focusNode?.addListener(() {
        if (focusNode!.hasFocus)
          _inputDone.showOverlay(context);
        else
          _inputDone.removeOverlay();
      });
    if (borderColor == null)
      this.borderColor = (Theme.of(context).brightness == Brightness.dark)
          ? Colors.white
          : Colors.black;
    if (focusedBorderColor == null)
      this.focusedBorderColor =
          (Theme.of(context).brightness == Brightness.dark)
              ? Colors.white
              : Colors.black;
    return TextField(
      keyboardType: this.textInputType,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      enabled: enabled,
      autofocus: autofocus,
      // maxLengthEnforced: false,
      focusNode: this.focusNode,
      controller: this.textEditingController,
      onSubmitted: this.onSubmitted,
      onChanged: this.onChanged,
      maxLength: this.charLimit,
      enableSuggestions: obscureText ? false : true,
      autocorrect:
          (obscureText || this.textInputType == TextInputType.emailAddress)
              ? false
              : true,
      obscureText: obscureText,
      showCursor: this.showCursor,
      cursorColor: Colors.black,
      textCapitalization:
          (obscureText || this.textInputType == TextInputType.emailAddress)
              ? TextCapitalization.none
              : TextCapitalization.sentences,
      maxLines: (this.multilines) ? null : 1, //for infinite lines
      decoration: InputDecoration(
        focusColor: this.focusColor,
        filled: this.isFilled,
        fillColor: this.fillColor,
        errorText: this.errorText,
        counterText: '', // to hide charLimit text
        counterStyle: TextStyle(color: this.borderColor),
        enabledBorder: (this.multilines)
            ? InputBorder.none
            : (!(this.hasBorder)
                ? UnderlineInputBorder(
                    borderSide: BorderSide(color: this.borderColor!),
                  )
                : OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(this.borderRadius)),
                    borderSide: BorderSide(color: this.borderColor!),
                  )),
        focusedBorder: (this.multilines)
            ? InputBorder.none
            : (!(this.hasBorder)
                ? UnderlineInputBorder(
                    borderSide: BorderSide(color: this.focusedBorderColor!),
                  )
                : OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(this.borderRadius)),
                    borderSide: BorderSide(color: this.focusedBorderColor!),
                  )),
        disabledBorder: (this.multilines)
            ? InputBorder.none
            : (!(this.hasBorder)
                ? UnderlineInputBorder(
                    borderSide: BorderSide(color: this.focusedBorderColor!),
                  )
                : OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(this.borderRadius)),
                    borderSide: BorderSide(color: this.focusedBorderColor!),
                  )),
        border: (this.multilines)
            ? InputBorder.none
            : (!(this.hasBorder)
                ? UnderlineInputBorder(
                    borderSide: BorderSide(color: this.borderColor!),
                  )
                : OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(this.borderRadius)),
                    borderSide: BorderSide(color: this.borderColor!),
                  )),
        suffixIcon: this.suffixIcon,
        prefixIcon: this.prefixIcon,
        labelText: this.labelText,
        hintText: this.hintText,
        labelStyle: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w400),
        hintStyle: TextStyle(
            fontSize: 11.sp,
            color: Colors.black.withOpacity(0.29),
            fontWeight: FontWeight.w400),
      ),
      style: TextStyle(
          fontSize: 11.sp, color: Colors.black, fontWeight: FontWeight.w400),
    );
  }
}

class KeyboardBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final FocusNode? node;
  final TextEditingController? controller;

  const KeyboardBarWidget({
    Key? key,
    this.node,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(),
        TextButton(
          child: Text(
            'Done',
            style: TextStyle(fontSize: 18.0),
          ),
          onPressed: () => node?.unfocus(),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
