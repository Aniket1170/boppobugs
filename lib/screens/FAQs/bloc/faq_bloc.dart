import 'package:boppo_stream/APIService/FAQService/FAQService.dart';
import 'package:boppo_stream/Chopper/ApiErrorMessage.dart';
import 'package:boppo_stream/screens/FAQs/model/faq_response.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'faq_event.dart';
part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  ApiErrorMessage _apiErrorMessage = ApiErrorMessage();

  FaqBloc() : super(FaqInitial()) {
    on<GetFaq>(_doGetFaq);
  }

  void _doGetFaq(GetFaq event, Emitter<FaqState> emit) async {
    try {
      emit(FaqLoading());

      final Response<FAQResponse> _faqResponse =
          await FAQService.create().getFaq();
      debugPrint("faq log ${_faqResponse.body}");
      if (_faqResponse.isSuccessful) {
        // successful request
        final body = _faqResponse.body;
        debugPrint("faq log $body");
        if (body != null) {
          body.data;
          emit(FaqSuccess(data: body.data.toList()));
        } else {
          emit(FaqError(error: EXCEPTIONAL_MESSAGE));
        }
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_faqResponse);
        emit(FaqError(error: message));
      }
    } catch (e) {
      emit(FaqError(error: EXCEPTIONAL_MESSAGE));
    }
  }
}
