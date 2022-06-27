import 'dart:async';

import 'package:boppo_stream/utils/const.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HeaderInterceptor implements RequestInterceptor {
  static const String AUTH_HEADER = "Authorization";
  static const String REFRESH_AUTH_HEADER = "refreshToken";
  static const String BEARER = "Bearer ";
  final storage = new FlutterSecureStorage();

  @override
  FutureOr<Request> onRequest(Request request) async {
    String? tokenValue = await storage.read(key: token);
    String? refreshTokenValue = await storage.read(key: refreshToken);

    Request newRequest = request.copyWith(headers: {
      "Content-Type": "application/json",
      AUTH_HEADER: "Bearer $tokenValue",
      REFRESH_AUTH_HEADER: "$refreshTokenValue"
    });
    return newRequest;
  }
}
