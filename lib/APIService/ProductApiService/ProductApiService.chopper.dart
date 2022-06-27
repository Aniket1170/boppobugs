// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ProductApiService extends ProductApiService {
  _$ProductApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ProductApiService;

  @override
  Future<Response<SearchMovieResponse>> searchMovie(Map<String, dynamic> body) {
    final $url = 'srbynameprod';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<SearchMovieResponse, SearchMovieResponse>($request);
  }

  @override
  Future<Response<DetailMovieResponse>> prodbyid(Map<String, dynamic> body) {
    final $url = 'prodbyid';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<DetailMovieResponse, DetailMovieResponse>($request);
  }

  @override
  Future<Response<DetailMovieResponse>> seasonFlow(Map<String, dynamic> body) {
    final $url = 'seasonFlow';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<DetailMovieResponse, DetailMovieResponse>($request);
  }
}
