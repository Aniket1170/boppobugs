// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ContactUserService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ContactUserService extends ContactUserService {
  _$ContactUserService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ContactUserService;

  @override
  Future<Response<NormalSuccessResponse>> details(
      String about, String userId, http.MultipartFile file) {
    final $url = 'details';
    final $headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final $parts = <PartValue>[
      PartValue<String>('about', about),
      PartValue<String>('user_id', userId),
      PartValueFile<http.MultipartFile>('file', file)
    ];
    final $request = Request('POST', $url, client.baseUrl,
        parts: $parts, multipart: true, headers: $headers);
    return client.send<NormalSuccessResponse, NormalSuccessResponse>($request);
  }
}
