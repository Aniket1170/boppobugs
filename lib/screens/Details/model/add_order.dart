import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
part 'add_order.g.dart';

abstract class AddOrderResponse
    implements Built<AddOrderResponse, AddOrderResponseBuilder> {
  @BuiltValueField(wireName: 'message')
  String get message;

  @BuiltValueField(wireName: 'success')
  bool get success;

  @BuiltValue(wireName: 'data')
  AddOrderData get data;

  @BuiltValueField(wireName: 'errors')
  BuiltList<dynamic> get errors;

  AddOrderResponse._();

  factory AddOrderResponse([updates(AddOrderResponseBuilder b)]) =
      _$AddOrderResponse;

  static Serializer<AddOrderResponse> get serializer =>
      _$addOrderResponseSerializer;
}

abstract class AddOrderData
    implements Built<AddOrderData, AddOrderDataBuilder> {
  @BuiltValueField(wireName: 'id')
  String? get orderId;

  @BuiltValueField(wireName: 'entity')
  String? get entity;

  @BuiltValueField(wireName: 'amount')
  int? get amount;

  @BuiltValueField(wireName: 'amount_paid')
  int? get amountPaid;

  @BuiltValueField(wireName: 'amount_due')
  int? get amountDue;

  @BuiltValueField(wireName: 'currency')
  String? get currency;

  @BuiltValueField(wireName: 'receipt')
  String? get receipt;

  @BuiltValueField(wireName: 'status')
  String? get status;

  @BuiltValueField(wireName: 'attempts')
  int? get attempts;

  AddOrderData._();

  factory AddOrderData([updates(AddOrderDataBuilder b)]) = _$AddOrderData;

  static Serializer<AddOrderData> get serializer => _$addOrderDataSerializer;
}
