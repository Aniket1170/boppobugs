import 'dart:async';

import 'package:boppo_stream/utils/const.dart';

mixin Validators {
  var nameValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    // Pattern patternName = r'(^[A-Za-z]\\w{0,20}$)'; //{10,12}$
    // RegExp regexName = new RegExp(patternName);

    // if (regexName.hasMatch(value)) {
    //   sink.add(value);
    // } else {
    //   sink.addError(NAME_VALIDATION_MESSAGE);
    // }
    if (value != '') {
      sink.add(value);
    } else {
      sink.addError(EMPTY_FIELD_MESSAGE);
    }
  });

  var emptyValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value != '') {
      sink.add(value);
    } else {
      sink.addError(EMPTY_FIELD_MESSAGE);
    }
  });

  /// to do detect type of input and find error in input
  var randomValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value != '') {
      String patternEmail =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regexEmail = RegExp(patternEmail);
      String pattternMobile = r'(^(?:[+0]9)?[0-9]{10}$)'; //{10,12}$
      RegExp regexMobile = new RegExp(pattternMobile);
      if (value.contains("@")) {
        if (!regexEmail.hasMatch(value)) {
          sink.addError(EMAIL_VALIDATION_MESSAGE);
        } else {
          sink.add(value);
        }
      } else {
        if (!regexMobile.hasMatch(value)) {
          sink.addError(PHONE_VALIDATION_MESSAGE);
        } else {
          sink.add(value);
        }
      }
    } else {
      sink.addError(EMPTY_FIELD_MESSAGE);
    }
  });

  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    String patternEmail =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regexEmail = RegExp(patternEmail);
    if (email.isNotEmpty) {
      if (email.contains("@") && regexEmail.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError(EMAIL_VALIDATION_MESSAGE);
      }
    } else {
      sink.addError(EMPTY_FIELD_MESSAGE);
    }
  });

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.isNotEmpty) {
      if (password.length >= 8) {
        sink.add(password);
      } else {
        sink.addError(PASSWORD_VALIDATION_MESSAGE);
      }
    } else {
      sink.addError(EMPTY_FIELD_MESSAGE);
    }
  });

  var phoneNumberValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (phoneNumber, sink) {
    String pattternMobile = r'(^(?:[+0]9)?[0-9]{10}$)'; //{10,12}$
    // Pattern pattternMobile = r'(^(?:[0-9]{3}])(?:[1-9]{3}])?[0-9]{6}$)';
    // Pattern pattternMobile = r'(^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$)';
    RegExp regexMobile = new RegExp(pattternMobile);

    if (phoneNumber.isNotEmpty) {
      if (regexMobile.hasMatch(phoneNumber)) {
        sink.add(phoneNumber);
      } else {
        sink.addError(PHONE_VALIDATION_MESSAGE);
      }
    } else {
      sink.addError(EMPTY_FIELD_MESSAGE);
    }
  });
}
