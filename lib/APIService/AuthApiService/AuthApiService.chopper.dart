// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$AuthApiService extends AuthApiService {
  _$AuthApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AuthApiService;

  @override
  Future<Response<LoginResponse>> login(Map<String, dynamic> body) {
    final $url = 'login';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<LoginResponse>> verifyOtp(Map<String, dynamic> body) {
    final $url = 'verifyotp';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<LoginResponse>> resendOtp(Map<String, dynamic> body) {
    final $url = 'resendotp';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<RefreshTokenResponse>> refreshToken(
      Map<String, dynamic> body) {
    final $url = 'refreshtoken';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<RefreshTokenResponse, RefreshTokenResponse>($request);
  }

  @override
  Future<Response<RefreshTokenResponse>> upbasicdetail(
      Map<String, dynamic> body) {
    final $url = 'upbasicdetail';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<RefreshTokenResponse, RefreshTokenResponse>($request);
  }
}
