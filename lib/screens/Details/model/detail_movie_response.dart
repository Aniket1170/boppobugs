import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
part 'detail_movie_response.g.dart';

abstract class DetailMovieResponse
    implements Built<DetailMovieResponse, DetailMovieResponseBuilder> {
  @BuiltValueField(wireName: 'message')
  String get message;

  @BuiltValueField(wireName: 'success')
  bool get success;

  @BuiltValue(wireName: 'data')
  BuiltList<DetailMovieData> get data;

  @BuiltValueField(wireName: 'errors')
  BuiltList<dynamic> get errors;

  DetailMovieResponse._();

  factory DetailMovieResponse([updates(DetailMovieResponseBuilder b)]) =
      _$DetailMovieResponse;

  static Serializer<DetailMovieResponse> get serializer =>
      _$detailMovieResponseSerializer;
}

abstract class DetailMovieData
    implements Built<DetailMovieData, DetailMovieDataBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'vendor_id')
  int? get vendorId;

  @BuiltValueField(wireName: 'season_id')
  int? get seasonId;

  @BuiltValueField(wireName: 'series_id')
  int? get seriesId;

  @BuiltValueField(wireName: 'season_name')
  String? get seasonName;

  @BuiltValueField(wireName: 'vendor_name')
  String? get vendorName;

  @BuiltValueField(wireName: 'sku_id')
  String? get skuId;

  @BuiltValueField(wireName: 'title_name')
  String? get name;

  @BuiltValueField(wireName: 'description')
  String? get description;

  @BuiltValueField(wireName: 'plot')
  String? get plot;

  @BuiltValueField(wireName: 'share_url')
  String? get shareUrl;

  @BuiltValueField(wireName: 'company_logo')
  String? get companyLogo;

  @BuiltValueField(wireName: 'is_watched')
  int? get isWatched;

  @BuiltValueField(wireName: 'favourite_list')
  int? get favouriteList;

  @BuiltValueField(wireName: 'is_purchased')
  int? get isPurchased;

  @BuiltValueField(wireName: 'inr')
  num? get inr;

  @BuiltValueField(wireName: 'usd')
  num? get usd;

  @BuiltValueField(wireName: 'euro')
  num? get euro;

  @BuiltValueField(wireName: 'file')
  String? get file;

  @BuiltValueField(wireName: 'movie_file')
  String? get movieFile;

  @BuiltValueField(wireName: 'mobile_banner')
  String? get mobileBanner;

  @BuiltValueField(wireName: 'base_url')
  String? get baseUrl;

  @BuiltValueField(wireName: 'doc_shortfilm_id')
  int? get docShortfilmId;

  @BuiltValueField(wireName: 'content_type_id')
  int? get contentTypeId;

  @BuiltValue(wireName: 'castList')
  BuiltList<MovieCastListData>? get castList;

  @BuiltValue(wireName: 'genreList')
  BuiltList<MovieGenreListData>? get genreList;

  @BuiltValue(wireName: 'languageList')
  BuiltList<MovieLanguageListData>? get languageList;

  @BuiltValue(wireName: 'previewList')
  BuiltList<MoviePreviewListData>? get previewList;

  @BuiltValue(wireName: 'episodeList')
  BuiltList<EpisodeListData>? get episodeList;

  @BuiltValue(wireName: 'seasonList')
  BuiltList<SeasonListData>? get seasonList;

  DetailMovieData._();

  factory DetailMovieData([updates(DetailMovieDataBuilder b)]) =
      _$DetailMovieData;

  static Serializer<DetailMovieData> get serializer =>
      _$detailMovieDataSerializer;
}

abstract class MovieCastListData
    implements Built<MovieCastListData, MovieCastListDataBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get movieCastId;

  @BuiltValueField(wireName: 'cast_type')
  String? get movieCastType;

  @BuiltValueField(wireName: 'movie_id')
  int? get movieIdCast;

  @BuiltValueField(wireName: 'cast_name')
  String? get movieCastName;

  MovieCastListData._();

  factory MovieCastListData([updates(MovieCastListDataBuilder b)]) =
      _$MovieCastListData;

  static Serializer<MovieCastListData> get serializer =>
      _$movieCastListDataSerializer;
}

abstract class MovieGenreListData
    implements Built<MovieGenreListData, MovieGenreListDataBuilder> {
  @BuiltValueField(wireName: 'movie_tag_id')
  int? get movieTagId;

  @BuiltValueField(wireName: 'movie_id_tag')
  int? get movieIdTag;

  @BuiltValueField(wireName: 'movie_tag_name')
  String? get movieTagName;

  @BuiltValueField(wireName: 'season_tag_name')
  String? get seasonTagName;

  MovieGenreListData._();

  factory MovieGenreListData([updates(MovieGenreListDataBuilder b)]) =
      _$MovieGenreListData;

  static Serializer<MovieGenreListData> get serializer =>
      _$movieGenreListDataSerializer;
}

abstract class MovieLanguageListData
    implements Built<MovieLanguageListData, MovieLanguageListDataBuilder> {
  @BuiltValueField(wireName: 'language_id')
  int? get languageId;

  @BuiltValueField(wireName: 'movie_id_lang')
  int? get movieIdLang;

  @BuiltValueField(wireName: 'movie_language_name')
  String? get languageName;

  @BuiltValueField(wireName: 'season_language_name')
  String? get seasonLanguageName;

  MovieLanguageListData._();

  factory MovieLanguageListData([updates(MovieLanguageListDataBuilder b)]) =
      _$MovieLanguageListData;

  static Serializer<MovieLanguageListData> get serializer =>
      _$movieLanguageListDataSerializer;
}

abstract class MoviePreviewListData
    implements Built<MoviePreviewListData, MoviePreviewListDataBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get languageId;

  @BuiltValueField(wireName: 'name')
  String? get movieFilePath;

  @BuiltValueField(wireName: 'title')
  String? get title;

  MoviePreviewListData._();

  factory MoviePreviewListData([updates(MoviePreviewListDataBuilder b)]) =
      _$MoviePreviewListData;

  static Serializer<MoviePreviewListData> get serializer =>
      _$moviePreviewListDataSerializer;
}

abstract class SeasonListData
    implements Built<SeasonListData, SeasonListDataBuilder> {
  @BuiltValueField(wireName: 'season_id')
  int? get seasonId;

  @BuiltValueField(wireName: 'series_id')
  int? get seriesId;

  @BuiltValueField(wireName: 'thumbnail')
  String? get thumbnail;

  @BuiltValueField(wireName: 'season_name')
  String? get seasonName;

  @BuiltValueField(wireName: 'tag_line')
  String? get tagLine;

  @BuiltValueField(wireName: 'vendor_name')
  String? get vendorName;

  @BuiltValueField(wireName: 'plot')
  String? get plot;

  @BuiltValue(wireName: 'episodeList')
  BuiltList<EpisodeListData>? get episodeList;

  @BuiltValue(wireName: 'castList')
  BuiltList<MovieCastListData>? get castList;

  @BuiltValue(wireName: 'List')
  BuiltList<MovieGenreListData>? get List;

  @BuiltValue(wireName: 'LanguageList')
  BuiltList<MovieLanguageListData>? get LanguageList;

  @BuiltValue(wireName: 'PreviewList')
  BuiltList<MoviePreviewListData>? get PreviewList;

  SeasonListData._();

  factory SeasonListData([updates(SeasonListDataBuilder b)]) = _$SeasonListData;

  static Serializer<SeasonListData> get serializer =>
      _$seasonListDataSerializer;
}

abstract class EpisodeListData
    implements Built<EpisodeListData, EpisodeListDataBuilder> {
  @BuiltValueField(wireName: 'episode_number')
  int? get episodeNumber;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'thumbnail')
  String? get thumbnail;

  @BuiltValueField(wireName: 'episode_url')
  String? get episodeUrl;

  EpisodeListData._();

  factory EpisodeListData([updates(EpisodeListDataBuilder b)]) =
      _$EpisodeListData;

  static Serializer<EpisodeListData> get serializer =>
      _$episodeListDataSerializer;
}
