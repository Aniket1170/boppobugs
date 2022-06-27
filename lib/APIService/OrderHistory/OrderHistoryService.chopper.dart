// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderHistoryService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$OrderHistoryService extends OrderHistoryService {
  _$OrderHistoryService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = OrderHistoryService;

  @override
  Future<Response<OrderResponse>> productHistory() {
    final $url = 'producthistory';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<OrderResponse, OrderResponse>($request);
  }

  @override
  Future<Response<AddOrderResponse>> addorder(Map<String, dynamic> body) {
    final $url = 'addorder';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AddOrderResponse, AddOrderResponse>($request);
  }

  @override
  Future<Response<OrderResponse>> paymentverify() {
    final $url = 'paymentverify';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<OrderResponse, OrderResponse>($request);
  }
}
