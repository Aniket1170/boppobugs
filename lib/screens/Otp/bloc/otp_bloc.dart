import 'package:boppo_stream/APIService/AuthApiService/AuthApiService.dart';
import 'package:boppo_stream/Chopper/ApiErrorMessage.dart';
import 'package:boppo_stream/screens/Login/model/LoginResponse.dart';
import 'package:boppo_stream/utils/app_preference.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final ApiErrorMessage _apiErrorMessage = ApiErrorMessage();
  final AppPreferences _preferences = AppPreferences();

  OtpBloc() : super(const OtpState()) {
    on<VerifyOtp>(_verifyOtp);

    on<ResendOtp>(_resendOtp);
  }

  void _verifyOtp(VerifyOtp event, Emitter<OtpState> emit) async {
    // try {
    emit(VerificationLoading());

    Map<String, dynamic> verifyOtpBody = {
      "mobile_no": '${event.mobileNumber}',
      "otp": "${event.otpValue}"
    };
    final Response<LoginResponse> _verifyOtpResponse =
        await AuthApiService.create().verifyOtp(verifyOtpBody);
    debugPrint("verifyOtp ${_verifyOtpResponse.body}");
    if (_verifyOtpResponse.isSuccessful) {
      // successful request
      final _body = _verifyOtpResponse.body;
      debugPrint("verifyOtp $_body");
      if (_body != null) {
        final _currentDateTime = DateTime.now();
        final DateFormat _inputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');

        var formattedDate = _inputFormat.format(_currentDateTime);
        _preferences.saveLastLoginCallTime(time: formattedDate);
        _preferences.setMobileNumber(number: event.mobileNumber);

        final _data = _verifyOtpResponse.body!.data.first.data;
        if (_verifyOtpResponse.statusCode != 205 &&
            _data != null &&
            _data.isNotEmpty) {
          _preferences.saveDob(dob: _data.first.dob ?? '');
          _preferences.saveUserId(userId: _data.first.userId?.toString() ?? '');
          _preferences.saveFullName(name: _data.first.userName ?? '');
          _preferences.saveGender(
              gender: (_data.first.gender == 1) ? "Male" : "Female");
        }

        _preferences.setLoggedIn(isLogin: true);
        final storage = new FlutterSecureStorage();
        if (_body.data[0].accessToken != null)
          storage.write(key: token, value: _body.data[0].accessToken);
        if (_body.data[0].refreshToken != null)
          storage.write(key: refreshToken, value: _body.data[0].refreshToken);
        emit(VerificationSuccess(statusCode: _verifyOtpResponse.statusCode));
      }
    } else {
      // error from server
      final message = _apiErrorMessage.errorResponse(_verifyOtpResponse);
      emit(VerificationError(error: message));
    }
    // } catch (e) {
    //   emit(VerificationError(error: e.toString()));
    // }
  }

  void _resendOtp(ResendOtp event, Emitter<OtpState> emit) async {
    try {
      emit(VerificationLoading());

      Map<String, dynamic> resendBody = {
        "mobile_no": '${event.mobileNumber}',
        "country_code": "+91"
      };

      final Response<LoginResponse> _resendOtp =
          await AuthApiService.create().resendOtp(resendBody);
      debugPrint("resendOtp ${_resendOtp.body}");
      if (_resendOtp.isSuccessful) {
        // successful request
        final body = _resendOtp.body;
        debugPrint("resendOtp $body");
        if (body != null) {
          emit(ResendOtpSuccess());
        }
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_resendOtp);
        emit(VerificationError(error: message));
      }
    } catch (e) {
      emit(VerificationError(error: EXCEPTIONAL_MESSAGE));
    }
  }
}
