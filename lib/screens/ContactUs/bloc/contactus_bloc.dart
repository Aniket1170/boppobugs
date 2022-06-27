import 'package:boppo_stream/APIService/ContactUserService/ContactUserService.dart';
import 'package:boppo_stream/Chopper/ApiErrorMessage.dart';
import 'package:boppo_stream/screens/Details/model/NormalSuccessResponse.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

part 'contactus_event.dart';
part 'contactus_state.dart';

class ContactusBloc extends Bloc<ContactusEvent, ContactusState> {
  ApiErrorMessage _apiErrorMessage = ApiErrorMessage();

  ContactusBloc() : super(const ContactusInitial()) {
    on<Contactus>(_doContactUs);
  }

  void _doContactUs(Contactus event, Emitter<ContactusState> emit) async {
    try {
      emit(ContactusLoading());

      // Map<String, dynamic> body = {
      //   "about": event.message,
      //   "file": event.filePath,
      //   "user_id": "1"
      // };

      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('file', event.filePath);

      final Response<NormalSuccessResponse> _contactUs =
          await ContactUserService.create()
              .details(event.message, "1", multipartFile);
      debugPrint("contact log ${_contactUs.body}");
      if (_contactUs.isSuccessful) {
        // successful request
        final body = _contactUs.body;
        debugPrint("contact log $body");
        if (body != null) {
          emit(ContactusSuccess());
        }
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_contactUs);
        emit(ContactusError(error: message));
      }
    } catch (e) {
      emit(ContactusError(error: EXCEPTIONAL_MESSAGE));
    }
  }
}
