import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/custom_button.dart';
import 'package:boppo_stream/CommomWidgets/custom_check_list_tile.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/CommomWidgets/input_field.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/Home/home_tab_page.dart';
import 'package:boppo_stream/screens/Login/create_new_user_details.dart';
import 'package:boppo_stream/screens/Otp/bloc/otp_bloc.dart';
import 'package:boppo_stream/screens/TermsAndConditions/termsandconditions_page.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:boppo_stream/utils/hide_keyboard.dart';
import 'package:boppo_stream/utils/progress_loader.dart';
import 'package:boppo_stream/utils/validation_alert.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

const _otpRange = 6;

class OtpPage extends StatefulWidget {
  final String mobileNumber;
  const OtpPage({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final OtpBloc _bloc = OtpBloc();
  final _intRegex = RegExp(r'\d+', multiLine: true);

  final TextEditingController _textEditingController = TextEditingController();

  String _smsCode = '';
  late Timer _timer;
  int _startTiming = START_TIMING;

  // get signature code
  void _getSignatureCode() async {
    String? signature = await SmsVerification.getAppSignature();
    log("signature $signature");
  }

  /// listen sms
  void _startListeningSms() {
    SmsVerification.startListeningSms().then((message) {
      setState(() {
        _smsCode = SmsVerification.getCode(message, _intRegex);
        _textEditingController.text = _smsCode;
        _onOtpCallBack(_smsCode, true);
      });
    });
  }

  void _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() => this._smsCode = otpCode);
    if (otpCode.length == _otpRange) {
      _bloc.add(
          VerifyOtp(mobileNumber: widget.mobileNumber, otpValue: _smsCode));
    }
  }

  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_startTiming < 1) {
            timer.cancel();
          } else {
            _startTiming = _startTiming - 1;
          }
        },
      ),
    );
  }

  void _restartTimer() {
    setState(() {
      this._startTiming = START_TIMING;
    });
    _timer.cancel();
    this._startTimer();
  }

  void _onVerifyOtp() {
    _bloc.add(VerifyOtp(
        mobileNumber: this.widget.mobileNumber,
        otpValue: _textEditingController.text));
  }

  void _onResendOtp() {
    if (_timer.isActive == false) {
      setState(() => _textEditingController.text = '');
      _bloc.add(ResendOtp(mobileNumber: this.widget.mobileNumber));
    }
  }

  void _navToWidget(Widget w) {
    hideKeyboard(context);
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => w), (_) => false);
  }

  void _onEditNumber() {
    Navigator.pop(context);
  }

  bool _tcChecked = false;

  void _tcCheckChanged(bool? value) {
    setState(() {
      _tcChecked = !_tcChecked;
    });
  }

  void _navToTermsPage() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => TermsAndConditionsPage()));
  }

  @override
  void initState() {
    super.initState();
    _startTimer();

    if (Platform.isAndroid) {
      _getSignatureCode();
      _startListeningSms();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _bloc.close();
    _textEditingController.dispose();
    if (Platform.isAndroid) {
      SmsVerification.stopListening();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            // gradient: blackGradient,
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/gradinet_background.png',
                ),
                fit: BoxFit.fill),
          ),
          child: SingleChildScrollView(
            child: _buildOtpBloc(),
          ),
        ),
      );

  BlocConsumer<OtpBloc, OtpState> _buildOtpBloc() =>
      BlocConsumer<OtpBloc, OtpState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is VerificationLoading) {
            showProgressDialog(context);
          }

          if (state is VerificationSuccess) {
            hideProgressDialog(context);
            if (state.statusCode == 205) {
              _navToWidget(CreateNewUserDetailsPage(
                mobileNumber: this.widget.mobileNumber,
              ));
            } else {
              _navToWidget(HomeTabPage());
            }
          }

          if (state is ResendOtpSuccess) {
            hideProgressDialog(context);
            _restartTimer();
          }

          if (state is VerificationError) {
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
          const SizedBox(height: 150),
          ImageHelper(
            image: kSplashImage,
            imageType: ImageType.asset,
            height: 40.w,
            width: 60.w,
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            height: 80.h,
            decoration: BoxDecoration(
                color: tileColor.withOpacity(0.67),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    'Enter OTP',
                    style: TextStyle(
                        fontSize: 26.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 20.0),
                AutoSizeText('Enter the 6 digit code sent to',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                    )),
                const SizedBox(height: 5.0),
                Row(
                  children: [
                    AutoSizeText('+91 ${this.widget.mobileNumber}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                          color: Colors.white,
                        )),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap: _onEditNumber,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 4.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white))),
                        child: Row(
                          children: [
                            Icon(Icons.edit, size: 5.w),
                            const SizedBox(width: 5.0),
                            AutoSizeText('Edit number',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8.sp,
                                  color: Colors.white,
                                )),
                            const SizedBox(width: 4.0),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                InputField(
                  borderColor: Colors.transparent,
                  textEditingController: _textEditingController,
                  // focusNode: _phoneNumberNode,
                  // onChanged: _loginBloc.onFieldChanged,
                  textInputType: TextInputType.phone,
                  obscureText: true,
                ),
                // TextFieldPin(
                //     textController: _textEditingController,
                //     autoFocus: true,
                //     codeLength: 6,
                //     alignment: MainAxisAlignment.center,
                //     defaultBoxSize: 12.w,
                //     margin: 4.0,
                //     selectedBoxSize: 12.w,
                //     textStyle: TextStyle(fontSize: 12.sp, color: Colors.black),
                //     defaultDecoration: _pinPutDecoration,
                //     selectedDecoration: _pinPutDecoration,
                //     onChange: (code) {
                //       _onOtpCallBack(code, false);
                //     }),
                // const SizedBox(height: 20.0),
                // (_timer?.isActive ?? false)
                //     ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AutoSizeText(
                        '00:${_startTiming.toString().padLeft(2, '0')}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.white,
                        )),
                    const SizedBox(width: 10.0),
                    TextButton(
                        child: AutoSizeText("Resend OTP",
                            style: TextStyle(
                              fontSize: 6.sp,
                              color: Colors.white,
                            )),
                        onPressed: () => _onResendOtp())
                  ],
                ),
                // : TextButton(
                //     child: AutoSizeText("Resend Code",
                //         style: TextStyle(fontSize: 6.sp)),
                //     onPressed: () => _onResendOtp()),
                CustomCheckboxListTile(
                    contentPadding:
                        const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    checkColor: tileColor,
                    activeColor: Colors.white,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _tcChecked,
                    onChanged: _tcCheckChanged,
                    title: RichText(
                      text: TextSpan(
                          text: 'I agree to ',
                          style: TextStyle(fontSize: 10.sp),
                          children: [
                            TextSpan(
                                text: 'term of use ',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => _navToTermsPage(),
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: primarybuttonColor)),
                            TextSpan(
                                text: 'and acknowledge that you have read our ',
                                style: TextStyle(fontSize: 10.sp)),
                            TextSpan(
                                text: 'Privacy Policy',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => _navToTermsPage(),
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: primarybuttonColor)),
                          ]),
                    )),

                const SizedBox(height: 30.0),
                CustomButton(label: 'Log In', onPressed: _onVerifyOtp),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      );

  BoxDecoration get _pinPutDecoration => BoxDecoration(
        border: Border.all(color: Colors.white),
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      );
}
