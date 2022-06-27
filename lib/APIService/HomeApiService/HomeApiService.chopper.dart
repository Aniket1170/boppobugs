// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$HomeApiService extends HomeApiService {
  _$HomeApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = HomeApiService;

  @override
  Future<Response<HomeResponse>> getHomeData() {
    final $url = 'gethomedata';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<HomeResponse, HomeResponse>($request);
  }

  @override
  Future<Response<HomeResponse>> productHistory() {
    final $url = 'order/producthistory';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<HomeResponse, HomeResponse>($request);
  }

  @override
  Future<Response<HomeResponse>> searchMovie(Map<String, dynamic> body) {
    final $url = 'product/srbynameprod';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<HomeResponse, HomeResponse>($request);
  }
}
