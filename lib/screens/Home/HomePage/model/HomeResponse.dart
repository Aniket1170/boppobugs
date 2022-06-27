import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
part 'HomeResponse.g.dart';

abstract class HomeResponse
    implements Built<HomeResponse, HomeResponseBuilder> {
  @BuiltValueField(wireName: 'message')
  String get message;

  @BuiltValueField(wireName: 'success')
  bool get success;

  @BuiltValue(wireName: 'data')
  BuiltList<HomeData> get data;

  @BuiltValueField(wireName: 'errors')
  BuiltList<dynamic> get errors;

  HomeResponse._();

  factory HomeResponse([updates(HomeResponseBuilder b)]) = _$HomeResponse;

  static Serializer<HomeResponse> get serializer => _$homeResponseSerializer;
}

abstract class HomeData implements Built<HomeData, HomeDataBuilder> {
  @BuiltValueField(wireName: 'banner')
  BuiltList<WatchingListData>? get banner;

  @BuiltValueField(wireName: 'movieList')
  BuiltList<WatchingListData>? get moviesList;

  @BuiltValueField(wireName: 'watchingList')
  BuiltList<WatchingListData>? get watchingList;

  @BuiltValueField(wireName: 'latestTrendMovies')
  BuiltList<WatchingListData>? get latestTrendMovies;

  @BuiltValueField(wireName: 'webseries')
  BuiltList<WatchingListData>? get webseries;

  @BuiltValueField(wireName: 'docshortfilm')
  BuiltList<WatchingListData>? get docshortfilm;

  HomeData._();

  factory HomeData([updates(HomeDataBuilder b)]) = _$HomeData;

  static Serializer<HomeData> get serializer => _$homeDataSerializer;
}

abstract class WatchingListData
    implements Built<WatchingListData, WatchingListDataBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'season_id')
  int? get seasonId;

  @BuiltValueField(wireName: 'movie_id')
  int? get movieId;

  @BuiltValueField(wireName: 'is_watched')
  int? get isWatched;

  @BuiltValueField(wireName: 'is_purchased')
  int? get isPurchased;

  @BuiltValueField(wireName: 'vendor_id')
  int? get vendorId;

  @BuiltValueField(wireName: 'vendor_name')
  String? get vendorName;

  @BuiltValueField(wireName: 'description')
  String? get description;

  @BuiltValueField(wireName: 'company_logo')
  String? get companyLogo;

  @BuiltValueField(wireName: 'sku_id')
  String? get skuId;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'plot')
  String? get plot;

  @BuiltValueField(wireName: 'inr')
  num? get inr;

  @BuiltValueField(wireName: 'price')
  num? get price;

  @BuiltValueField(wireName: 'usd')
  num? get usd;

  @BuiltValueField(wireName: 'euro')
  num? get euro;

  @BuiltValueField(wireName: 'file')
  String? get file;

  @BuiltValueField(wireName: 'mobile_banner')
  String? get mobileBanner;

  @BuiltValueField(wireName: 'base_url')
  String? get baseUrl;

  @BuiltValueField(wireName: 'doc_shortfilm_id')
  int? get docShortfilmId;

  @BuiltValueField(wireName: 'content_type_p_id')
  int? get contentTypePId;

  // @BuiltValueField(wireName: 'content_type_id')
  // int? get contentTypeId;

  @BuiltValue(wireName: 'castList')
  BuiltList<CastListData>? get castList;

  @BuiltValue(wireName: 'genreList')
  BuiltList<TagListData>? get genreList;

  @BuiltValue(wireName: 'languageList')
  BuiltList<LanguageListData>? get languageList;

  WatchingListData._();

  factory WatchingListData([updates(WatchingListDataBuilder b)]) =
      _$WatchingListData;

  static Serializer<WatchingListData> get serializer =>
      _$watchingListDataSerializer;
}

abstract class CastListData
    implements Built<CastListData, CastListDataBuilder> {
  @BuiltValueField(wireName: 'movie_cast_id')
  String? get movieCastId;

  @BuiltValueField(wireName: 'movie_cast_type')
  String? get movieCastType;

  @BuiltValueField(wireName: 'movie_id_cast')
  String? get movieIdCast;

  @BuiltValueField(wireName: 'movie_cast_name')
  String? get movieCastName;

  CastListData._();

  factory CastListData([updates(CastListDataBuilder b)]) = _$CastListData;

  static Serializer<CastListData> get serializer => _$castListDataSerializer;
}

abstract class TagListData implements Built<TagListData, TagListDataBuilder> {
  @BuiltValueField(wireName: 'movie_tag_id')
  int? get movieTagId;

  @BuiltValueField(wireName: 'movie_id_tag')
  int? get movieIdTag;

  @BuiltValueField(wireName: 'movieTagName')
  String? get movieTagName;

  TagListData._();

  factory TagListData([updates(TagListDataBuilder b)]) = _$TagListData;

  static Serializer<TagListData> get serializer => _$tagListDataSerializer;
}

abstract class LanguageListData
    implements Built<LanguageListData, LanguageListDataBuilder> {
  @BuiltValueField(wireName: 'language_id')
  int? get languageId;

  @BuiltValueField(wireName: 'movie_id_lang')
  int? get movieIdLang;

  @BuiltValueField(wireName: 'movie_language_name')
  String? get movieLanguageName;

  LanguageListData._();

  factory LanguageListData([updates(LanguageListDataBuilder b)]) =
      _$LanguageListData;

  static Serializer<LanguageListData> get serializer =>
      _$languageListDataSerializer;
}
