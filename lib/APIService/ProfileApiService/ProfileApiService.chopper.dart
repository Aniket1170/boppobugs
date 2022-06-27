// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfileApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ProfileApiService extends ProfileApiService {
  _$ProfileApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ProfileApiService;

  @override
  Future<Response<ProfileResponse>> getprofile() {
    final $url = 'getprofile';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<ProfileResponse, ProfileResponse>($request);
  }
}
