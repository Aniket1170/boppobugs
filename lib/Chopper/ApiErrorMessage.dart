import 'package:boppo_stream/utils/const.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';

class ApiErrorMessage {
  String errorResponse(Response<dynamic> response) {
    try {
      final Map<String, dynamic> error = response.error as Map<String, dynamic>;
      final e = error['errors'][0]['message'] ?? 'error';
      print("Error API: $e");
      return e.toString();
    } catch (e) {
      debugPrint("Api error exception $e");
      return EXCEPTIONAL_MESSAGE;
    }
  }
}
