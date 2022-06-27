import 'package:boppo_stream/APIService/AuthApiService/AuthApiService.dart';
import 'package:boppo_stream/Chopper/ApiErrorMessage.dart';
import 'package:boppo_stream/Implementation/base_dispose.dart';
import 'package:boppo_stream/main/model/RefreshTokenResponse.dart';
import 'package:boppo_stream/screens/Login/model/LoginResponse.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:boppo_stream/validators/Validators.dart';
import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>
    with Validators
    implements BaseDispose {
  ApiErrorMessage _apiErrorMessage = ApiErrorMessage();

  LoginBloc() : super(const LoginState()) {
    on<Login>(_doLogin);
    on<Upbasicdetail>(_doUpdateDetails);
  }

  final _controller = BehaviorSubject<String>();

  Stream<String> get submitField =>
      _controller.stream.transform(phoneNumberValidator);

  Function(String) get onFieldChanged => _controller.sink.add;

  void _doLogin(Login event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoading());

      Map<String, dynamic> registerBody = {
        "mobile_no": '${event.mobileNumber}',
        "country_code": "+91"
      };
      final Response<LoginResponse> _login =
          await AuthApiService.create().login(registerBody);
      debugPrint("login log ${_login.body}");
      if (_login.isSuccessful) {
        // successful request
        final body = _login.body;
        debugPrint("login log $body");
        if (body != null) {
          emit(LoginSuccess());
        }
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_login);
        emit(LoginError(error: message));
      }
    } catch (e) {
      emit(LoginError(error: EXCEPTIONAL_MESSAGE));
    }
  }

  void _doUpdateDetails(Upbasicdetail event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoading());

      Map<String, dynamic> _body = {
        "mobile_no": '${event.mobileNumber}',
        "age": event.age,
        // "user_dob": event.dateOfBirth,
        "gender": event.gender,
        "name": event.name
      };
      final Response<RefreshTokenResponse> _upbasicdetail =
          await AuthApiService.create().upbasicdetail(_body);
      debugPrint("login log ${_upbasicdetail.body}");
      if (_upbasicdetail.isSuccessful) {
        // successful request
        final body = _upbasicdetail.body;
        debugPrint("login log $body");
        if (body != null) {
          emit(LoginSuccess());
        }
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_upbasicdetail);
        emit(LoginError(error: message));
      }
    } catch (e) {
      emit(LoginError(error: EXCEPTIONAL_MESSAGE));
    }
  }

  @override
  void dispose() {
    _controller.close();
  }
}
