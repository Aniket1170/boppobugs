// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FavouriteService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$FavouriteService extends FavouriteService {
  _$FavouriteService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = FavouriteService;

  @override
  Future<Response<NormalSuccessResponse>> addToFavourite(
      List<Map<String, dynamic>> body) {
    final $url = 'addtofavourite';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<NormalSuccessResponse, NormalSuccessResponse>($request);
  }

  @override
  Future<Response<NormalSuccessResponse>> removeFromFavourite(
      List<Map<String, dynamic>> body) {
    final $url = 'removefromfavourite';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<NormalSuccessResponse, NormalSuccessResponse>($request);
  }

  @override
  Future<Response<WishlistResponse>> getfavourite() {
    final $url = 'getfavourite';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<WishlistResponse, WishlistResponse>($request);
  }
}
