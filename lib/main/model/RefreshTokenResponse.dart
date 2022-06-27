import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
part 'RefreshTokenResponse.g.dart';

abstract class RefreshTokenResponse
    implements Built<RefreshTokenResponse, RefreshTokenResponseBuilder> {
  // @nullable
  @BuiltValueField(wireName: 'message')
  String get message;

  // @nullable
  @BuiltValueField(wireName: 'success')
  bool get success;

  // @nullable
  @BuiltValue(wireName: 'data')
  BuiltList<RefreshTokenData> get data;

  // @nullable
  @BuiltValueField(wireName: 'errors')
  BuiltList<dynamic> get errors;

  RefreshTokenResponse._();

  factory RefreshTokenResponse([updates(RefreshTokenResponseBuilder b)]) =
      _$RefreshTokenResponse;

  static Serializer<RefreshTokenResponse> get serializer =>
      _$refreshTokenResponseSerializer;
}

abstract class RefreshTokenData
    implements Built<RefreshTokenData, RefreshTokenDataBuilder> {
  // @nullable
  @BuiltValueField(wireName: 'access_token')
  String? get accessToken;

  // @nullable
  @BuiltValueField(wireName: 'refresh_Token')
  String? get refreshToken;

  RefreshTokenData._();

  factory RefreshTokenData([updates(RefreshTokenDataBuilder b)]) =
      _$RefreshTokenData;

  static Serializer<RefreshTokenData> get serializer =>
      _$refreshTokenDataSerializer;
}
