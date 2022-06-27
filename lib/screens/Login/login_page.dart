import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/custom_button.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/CommomWidgets/input_field.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/Login/bloc/login_bloc.dart';
import 'package:boppo_stream/screens/Otp/otp_page.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:boppo_stream/utils/hide_keyboard.dart';
import 'package:boppo_stream/utils/progress_loader.dart';
import 'package:boppo_stream/utils/validation_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final LoginBloc _loginBloc = LoginBloc();
  final FocusNode _phoneNumberNode = FocusNode();

  void _navToOtp() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OtpPage(mobileNumber: this._textEditingController.text)));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberNode.dispose();
    _textEditingController.dispose();
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            // gradient: blueGradient,
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/gradinet_background.png',
                ),
                fit: BoxFit.fill),
          ),
          height: 100.h,
          child: SingleChildScrollView(
            child: _buildLoginBloc(),
          ),
        ),
      );

  BlocConsumer<LoginBloc, LoginState> _buildLoginBloc() =>
      BlocConsumer<LoginBloc, LoginState>(
        bloc: _loginBloc,
        listener: (context, state) {
          if (state is LoginLoading) {
            showProgressDialog(context);
          }

          if (state is LoginSuccess) {
            hideProgressDialog(context);
            _navToOtp();
          }

          if (state is LoginError) {
            hideProgressDialog(context);
            showValidationAlert(context, errorMessage: state.error,
                onClose: () {
              Navigator.pop(context);
            });
          }
        },
        builder: (context, state) => _buildBody(),
      );

  Widget _buildBody() => Column(
        children: [
          const SizedBox(height: 100),
          ImageHelper(
            image: kSplashImage,
            imageType: ImageType.asset,
            height: 40.w,
            width: 60.w,
          ),
          const SizedBox(height: 30),
          _phoneNumberWidget()
        ],
      );

  StreamBuilder<String> _phoneNumberWidget() => StreamBuilder<String>(
        stream: _loginBloc.submitField,
        builder: (context, snapshot) => Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          height: 80.h,
          decoration: BoxDecoration(
              color: tileColor.withOpacity(0.67),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0))),
          child: Column(
            children: [
              const SizedBox(height: 80),
              Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  'LOG IN',
                  style: TextStyle(
                      fontSize: 26.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 25),
              InputField(
                borderColor: Colors.transparent,
                textEditingController: _textEditingController,
                prefixIcon: Container(
                  width: 12.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // SizedBox(width: 0.5.w),
                      AutoSizeText('+91',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.black,
                          )),
                      // Transform.rotate(
                      //     angle: ((3 * math.pi) / 2),
                      //     child: Icon(Icons.arrow_back_ios_outlined,
                      //         color: Colors.black)),
                      SizedBox(width: 0.9.w),
                    ],
                  ),
                ),
                focusNode: _phoneNumberNode,

                hintText: "Phone number",
                errorText: snapshot.error as String?,
                // onChanged: _loginBloc.onFieldChanged,
                charLimit: 10,
                textInputType: TextInputType.phone,
              ),
              const SizedBox(height: 50),
              CustomButton(
                  label: 'Get OTP', onPressed: () => _onContinue(snapshot)),
              const SizedBox(height: 25),
              // Align(
              //   alignment: Alignment.center,
              //   child: AutoSizeText(
              //     'OR',
              //     style: TextStyle(
              //         fontSize: 16.sp,
              //         color: Colors.white,
              //         fontWeight: FontWeight.w500),
              //   ),
              // ),
              // const SizedBox(height: 15),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset('assets/icons/google.png'),
              //     SizedBox(width: 30),
              //     Image.asset('assets/icons/insta.png'),
              //     SizedBox(width: 30),
              //     Image.asset('assets/icons/twitter.png'),
              //   ],
              // )
            ],
          ),
        ),
      );

  // String? _countryCode = '+91';
  // Widget _dropdown() {
  //   return Container(
  //     padding: const EdgeInsets.all(0.0),
  //     child: DropdownButton<String>(
  //       value: _countryCode,
  //       //elevation: 5,
  //       icon: Transform.rotate(
  //           angle: ((3 * math.pi) / 2),
  //           child: Icon(
  //             Icons.arrow_back_ios_outlined,
  //             size: 24.0,
  //           )),
  //       style: TextStyle(color: Colors.black),
  //       items: <String>[
  //         '+91',
  //       ].map<DropdownMenuItem<String>>((String value) {
  //         return DropdownMenuItem<String>(
  //           value: value,
  //           child: Text(value),
  //         );
  //       }).toList(),
  //       onChanged: (String? value) {
  //         setState(() {
  //           _countryCode = value;
  //         });
  //       },
  //     ),
  //   );
  // }

  void _onContinue(AsyncSnapshot<String> snapshot) {
    hideKeyboard(context);
    _loginBloc.onFieldChanged(_textEditingController.text);
    if (!snapshot.hasError && _textEditingController.text != '')
      _loginBloc.add(Login(mobileNumber: _textEditingController.text));
  }
}
