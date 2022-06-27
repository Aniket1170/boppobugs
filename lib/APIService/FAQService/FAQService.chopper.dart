// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FAQService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$FAQService extends FAQService {
  _$FAQService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = FAQService;

  @override
  Future<Response<FAQResponse>> getFaq() {
    final $url = 'getFaq';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<FAQResponse, FAQResponse>($request);
  }
}
