import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
part 'NormalSuccessResponse.g.dart';

abstract class NormalSuccessResponse
    implements Built<NormalSuccessResponse, NormalSuccessResponseBuilder> {
  // @nullable
  @BuiltValueField(wireName: 'message')
  String get message;

  // @nullable
  @BuiltValueField(wireName: 'success')
  bool get success;

  // @nullable
  @BuiltValue(wireName: 'data')
  BuiltList<NormalSuccessData>? get data;

  // @nullable
  @BuiltValueField(wireName: 'errors')
  BuiltList<dynamic>? get errors;

  NormalSuccessResponse._();

  factory NormalSuccessResponse([updates(NormalSuccessResponseBuilder b)]) =
      _$NormalSuccessResponse;

  static Serializer<NormalSuccessResponse> get serializer =>
      _$normalSuccessResponseSerializer;
}

abstract class NormalSuccessData
    implements Built<NormalSuccessData, NormalSuccessDataBuilder> {
  // @nullable
  @BuiltValueField(wireName: 'id')
  int? get id;

  // @nullable
  @BuiltValueField(wireName: 'content_type_id')
  int? get contentTypeId;

  @BuiltValueField(wireName: 'content_id')
  int? get contentId;

  // @nullable
  @BuiltValueField(wireName: 'user_id')
  int? get userId;

  NormalSuccessData._();

  factory NormalSuccessData([updates(NormalSuccessDataBuilder b)]) =
      _$NormalSuccessData;

  static Serializer<NormalSuccessData> get serializer =>
      _$normalSuccessDataSerializer;
}
