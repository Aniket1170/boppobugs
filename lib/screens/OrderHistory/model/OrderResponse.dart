import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
part 'OrderResponse.g.dart';

abstract class OrderResponse
    implements Built<OrderResponse, OrderResponseBuilder> {
  @BuiltValueField(wireName: 'message')
  String get message;

  @BuiltValueField(wireName: 'success')
  bool get success;

  @BuiltValue(wireName: 'data')
  BuiltList<OrderData> get data;

  @BuiltValueField(wireName: 'errors')
  BuiltList<dynamic> get errors;

  OrderResponse._();

  factory OrderResponse([updates(OrderResponseBuilder b)]) = _$OrderResponse;

  static Serializer<OrderResponse> get serializer => _$orderResponseSerializer;
}

abstract class OrderData implements Built<OrderData, OrderDataBuilder> {
  @BuiltValue(wireName: 'movies')
  BuiltList<MovieData>? get movies;

  @BuiltValue(wireName: 'Season')
  BuiltList<MovieData>? get Season;

  OrderData._();

  factory OrderData([updates(OrderDataBuilder b)]) = _$OrderData;

  static Serializer<OrderData> get serializer => _$orderDataSerializer;
}

abstract class MovieData implements Built<MovieData, MovieDataBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'name')
  String? get movieName;

  @BuiltValueField(wireName: 'description')
  String? get description;

  @BuiltValueField(wireName: 'thumbnail')
  String? get thumbnail;

  @BuiltValueField(wireName: 'movie_file')
  String? get movieFile;

  @BuiltValueField(wireName: 'order_no')
  String? get orderNo;

  @BuiltValueField(wireName: 'status')
  int? get status;

  @BuiltValueField(wireName: 'user_id')
  int? get userId;

  @BuiltValueField(wireName: 'payment_type')
  String? get paymentType;

  @BuiltValueField(wireName: 'amount_type')
  String? get amountType;

  @BuiltValueField(wireName: 'amount')
  String? get amount;

  @BuiltValueField(wireName: 'created_at')
  String? get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  String? get updatedAt;

  @BuiltValueField(wireName: 'tax_amount')
  String? get taxAmount;

  @BuiltValueField(wireName: 'total_amount')
  String? get totalAmount;

  @BuiltValueField(wireName: 'notification_id')
  int? get notificationId;

  @BuiltValueField(wireName: 'vendor_id')
  int? get vendorId;

  @BuiltValueField(wireName: 'order_id')
  int? get orderId;

  @BuiltValueField(wireName: 'content_type_id')
  int? get contentTypeId;

  @BuiltValueField(wireName: 'content_id')
  int? get contentId;

  @BuiltValueField(wireName: 'sku_id')
  String? get skuId;

  @BuiltValueField(wireName: 'discount')
  String? get discount;

  @BuiltValueField(wireName: 'transaction_status')
  int? get transactionStatus;

  @BuiltValueField(wireName: 'collected_amt')
  String? get collectedAmt;

  @BuiltValueField(wireName: 'image_url')
  String? get imageUrl;

  @BuiltValue(wireName: 'castList')
  BuiltList<CastsData>? get castList;

  MovieData._();

  factory MovieData([updates(MovieDataBuilder b)]) = _$MovieData;

  static Serializer<MovieData> get serializer => _$movieDataSerializer;
}

abstract class CastsData implements Built<CastsData, CastsDataBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'type')
  String? get movieCastType;

  @BuiltValueField(wireName: 'movie_id')
  int? get movieId;

  @BuiltValueField(wireName: 'name')
  String? get movieCastName;

  CastsData._();

  factory CastsData([updates(CastsDataBuilder b)]) = _$CastsData;

  static Serializer<CastsData> get serializer => _$castsDataSerializer;
}
