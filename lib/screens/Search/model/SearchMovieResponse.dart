import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
part 'SearchMovieResponse.g.dart';

abstract class SearchMovieResponse
    implements Built<SearchMovieResponse, SearchMovieResponseBuilder> {
  // @nullable
  @BuiltValueField(wireName: 'message')
  String get message;

  // @nullable
  @BuiltValueField(wireName: 'success')
  bool get success;

  // @nullable
  @BuiltValue(wireName: 'data')
  BuiltList<SearchData> get data;

  // @nullable
  @BuiltValueField(wireName: 'errors')
  BuiltList<dynamic> get errors;

  SearchMovieResponse._();

  factory SearchMovieResponse([updates(SearchMovieResponseBuilder b)]) =
      _$SearchMovieResponse;

  static Serializer<SearchMovieResponse> get serializer =>
      _$searchMovieResponseSerializer;
}

abstract class SearchData implements Built<SearchData, SearchDataBuilder> {
  // @nullable
  @BuiltValueField(wireName: 'id')
  int? get id;

  // @nullable
  @BuiltValueField(wireName: 'vendor_id')
  int? get vendorId;

  // @nullable
  @BuiltValueField(wireName: 'vendor_name')
  String? get vendorName;

  // @nullable
  @BuiltValueField(wireName: 'sku_id')
  String? get skuId;

  // @nullable
  @BuiltValueField(wireName: 'name')
  String? get name;

  // @nullable
  @BuiltValueField(wireName: 'description')
  String? get description;

  // @nullable
  @BuiltValueField(wireName: 'plot')
  String? get plot;

  // @nullable
  @BuiltValueField(wireName: 'company_logo')
  String? get companyLogo;

  // @nullable
  @BuiltValueField(wireName: 'is_watched')
  int? get isWatched;

  // @nullable
  @BuiltValueField(wireName: 'is_purchased')
  int? get isPurchased;

  // @nullable
  @BuiltValueField(wireName: 'inr')
  int? get inr;

  // @nullable
  @BuiltValueField(wireName: 'usd')
  int? get usd;

  // @nullable
  @BuiltValueField(wireName: 'euro')
  int? get euro;

  // @nullable
  @BuiltValueField(wireName: 'file')
  String? get file;

  // @nullable
  @BuiltValueField(wireName: 'mobile_banner')
  String? get mobileBanner;

  // @nullable
  @BuiltValueField(wireName: 'base_url')
  String? get baseUrl;

  // @nullable
  @BuiltValueField(wireName: 'doc_shortfilm_id')
  int? get docShortfilmId;

  // @nullable
  @BuiltValueField(wireName: 'content_type_id')
  int? get contentTypeId;

  // @nullable
  @BuiltValue(wireName: 'castList')
  BuiltList<SearchCastListData>? get castList;

  // @nullable
  @BuiltValue(wireName: 'tagList')
  BuiltList<SearchTagListData>? get tagList;

  // @nullable
  @BuiltValue(wireName: 'languageList')
  BuiltList<SearchLanguageListData>? get languageList;

  // @nullable
  @BuiltValue(wireName: 'previewList')
  BuiltList<SearchPreviewListData>? get previewList;

  SearchData._();

  factory SearchData([updates(SearchDataBuilder b)]) = _$SearchData;

  static Serializer<SearchData> get serializer => _$searchDataSerializer;
}

abstract class SearchCastListData
    implements Built<SearchCastListData, SearchCastListDataBuilder> {
  // @nullable
  @BuiltValueField(wireName: 'id')
  int? get movieCastId;

  // @nullable
  @BuiltValueField(wireName: 'doc_cast_type')
  String? get movieCastType;

  // @nullable
  @BuiltValueField(wireName: 'movie_id')
  int? get movieIdCast;

  // @nullable
  @BuiltValueField(wireName: 'doc_cast_name')
  String? get movieCastName;

  SearchCastListData._();

  factory SearchCastListData([updates(SearchCastListDataBuilder b)]) =
      _$SearchCastListData;

  static Serializer<SearchCastListData> get serializer =>
      _$searchCastListDataSerializer;
}

abstract class SearchTagListData
    implements Built<SearchTagListData, SearchTagListDataBuilder> {
  // @nullable
  @BuiltValueField(wireName: 'movie_tag_id')
  int? get movieTagId;

  // @nullable
  @BuiltValueField(wireName: 'movie_id_tag')
  int? get movieIdTag;

  // @nullable
  @BuiltValueField(wireName: 'doc_tag_name')
  String? get movieTagName;

  SearchTagListData._();

  factory SearchTagListData([updates(SearchTagListDataBuilder b)]) =
      _$SearchTagListData;

  static Serializer<SearchTagListData> get serializer =>
      _$searchTagListDataSerializer;
}

abstract class SearchLanguageListData
    implements Built<SearchLanguageListData, SearchLanguageListDataBuilder> {
  // @nullable
  @BuiltValueField(wireName: 'language_id')
  int? get languageId;

  // @nullable
  @BuiltValueField(wireName: 'movie_id_lang')
  int? get movieIdLang;

  // @nullable
  @BuiltValueField(wireName: 'doc_language_name')
  String? get languageName;

  SearchLanguageListData._();

  factory SearchLanguageListData([updates(SearchLanguageListDataBuilder b)]) =
      _$SearchLanguageListData;

  static Serializer<SearchLanguageListData> get serializer =>
      _$searchLanguageListDataSerializer;
}

abstract class SearchPreviewListData
    implements Built<SearchPreviewListData, SearchPreviewListDataBuilder> {
  // @nullable
  @BuiltValueField(wireName: 'id')
  int? get languageId;

  // @nullable
  @BuiltValueField(wireName: 'name')
  String? get movieFilePath;

  // @nullable
  @BuiltValueField(wireName: 'title')
  String? get title;

  SearchPreviewListData._();

  factory SearchPreviewListData([updates(SearchPreviewListDataBuilder b)]) =
      _$SearchPreviewListData;

  static Serializer<SearchPreviewListData> get serializer =>
      _$searchPreviewListDataSerializer;
}
