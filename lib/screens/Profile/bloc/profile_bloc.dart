import 'package:boppo_stream/APIService/ProfileApiService/ProfileApiService.dart';
import 'package:boppo_stream/Chopper/ApiErrorMessage.dart';
import 'package:boppo_stream/screens/Profile/model/ProfileResponse.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ApiErrorMessage _apiErrorMessage = ApiErrorMessage();

  ProfileBloc() : super(const ProfileState()) {
    on<GetProfile>(_getProfileData);
  }

  void _getProfileData(GetProfile event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileLoading());

      final Response<ProfileResponse> _login =
          await ProfileApiService.create().getprofile();
      debugPrint("login log ${_login.body}");
      if (_login.isSuccessful) {
        // successful request
        final body = _login.body;
        debugPrint("login log $body");
        if (body != null) {
          emit(ProfileSuccess());
        }
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_login);
        emit(ProfileError(error: message));
      }
    } catch (e) {
      emit(ProfileError(error: EXCEPTIONAL_MESSAGE));
    }
  }
}
