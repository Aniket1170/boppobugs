import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
part 'faq_response.g.dart';

abstract class FAQResponse implements Built<FAQResponse, FAQResponseBuilder> {
  // @nullable
  @BuiltValueField(wireName: 'message')
  String get message;

  // @nullable
  @BuiltValueField(wireName: 'success')
  bool get success;

  // @nullable
  @BuiltValue(wireName: 'data')
  BuiltList<FAQData> get data;

  // @nullable
  @BuiltValueField(wireName: 'errors')
  BuiltList<dynamic> get errors;

  FAQResponse._();

  factory FAQResponse([updates(FAQResponseBuilder b)]) = _$FAQResponse;

  static Serializer<FAQResponse> get serializer => _$fAQResponseSerializer;
}

abstract class FAQData implements Built<FAQData, FAQDataBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'type')
  String? get type;

  @BuiltValueField(wireName: 'description')
  String? get description;

  FAQData._();

  factory FAQData([updates(FAQDataBuilder b)]) = _$FAQData;

  static Serializer<FAQData> get serializer => _$fAQDataSerializer;
}
