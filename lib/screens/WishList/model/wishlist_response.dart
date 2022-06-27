import 'package:boppo_stream/screens/Details/model/detail_movie_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
part 'wishlist_response.g.dart';

abstract class WishlistResponse
    implements Built<WishlistResponse, WishlistResponseBuilder> {
  @BuiltValueField(wireName: 'message')
  String get message;

  @BuiltValueField(wireName: 'success')
  bool get success;

  @BuiltValue(wireName: 'data')
  BuiltList<WishlistData> get data;

  @BuiltValueField(wireName: 'errors')
  BuiltList<dynamic> get errors;

  WishlistResponse._();

  factory WishlistResponse([updates(WishlistResponseBuilder b)]) =
      _$WishlistResponse;

  static Serializer<WishlistResponse> get serializer =>
      _$wishlistResponseSerializer;
}

abstract class WishlistData
    implements Built<WishlistData, WishlistDataBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'content_id')
  int? get contentId;

  @BuiltValueField(wireName: 'content_type_id')
  int? get contentTypeId;

  @BuiltValueField(wireName: 'user_id')
  int? get userId;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'file')
  String? get file;

  @BuiltValueField(wireName: 'description')
  String? get description;

  @BuiltValue(wireName: 'previewList')
  BuiltList<MoviePreviewListData>? get previewList;

  @BuiltValue(wireName: 'castList')
  BuiltList<WishListCastItem>? get castList;

  WishlistData._();

  factory WishlistData([updates(WishlistDataBuilder b)]) = _$WishlistData;

  static Serializer<WishlistData> get serializer => _$wishlistDataSerializer;
}

abstract class WishListCastItem
    implements Built<WishListCastItem, WishListCastItemBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get movieCastId;

  @BuiltValueField(wireName: 'cast_type')
  String? get movieCastType;

  @BuiltValueField(wireName: 'movie_id')
  int? get movieIdCast;

  @BuiltValueField(wireName: 'cast_name')
  String? get movieCastName;

  WishListCastItem._();

  factory WishListCastItem([updates(WishListCastItemBuilder b)]) =
      _$WishListCastItem;

  static Serializer<WishListCastItem> get serializer =>
      _$wishListCastItemSerializer;
}
