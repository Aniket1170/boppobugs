// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_movie_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DetailMovieResponse> _$detailMovieResponseSerializer =
    new _$DetailMovieResponseSerializer();
Serializer<DetailMovieData> _$detailMovieDataSerializer =
    new _$DetailMovieDataSerializer();
Serializer<MovieCastListData> _$movieCastListDataSerializer =
    new _$MovieCastListDataSerializer();
Serializer<MovieGenreListData> _$movieGenreListDataSerializer =
    new _$MovieGenreListDataSerializer();
Serializer<MovieLanguageListData> _$movieLanguageListDataSerializer =
    new _$MovieLanguageListDataSerializer();
Serializer<MoviePreviewListData> _$moviePreviewListDataSerializer =
    new _$MoviePreviewListDataSerializer();
Serializer<SeasonListData> _$seasonListDataSerializer =
    new _$SeasonListDataSerializer();
Serializer<EpisodeListData> _$episodeListDataSerializer =
    new _$EpisodeListDataSerializer();

class _$DetailMovieResponseSerializer
    implements StructuredSerializer<DetailMovieResponse> {
  @override
  final Iterable<Type> types = const [
    DetailMovieResponse,
    _$DetailMovieResponse
  ];
  @override
  final String wireName = 'DetailMovieResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DetailMovieResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'success',
      serializers.serialize(object.success,
          specifiedType: const FullType(bool)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(
              BuiltList, const [const FullType(DetailMovieData)])),
      'errors',
      serializers.serialize(object.errors,
          specifiedType:
              const FullType(BuiltList, const [const FullType(dynamic)])),
    ];

    return result;
  }

  @override
  DetailMovieResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DetailMovieResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DetailMovieData)]))!
              as BuiltList<Object?>);
          break;
        case 'errors':
          result.errors.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(dynamic)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$DetailMovieDataSerializer
    implements StructuredSerializer<DetailMovieData> {
  @override
  final Iterable<Type> types = const [DetailMovieData, _$DetailMovieData];
  @override
  final String wireName = 'DetailMovieData';

  @override
  Iterable<Object?> serialize(Serializers serializers, DetailMovieData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.vendorId;
    if (value != null) {
      result
        ..add('vendor_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.seasonId;
    if (value != null) {
      result
        ..add('season_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.seriesId;
    if (value != null) {
      result
        ..add('series_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.seasonName;
    if (value != null) {
      result
        ..add('season_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vendorName;
    if (value != null) {
      result
        ..add('vendor_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.skuId;
    if (value != null) {
      result
        ..add('sku_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('title_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.plot;
    if (value != null) {
      result
        ..add('plot')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shareUrl;
    if (value != null) {
      result
        ..add('share_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.companyLogo;
    if (value != null) {
      result
        ..add('company_logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isWatched;
    if (value != null) {
      result
        ..add('is_watched')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.favouriteList;
    if (value != null) {
      result
        ..add('favourite_list')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isPurchased;
    if (value != null) {
      result
        ..add('is_purchased')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.inr;
    if (value != null) {
      result
        ..add('inr')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.usd;
    if (value != null) {
      result
        ..add('usd')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.euro;
    if (value != null) {
      result
        ..add('euro')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.file;
    if (value != null) {
      result
        ..add('file')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.movieFile;
    if (value != null) {
      result
        ..add('movie_file')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mobileBanner;
    if (value != null) {
      result
        ..add('mobile_banner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.baseUrl;
    if (value != null) {
      result
        ..add('base_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.docShortfilmId;
    if (value != null) {
      result
        ..add('doc_shortfilm_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.contentTypeId;
    if (value != null) {
      result
        ..add('content_type_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.castList;
    if (value != null) {
      result
        ..add('castList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(MovieCastListData)])));
    }
    value = object.genreList;
    if (value != null) {
      result
        ..add('genreList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(MovieGenreListData)])));
    }
    value = object.languageList;
    if (value != null) {
      result
        ..add('languageList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(MovieLanguageListData)])));
    }
    value = object.previewList;
    if (value != null) {
      result
        ..add('previewList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(MoviePreviewListData)])));
    }
    value = object.episodeList;
    if (value != null) {
      result
        ..add('episodeList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(EpisodeListData)])));
    }
    value = object.seasonList;
    if (value != null) {
      result
        ..add('seasonList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(SeasonListData)])));
    }
    return result;
  }

  @override
  DetailMovieData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DetailMovieDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'vendor_id':
          result.vendorId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'season_id':
          result.seasonId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'series_id':
          result.seriesId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'season_name':
          result.seasonName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'vendor_name':
          result.vendorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sku_id':
          result.skuId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title_name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'plot':
          result.plot = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'share_url':
          result.shareUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company_logo':
          result.companyLogo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_watched':
          result.isWatched = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'favourite_list':
          result.favouriteList = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_purchased':
          result.isPurchased = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'inr':
          result.inr = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num?;
          break;
        case 'usd':
          result.usd = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num?;
          break;
        case 'euro':
          result.euro = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num?;
          break;
        case 'file':
          result.file = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'movie_file':
          result.movieFile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mobile_banner':
          result.mobileBanner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'base_url':
          result.baseUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doc_shortfilm_id':
          result.docShortfilmId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'content_type_id':
          result.contentTypeId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'castList':
          result.castList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MovieCastListData)]))!
              as BuiltList<Object?>);
          break;
        case 'genreList':
          result.genreList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MovieGenreListData)]))!
              as BuiltList<Object?>);
          break;
        case 'languageList':
          result.languageList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(MovieLanguageListData)
              ]))! as BuiltList<Object?>);
          break;
        case 'previewList':
          result.previewList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MoviePreviewListData)]))!
              as BuiltList<Object?>);
          break;
        case 'episodeList':
          result.episodeList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(EpisodeListData)]))!
              as BuiltList<Object?>);
          break;
        case 'seasonList':
          result.seasonList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SeasonListData)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$MovieCastListDataSerializer
    implements StructuredSerializer<MovieCastListData> {
  @override
  final Iterable<Type> types = const [MovieCastListData, _$MovieCastListData];
  @override
  final String wireName = 'MovieCastListData';

  @override
  Iterable<Object?> serialize(Serializers serializers, MovieCastListData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.movieCastId;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.movieCastType;
    if (value != null) {
      result
        ..add('cast_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.movieIdCast;
    if (value != null) {
      result
        ..add('movie_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.movieCastName;
    if (value != null) {
      result
        ..add('cast_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MovieCastListData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieCastListDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.movieCastId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'cast_type':
          result.movieCastType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'movie_id':
          result.movieIdCast = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'cast_name':
          result.movieCastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$MovieGenreListDataSerializer
    implements StructuredSerializer<MovieGenreListData> {
  @override
  final Iterable<Type> types = const [MovieGenreListData, _$MovieGenreListData];
  @override
  final String wireName = 'MovieGenreListData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MovieGenreListData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.movieTagId;
    if (value != null) {
      result
        ..add('movie_tag_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.movieIdTag;
    if (value != null) {
      result
        ..add('movie_id_tag')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.movieTagName;
    if (value != null) {
      result
        ..add('movie_tag_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.seasonTagName;
    if (value != null) {
      result
        ..add('season_tag_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MovieGenreListData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieGenreListDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'movie_tag_id':
          result.movieTagId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'movie_id_tag':
          result.movieIdTag = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'movie_tag_name':
          result.movieTagName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'season_tag_name':
          result.seasonTagName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$MovieLanguageListDataSerializer
    implements StructuredSerializer<MovieLanguageListData> {
  @override
  final Iterable<Type> types = const [
    MovieLanguageListData,
    _$MovieLanguageListData
  ];
  @override
  final String wireName = 'MovieLanguageListData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MovieLanguageListData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.languageId;
    if (value != null) {
      result
        ..add('language_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.movieIdLang;
    if (value != null) {
      result
        ..add('movie_id_lang')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.languageName;
    if (value != null) {
      result
        ..add('movie_language_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.seasonLanguageName;
    if (value != null) {
      result
        ..add('season_language_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MovieLanguageListData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieLanguageListDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'language_id':
          result.languageId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'movie_id_lang':
          result.movieIdLang = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'movie_language_name':
          result.languageName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'season_language_name':
          result.seasonLanguageName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$MoviePreviewListDataSerializer
    implements StructuredSerializer<MoviePreviewListData> {
  @override
  final Iterable<Type> types = const [
    MoviePreviewListData,
    _$MoviePreviewListData
  ];
  @override
  final String wireName = 'MoviePreviewListData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MoviePreviewListData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.languageId;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.movieFilePath;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MoviePreviewListData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MoviePreviewListDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.languageId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.movieFilePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SeasonListDataSerializer
    implements StructuredSerializer<SeasonListData> {
  @override
  final Iterable<Type> types = const [SeasonListData, _$SeasonListData];
  @override
  final String wireName = 'SeasonListData';

  @override
  Iterable<Object?> serialize(Serializers serializers, SeasonListData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.seasonId;
    if (value != null) {
      result
        ..add('season_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.seriesId;
    if (value != null) {
      result
        ..add('series_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.thumbnail;
    if (value != null) {
      result
        ..add('thumbnail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.seasonName;
    if (value != null) {
      result
        ..add('season_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tagLine;
    if (value != null) {
      result
        ..add('tag_line')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vendorName;
    if (value != null) {
      result
        ..add('vendor_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.plot;
    if (value != null) {
      result
        ..add('plot')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.episodeList;
    if (value != null) {
      result
        ..add('episodeList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(EpisodeListData)])));
    }
    value = object.castList;
    if (value != null) {
      result
        ..add('castList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(MovieCastListData)])));
    }
    value = object.List;
    if (value != null) {
      result
        ..add('List')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(MovieGenreListData)])));
    }
    value = object.LanguageList;
    if (value != null) {
      result
        ..add('LanguageList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(MovieLanguageListData)])));
    }
    value = object.PreviewList;
    if (value != null) {
      result
        ..add('PreviewList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(MoviePreviewListData)])));
    }
    return result;
  }

  @override
  SeasonListData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SeasonListDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'season_id':
          result.seasonId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'series_id':
          result.seriesId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'season_name':
          result.seasonName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tag_line':
          result.tagLine = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'vendor_name':
          result.vendorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'plot':
          result.plot = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'episodeList':
          result.episodeList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(EpisodeListData)]))!
              as BuiltList<Object?>);
          break;
        case 'castList':
          result.castList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MovieCastListData)]))!
              as BuiltList<Object?>);
          break;
        case 'List':
          result.List.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MovieGenreListData)]))!
              as BuiltList<Object?>);
          break;
        case 'LanguageList':
          result.LanguageList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(MovieLanguageListData)
              ]))! as BuiltList<Object?>);
          break;
        case 'PreviewList':
          result.PreviewList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MoviePreviewListData)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$EpisodeListDataSerializer
    implements StructuredSerializer<EpisodeListData> {
  @override
  final Iterable<Type> types = const [EpisodeListData, _$EpisodeListData];
  @override
  final String wireName = 'EpisodeListData';

  @override
  Iterable<Object?> serialize(Serializers serializers, EpisodeListData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.episodeNumber;
    if (value != null) {
      result
        ..add('episode_number')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.thumbnail;
    if (value != null) {
      result
        ..add('thumbnail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.episodeUrl;
    if (value != null) {
      result
        ..add('episode_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  EpisodeListData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EpisodeListDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'episode_number':
          result.episodeNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'episode_url':
          result.episodeUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$DetailMovieResponse extends DetailMovieResponse {
  @override
  final String message;
  @override
  final bool success;
  @override
  final BuiltList<DetailMovieData> data;
  @override
  final BuiltList<dynamic> errors;

  factory _$DetailMovieResponse(
          [void Function(DetailMovieResponseBuilder)? updates]) =>
      (new DetailMovieResponseBuilder()..update(updates)).build();

  _$DetailMovieResponse._(
      {required this.message,
      required this.success,
      required this.data,
      required this.errors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, 'DetailMovieResponse', 'message');
    BuiltValueNullFieldError.checkNotNull(
        success, 'DetailMovieResponse', 'success');
    BuiltValueNullFieldError.checkNotNull(data, 'DetailMovieResponse', 'data');
    BuiltValueNullFieldError.checkNotNull(
        errors, 'DetailMovieResponse', 'errors');
  }

  @override
  DetailMovieResponse rebuild(
          void Function(DetailMovieResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DetailMovieResponseBuilder toBuilder() =>
      new DetailMovieResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DetailMovieResponse &&
        message == other.message &&
        success == other.success &&
        data == other.data &&
        errors == other.errors;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, message.hashCode), success.hashCode), data.hashCode),
        errors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DetailMovieResponse')
          ..add('message', message)
          ..add('success', success)
          ..add('data', data)
          ..add('errors', errors))
        .toString();
  }
}

class DetailMovieResponseBuilder
    implements Builder<DetailMovieResponse, DetailMovieResponseBuilder> {
  _$DetailMovieResponse? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<DetailMovieData>? _data;
  ListBuilder<DetailMovieData> get data =>
      _$this._data ??= new ListBuilder<DetailMovieData>();
  set data(ListBuilder<DetailMovieData>? data) => _$this._data = data;

  ListBuilder<dynamic>? _errors;
  ListBuilder<dynamic> get errors =>
      _$this._errors ??= new ListBuilder<dynamic>();
  set errors(ListBuilder<dynamic>? errors) => _$this._errors = errors;

  DetailMovieResponseBuilder();

  DetailMovieResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _success = $v.success;
      _data = $v.data.toBuilder();
      _errors = $v.errors.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DetailMovieResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DetailMovieResponse;
  }

  @override
  void update(void Function(DetailMovieResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DetailMovieResponse build() {
    _$DetailMovieResponse _$result;
    try {
      _$result = _$v ??
          new _$DetailMovieResponse._(
              message: BuiltValueNullFieldError.checkNotNull(
                  message, 'DetailMovieResponse', 'message'),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, 'DetailMovieResponse', 'success'),
              data: data.build(),
              errors: errors.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
        _$failedField = 'errors';
        errors.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DetailMovieResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DetailMovieData extends DetailMovieData {
  @override
  final int? id;
  @override
  final int? vendorId;
  @override
  final int? seasonId;
  @override
  final int? seriesId;
  @override
  final String? seasonName;
  @override
  final String? vendorName;
  @override
  final String? skuId;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? plot;
  @override
  final String? shareUrl;
  @override
  final String? companyLogo;
  @override
  final int? isWatched;
  @override
  final int? favouriteList;
  @override
  final int? isPurchased;
  @override
  final num? inr;
  @override
  final num? usd;
  @override
  final num? euro;
  @override
  final String? file;
  @override
  final String? movieFile;
  @override
  final String? mobileBanner;
  @override
  final String? baseUrl;
  @override
  final int? docShortfilmId;
  @override
  final int? contentTypeId;
  @override
  final BuiltList<MovieCastListData>? castList;
  @override
  final BuiltList<MovieGenreListData>? genreList;
  @override
  final BuiltList<MovieLanguageListData>? languageList;
  @override
  final BuiltList<MoviePreviewListData>? previewList;
  @override
  final BuiltList<EpisodeListData>? episodeList;
  @override
  final BuiltList<SeasonListData>? seasonList;

  factory _$DetailMovieData([void Function(DetailMovieDataBuilder)? updates]) =>
      (new DetailMovieDataBuilder()..update(updates)).build();

  _$DetailMovieData._(
      {this.id,
      this.vendorId,
      this.seasonId,
      this.seriesId,
      this.seasonName,
      this.vendorName,
      this.skuId,
      this.name,
      this.description,
      this.plot,
      this.shareUrl,
      this.companyLogo,
      this.isWatched,
      this.favouriteList,
      this.isPurchased,
      this.inr,
      this.usd,
      this.euro,
      this.file,
      this.movieFile,
      this.mobileBanner,
      this.baseUrl,
      this.docShortfilmId,
      this.contentTypeId,
      this.castList,
      this.genreList,
      this.languageList,
      this.previewList,
      this.episodeList,
      this.seasonList})
      : super._();

  @override
  DetailMovieData rebuild(void Function(DetailMovieDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DetailMovieDataBuilder toBuilder() =>
      new DetailMovieDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DetailMovieData &&
        id == other.id &&
        vendorId == other.vendorId &&
        seasonId == other.seasonId &&
        seriesId == other.seriesId &&
        seasonName == other.seasonName &&
        vendorName == other.vendorName &&
        skuId == other.skuId &&
        name == other.name &&
        description == other.description &&
        plot == other.plot &&
        shareUrl == other.shareUrl &&
        companyLogo == other.companyLogo &&
        isWatched == other.isWatched &&
        favouriteList == other.favouriteList &&
        isPurchased == other.isPurchased &&
        inr == other.inr &&
        usd == other.usd &&
        euro == other.euro &&
        file == other.file &&
        movieFile == other.movieFile &&
        mobileBanner == other.mobileBanner &&
        baseUrl == other.baseUrl &&
        docShortfilmId == other.docShortfilmId &&
        contentTypeId == other.contentTypeId &&
        castList == other.castList &&
        genreList == other.genreList &&
        languageList == other.languageList &&
        previewList == other.previewList &&
        episodeList == other.episodeList &&
        seasonList == other.seasonList;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, id.hashCode), vendorId.hashCode), seasonId.hashCode), seriesId.hashCode), seasonName.hashCode), vendorName.hashCode), skuId.hashCode), name.hashCode), description.hashCode), plot.hashCode), shareUrl.hashCode),
                                                                                companyLogo.hashCode),
                                                                            isWatched.hashCode),
                                                                        favouriteList.hashCode),
                                                                    isPurchased.hashCode),
                                                                inr.hashCode),
                                                            usd.hashCode),
                                                        euro.hashCode),
                                                    file.hashCode),
                                                movieFile.hashCode),
                                            mobileBanner.hashCode),
                                        baseUrl.hashCode),
                                    docShortfilmId.hashCode),
                                contentTypeId.hashCode),
                            castList.hashCode),
                        genreList.hashCode),
                    languageList.hashCode),
                previewList.hashCode),
            episodeList.hashCode),
        seasonList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DetailMovieData')
          ..add('id', id)
          ..add('vendorId', vendorId)
          ..add('seasonId', seasonId)
          ..add('seriesId', seriesId)
          ..add('seasonName', seasonName)
          ..add('vendorName', vendorName)
          ..add('skuId', skuId)
          ..add('name', name)
          ..add('description', description)
          ..add('plot', plot)
          ..add('shareUrl', shareUrl)
          ..add('companyLogo', companyLogo)
          ..add('isWatched', isWatched)
          ..add('favouriteList', favouriteList)
          ..add('isPurchased', isPurchased)
          ..add('inr', inr)
          ..add('usd', usd)
          ..add('euro', euro)
          ..add('file', file)
          ..add('movieFile', movieFile)
          ..add('mobileBanner', mobileBanner)
          ..add('baseUrl', baseUrl)
          ..add('docShortfilmId', docShortfilmId)
          ..add('contentTypeId', contentTypeId)
          ..add('castList', castList)
          ..add('genreList', genreList)
          ..add('languageList', languageList)
          ..add('previewList', previewList)
          ..add('episodeList', episodeList)
          ..add('seasonList', seasonList))
        .toString();
  }
}

class DetailMovieDataBuilder
    implements Builder<DetailMovieData, DetailMovieDataBuilder> {
  _$DetailMovieData? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _vendorId;
  int? get vendorId => _$this._vendorId;
  set vendorId(int? vendorId) => _$this._vendorId = vendorId;

  int? _seasonId;
  int? get seasonId => _$this._seasonId;
  set seasonId(int? seasonId) => _$this._seasonId = seasonId;

  int? _seriesId;
  int? get seriesId => _$this._seriesId;
  set seriesId(int? seriesId) => _$this._seriesId = seriesId;

  String? _seasonName;
  String? get seasonName => _$this._seasonName;
  set seasonName(String? seasonName) => _$this._seasonName = seasonName;

  String? _vendorName;
  String? get vendorName => _$this._vendorName;
  set vendorName(String? vendorName) => _$this._vendorName = vendorName;

  String? _skuId;
  String? get skuId => _$this._skuId;
  set skuId(String? skuId) => _$this._skuId = skuId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _plot;
  String? get plot => _$this._plot;
  set plot(String? plot) => _$this._plot = plot;

  String? _shareUrl;
  String? get shareUrl => _$this._shareUrl;
  set shareUrl(String? shareUrl) => _$this._shareUrl = shareUrl;

  String? _companyLogo;
  String? get companyLogo => _$this._companyLogo;
  set companyLogo(String? companyLogo) => _$this._companyLogo = companyLogo;

  int? _isWatched;
  int? get isWatched => _$this._isWatched;
  set isWatched(int? isWatched) => _$this._isWatched = isWatched;

  int? _favouriteList;
  int? get favouriteList => _$this._favouriteList;
  set favouriteList(int? favouriteList) =>
      _$this._favouriteList = favouriteList;

  int? _isPurchased;
  int? get isPurchased => _$this._isPurchased;
  set isPurchased(int? isPurchased) => _$this._isPurchased = isPurchased;

  num? _inr;
  num? get inr => _$this._inr;
  set inr(num? inr) => _$this._inr = inr;

  num? _usd;
  num? get usd => _$this._usd;
  set usd(num? usd) => _$this._usd = usd;

  num? _euro;
  num? get euro => _$this._euro;
  set euro(num? euro) => _$this._euro = euro;

  String? _file;
  String? get file => _$this._file;
  set file(String? file) => _$this._file = file;

  String? _movieFile;
  String? get movieFile => _$this._movieFile;
  set movieFile(String? movieFile) => _$this._movieFile = movieFile;

  String? _mobileBanner;
  String? get mobileBanner => _$this._mobileBanner;
  set mobileBanner(String? mobileBanner) => _$this._mobileBanner = mobileBanner;

  String? _baseUrl;
  String? get baseUrl => _$this._baseUrl;
  set baseUrl(String? baseUrl) => _$this._baseUrl = baseUrl;

  int? _docShortfilmId;
  int? get docShortfilmId => _$this._docShortfilmId;
  set docShortfilmId(int? docShortfilmId) =>
      _$this._docShortfilmId = docShortfilmId;

  int? _contentTypeId;
  int? get contentTypeId => _$this._contentTypeId;
  set contentTypeId(int? contentTypeId) =>
      _$this._contentTypeId = contentTypeId;

  ListBuilder<MovieCastListData>? _castList;
  ListBuilder<MovieCastListData> get castList =>
      _$this._castList ??= new ListBuilder<MovieCastListData>();
  set castList(ListBuilder<MovieCastListData>? castList) =>
      _$this._castList = castList;

  ListBuilder<MovieGenreListData>? _genreList;
  ListBuilder<MovieGenreListData> get genreList =>
      _$this._genreList ??= new ListBuilder<MovieGenreListData>();
  set genreList(ListBuilder<MovieGenreListData>? genreList) =>
      _$this._genreList = genreList;

  ListBuilder<MovieLanguageListData>? _languageList;
  ListBuilder<MovieLanguageListData> get languageList =>
      _$this._languageList ??= new ListBuilder<MovieLanguageListData>();
  set languageList(ListBuilder<MovieLanguageListData>? languageList) =>
      _$this._languageList = languageList;

  ListBuilder<MoviePreviewListData>? _previewList;
  ListBuilder<MoviePreviewListData> get previewList =>
      _$this._previewList ??= new ListBuilder<MoviePreviewListData>();
  set previewList(ListBuilder<MoviePreviewListData>? previewList) =>
      _$this._previewList = previewList;

  ListBuilder<EpisodeListData>? _episodeList;
  ListBuilder<EpisodeListData> get episodeList =>
      _$this._episodeList ??= new ListBuilder<EpisodeListData>();
  set episodeList(ListBuilder<EpisodeListData>? episodeList) =>
      _$this._episodeList = episodeList;

  ListBuilder<SeasonListData>? _seasonList;
  ListBuilder<SeasonListData> get seasonList =>
      _$this._seasonList ??= new ListBuilder<SeasonListData>();
  set seasonList(ListBuilder<SeasonListData>? seasonList) =>
      _$this._seasonList = seasonList;

  DetailMovieDataBuilder();

  DetailMovieDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _vendorId = $v.vendorId;
      _seasonId = $v.seasonId;
      _seriesId = $v.seriesId;
      _seasonName = $v.seasonName;
      _vendorName = $v.vendorName;
      _skuId = $v.skuId;
      _name = $v.name;
      _description = $v.description;
      _plot = $v.plot;
      _shareUrl = $v.shareUrl;
      _companyLogo = $v.companyLogo;
      _isWatched = $v.isWatched;
      _favouriteList = $v.favouriteList;
      _isPurchased = $v.isPurchased;
      _inr = $v.inr;
      _usd = $v.usd;
      _euro = $v.euro;
      _file = $v.file;
      _movieFile = $v.movieFile;
      _mobileBanner = $v.mobileBanner;
      _baseUrl = $v.baseUrl;
      _docShortfilmId = $v.docShortfilmId;
      _contentTypeId = $v.contentTypeId;
      _castList = $v.castList?.toBuilder();
      _genreList = $v.genreList?.toBuilder();
      _languageList = $v.languageList?.toBuilder();
      _previewList = $v.previewList?.toBuilder();
      _episodeList = $v.episodeList?.toBuilder();
      _seasonList = $v.seasonList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DetailMovieData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DetailMovieData;
  }

  @override
  void update(void Function(DetailMovieDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DetailMovieData build() {
    _$DetailMovieData _$result;
    try {
      _$result = _$v ??
          new _$DetailMovieData._(
              id: id,
              vendorId: vendorId,
              seasonId: seasonId,
              seriesId: seriesId,
              seasonName: seasonName,
              vendorName: vendorName,
              skuId: skuId,
              name: name,
              description: description,
              plot: plot,
              shareUrl: shareUrl,
              companyLogo: companyLogo,
              isWatched: isWatched,
              favouriteList: favouriteList,
              isPurchased: isPurchased,
              inr: inr,
              usd: usd,
              euro: euro,
              file: file,
              movieFile: movieFile,
              mobileBanner: mobileBanner,
              baseUrl: baseUrl,
              docShortfilmId: docShortfilmId,
              contentTypeId: contentTypeId,
              castList: _castList?.build(),
              genreList: _genreList?.build(),
              languageList: _languageList?.build(),
              previewList: _previewList?.build(),
              episodeList: _episodeList?.build(),
              seasonList: _seasonList?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'castList';
        _castList?.build();
        _$failedField = 'genreList';
        _genreList?.build();
        _$failedField = 'languageList';
        _languageList?.build();
        _$failedField = 'previewList';
        _previewList?.build();
        _$failedField = 'episodeList';
        _episodeList?.build();
        _$failedField = 'seasonList';
        _seasonList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DetailMovieData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MovieCastListData extends MovieCastListData {
  @override
  final int? movieCastId;
  @override
  final String? movieCastType;
  @override
  final int? movieIdCast;
  @override
  final String? movieCastName;

  factory _$MovieCastListData(
          [void Function(MovieCastListDataBuilder)? updates]) =>
      (new MovieCastListDataBuilder()..update(updates)).build();

  _$MovieCastListData._(
      {this.movieCastId,
      this.movieCastType,
      this.movieIdCast,
      this.movieCastName})
      : super._();

  @override
  MovieCastListData rebuild(void Function(MovieCastListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieCastListDataBuilder toBuilder() =>
      new MovieCastListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieCastListData &&
        movieCastId == other.movieCastId &&
        movieCastType == other.movieCastType &&
        movieIdCast == other.movieIdCast &&
        movieCastName == other.movieCastName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, movieCastId.hashCode), movieCastType.hashCode),
            movieIdCast.hashCode),
        movieCastName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieCastListData')
          ..add('movieCastId', movieCastId)
          ..add('movieCastType', movieCastType)
          ..add('movieIdCast', movieIdCast)
          ..add('movieCastName', movieCastName))
        .toString();
  }
}

class MovieCastListDataBuilder
    implements Builder<MovieCastListData, MovieCastListDataBuilder> {
  _$MovieCastListData? _$v;

  int? _movieCastId;
  int? get movieCastId => _$this._movieCastId;
  set movieCastId(int? movieCastId) => _$this._movieCastId = movieCastId;

  String? _movieCastType;
  String? get movieCastType => _$this._movieCastType;
  set movieCastType(String? movieCastType) =>
      _$this._movieCastType = movieCastType;

  int? _movieIdCast;
  int? get movieIdCast => _$this._movieIdCast;
  set movieIdCast(int? movieIdCast) => _$this._movieIdCast = movieIdCast;

  String? _movieCastName;
  String? get movieCastName => _$this._movieCastName;
  set movieCastName(String? movieCastName) =>
      _$this._movieCastName = movieCastName;

  MovieCastListDataBuilder();

  MovieCastListDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _movieCastId = $v.movieCastId;
      _movieCastType = $v.movieCastType;
      _movieIdCast = $v.movieIdCast;
      _movieCastName = $v.movieCastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieCastListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovieCastListData;
  }

  @override
  void update(void Function(MovieCastListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieCastListData build() {
    final _$result = _$v ??
        new _$MovieCastListData._(
            movieCastId: movieCastId,
            movieCastType: movieCastType,
            movieIdCast: movieIdCast,
            movieCastName: movieCastName);
    replace(_$result);
    return _$result;
  }
}

class _$MovieGenreListData extends MovieGenreListData {
  @override
  final int? movieTagId;
  @override
  final int? movieIdTag;
  @override
  final String? movieTagName;
  @override
  final String? seasonTagName;

  factory _$MovieGenreListData(
          [void Function(MovieGenreListDataBuilder)? updates]) =>
      (new MovieGenreListDataBuilder()..update(updates)).build();

  _$MovieGenreListData._(
      {this.movieTagId, this.movieIdTag, this.movieTagName, this.seasonTagName})
      : super._();

  @override
  MovieGenreListData rebuild(
          void Function(MovieGenreListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieGenreListDataBuilder toBuilder() =>
      new MovieGenreListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieGenreListData &&
        movieTagId == other.movieTagId &&
        movieIdTag == other.movieIdTag &&
        movieTagName == other.movieTagName &&
        seasonTagName == other.seasonTagName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, movieTagId.hashCode), movieIdTag.hashCode),
            movieTagName.hashCode),
        seasonTagName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieGenreListData')
          ..add('movieTagId', movieTagId)
          ..add('movieIdTag', movieIdTag)
          ..add('movieTagName', movieTagName)
          ..add('seasonTagName', seasonTagName))
        .toString();
  }
}

class MovieGenreListDataBuilder
    implements Builder<MovieGenreListData, MovieGenreListDataBuilder> {
  _$MovieGenreListData? _$v;

  int? _movieTagId;
  int? get movieTagId => _$this._movieTagId;
  set movieTagId(int? movieTagId) => _$this._movieTagId = movieTagId;

  int? _movieIdTag;
  int? get movieIdTag => _$this._movieIdTag;
  set movieIdTag(int? movieIdTag) => _$this._movieIdTag = movieIdTag;

  String? _movieTagName;
  String? get movieTagName => _$this._movieTagName;
  set movieTagName(String? movieTagName) => _$this._movieTagName = movieTagName;

  String? _seasonTagName;
  String? get seasonTagName => _$this._seasonTagName;
  set seasonTagName(String? seasonTagName) =>
      _$this._seasonTagName = seasonTagName;

  MovieGenreListDataBuilder();

  MovieGenreListDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _movieTagId = $v.movieTagId;
      _movieIdTag = $v.movieIdTag;
      _movieTagName = $v.movieTagName;
      _seasonTagName = $v.seasonTagName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieGenreListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovieGenreListData;
  }

  @override
  void update(void Function(MovieGenreListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieGenreListData build() {
    final _$result = _$v ??
        new _$MovieGenreListData._(
            movieTagId: movieTagId,
            movieIdTag: movieIdTag,
            movieTagName: movieTagName,
            seasonTagName: seasonTagName);
    replace(_$result);
    return _$result;
  }
}

class _$MovieLanguageListData extends MovieLanguageListData {
  @override
  final int? languageId;
  @override
  final int? movieIdLang;
  @override
  final String? languageName;
  @override
  final String? seasonLanguageName;

  factory _$MovieLanguageListData(
          [void Function(MovieLanguageListDataBuilder)? updates]) =>
      (new MovieLanguageListDataBuilder()..update(updates)).build();

  _$MovieLanguageListData._(
      {this.languageId,
      this.movieIdLang,
      this.languageName,
      this.seasonLanguageName})
      : super._();

  @override
  MovieLanguageListData rebuild(
          void Function(MovieLanguageListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieLanguageListDataBuilder toBuilder() =>
      new MovieLanguageListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieLanguageListData &&
        languageId == other.languageId &&
        movieIdLang == other.movieIdLang &&
        languageName == other.languageName &&
        seasonLanguageName == other.seasonLanguageName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, languageId.hashCode), movieIdLang.hashCode),
            languageName.hashCode),
        seasonLanguageName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieLanguageListData')
          ..add('languageId', languageId)
          ..add('movieIdLang', movieIdLang)
          ..add('languageName', languageName)
          ..add('seasonLanguageName', seasonLanguageName))
        .toString();
  }
}

class MovieLanguageListDataBuilder
    implements Builder<MovieLanguageListData, MovieLanguageListDataBuilder> {
  _$MovieLanguageListData? _$v;

  int? _languageId;
  int? get languageId => _$this._languageId;
  set languageId(int? languageId) => _$this._languageId = languageId;

  int? _movieIdLang;
  int? get movieIdLang => _$this._movieIdLang;
  set movieIdLang(int? movieIdLang) => _$this._movieIdLang = movieIdLang;

  String? _languageName;
  String? get languageName => _$this._languageName;
  set languageName(String? languageName) => _$this._languageName = languageName;

  String? _seasonLanguageName;
  String? get seasonLanguageName => _$this._seasonLanguageName;
  set seasonLanguageName(String? seasonLanguageName) =>
      _$this._seasonLanguageName = seasonLanguageName;

  MovieLanguageListDataBuilder();

  MovieLanguageListDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _languageId = $v.languageId;
      _movieIdLang = $v.movieIdLang;
      _languageName = $v.languageName;
      _seasonLanguageName = $v.seasonLanguageName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieLanguageListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovieLanguageListData;
  }

  @override
  void update(void Function(MovieLanguageListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieLanguageListData build() {
    final _$result = _$v ??
        new _$MovieLanguageListData._(
            languageId: languageId,
            movieIdLang: movieIdLang,
            languageName: languageName,
            seasonLanguageName: seasonLanguageName);
    replace(_$result);
    return _$result;
  }
}

class _$MoviePreviewListData extends MoviePreviewListData {
  @override
  final int? languageId;
  @override
  final String? movieFilePath;
  @override
  final String? title;

  factory _$MoviePreviewListData(
          [void Function(MoviePreviewListDataBuilder)? updates]) =>
      (new MoviePreviewListDataBuilder()..update(updates)).build();

  _$MoviePreviewListData._({this.languageId, this.movieFilePath, this.title})
      : super._();

  @override
  MoviePreviewListData rebuild(
          void Function(MoviePreviewListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MoviePreviewListDataBuilder toBuilder() =>
      new MoviePreviewListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MoviePreviewListData &&
        languageId == other.languageId &&
        movieFilePath == other.movieFilePath &&
        title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, languageId.hashCode), movieFilePath.hashCode),
        title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MoviePreviewListData')
          ..add('languageId', languageId)
          ..add('movieFilePath', movieFilePath)
          ..add('title', title))
        .toString();
  }
}

class MoviePreviewListDataBuilder
    implements Builder<MoviePreviewListData, MoviePreviewListDataBuilder> {
  _$MoviePreviewListData? _$v;

  int? _languageId;
  int? get languageId => _$this._languageId;
  set languageId(int? languageId) => _$this._languageId = languageId;

  String? _movieFilePath;
  String? get movieFilePath => _$this._movieFilePath;
  set movieFilePath(String? movieFilePath) =>
      _$this._movieFilePath = movieFilePath;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  MoviePreviewListDataBuilder();

  MoviePreviewListDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _languageId = $v.languageId;
      _movieFilePath = $v.movieFilePath;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MoviePreviewListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MoviePreviewListData;
  }

  @override
  void update(void Function(MoviePreviewListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MoviePreviewListData build() {
    final _$result = _$v ??
        new _$MoviePreviewListData._(
            languageId: languageId, movieFilePath: movieFilePath, title: title);
    replace(_$result);
    return _$result;
  }
}

class _$SeasonListData extends SeasonListData {
  @override
  final int? seasonId;
  @override
  final int? seriesId;
  @override
  final String? thumbnail;
  @override
  final String? seasonName;
  @override
  final String? tagLine;
  @override
  final String? vendorName;
  @override
  final String? plot;
  @override
  final BuiltList<EpisodeListData>? episodeList;
  @override
  final BuiltList<MovieCastListData>? castList;
  @override
  final BuiltList<MovieGenreListData>? List;
  @override
  final BuiltList<MovieLanguageListData>? LanguageList;
  @override
  final BuiltList<MoviePreviewListData>? PreviewList;

  factory _$SeasonListData([void Function(SeasonListDataBuilder)? updates]) =>
      (new SeasonListDataBuilder()..update(updates)).build();

  _$SeasonListData._(
      {this.seasonId,
      this.seriesId,
      this.thumbnail,
      this.seasonName,
      this.tagLine,
      this.vendorName,
      this.plot,
      this.episodeList,
      this.castList,
      this.List,
      this.LanguageList,
      this.PreviewList})
      : super._();

  @override
  SeasonListData rebuild(void Function(SeasonListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SeasonListDataBuilder toBuilder() =>
      new SeasonListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SeasonListData &&
        seasonId == other.seasonId &&
        seriesId == other.seriesId &&
        thumbnail == other.thumbnail &&
        seasonName == other.seasonName &&
        tagLine == other.tagLine &&
        vendorName == other.vendorName &&
        plot == other.plot &&
        episodeList == other.episodeList &&
        castList == other.castList &&
        List == other.List &&
        LanguageList == other.LanguageList &&
        PreviewList == other.PreviewList;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, seasonId.hashCode),
                                                seriesId.hashCode),
                                            thumbnail.hashCode),
                                        seasonName.hashCode),
                                    tagLine.hashCode),
                                vendorName.hashCode),
                            plot.hashCode),
                        episodeList.hashCode),
                    castList.hashCode),
                List.hashCode),
            LanguageList.hashCode),
        PreviewList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SeasonListData')
          ..add('seasonId', seasonId)
          ..add('seriesId', seriesId)
          ..add('thumbnail', thumbnail)
          ..add('seasonName', seasonName)
          ..add('tagLine', tagLine)
          ..add('vendorName', vendorName)
          ..add('plot', plot)
          ..add('episodeList', episodeList)
          ..add('castList', castList)
          ..add('List', List)
          ..add('LanguageList', LanguageList)
          ..add('PreviewList', PreviewList))
        .toString();
  }
}

class SeasonListDataBuilder
    implements Builder<SeasonListData, SeasonListDataBuilder> {
  _$SeasonListData? _$v;

  int? _seasonId;
  int? get seasonId => _$this._seasonId;
  set seasonId(int? seasonId) => _$this._seasonId = seasonId;

  int? _seriesId;
  int? get seriesId => _$this._seriesId;
  set seriesId(int? seriesId) => _$this._seriesId = seriesId;

  String? _thumbnail;
  String? get thumbnail => _$this._thumbnail;
  set thumbnail(String? thumbnail) => _$this._thumbnail = thumbnail;

  String? _seasonName;
  String? get seasonName => _$this._seasonName;
  set seasonName(String? seasonName) => _$this._seasonName = seasonName;

  String? _tagLine;
  String? get tagLine => _$this._tagLine;
  set tagLine(String? tagLine) => _$this._tagLine = tagLine;

  String? _vendorName;
  String? get vendorName => _$this._vendorName;
  set vendorName(String? vendorName) => _$this._vendorName = vendorName;

  String? _plot;
  String? get plot => _$this._plot;
  set plot(String? plot) => _$this._plot = plot;

  ListBuilder<EpisodeListData>? _episodeList;
  ListBuilder<EpisodeListData> get episodeList =>
      _$this._episodeList ??= new ListBuilder<EpisodeListData>();
  set episodeList(ListBuilder<EpisodeListData>? episodeList) =>
      _$this._episodeList = episodeList;

  ListBuilder<MovieCastListData>? _castList;
  ListBuilder<MovieCastListData> get castList =>
      _$this._castList ??= new ListBuilder<MovieCastListData>();
  set castList(ListBuilder<MovieCastListData>? castList) =>
      _$this._castList = castList;

  ListBuilder<MovieGenreListData>? _List;
  ListBuilder<MovieGenreListData> get List =>
      _$this._List ??= new ListBuilder<MovieGenreListData>();
  set List(ListBuilder<MovieGenreListData>? List) => _$this._List = List;

  ListBuilder<MovieLanguageListData>? _LanguageList;
  ListBuilder<MovieLanguageListData> get LanguageList =>
      _$this._LanguageList ??= new ListBuilder<MovieLanguageListData>();
  set LanguageList(ListBuilder<MovieLanguageListData>? LanguageList) =>
      _$this._LanguageList = LanguageList;

  ListBuilder<MoviePreviewListData>? _PreviewList;
  ListBuilder<MoviePreviewListData> get PreviewList =>
      _$this._PreviewList ??= new ListBuilder<MoviePreviewListData>();
  set PreviewList(ListBuilder<MoviePreviewListData>? PreviewList) =>
      _$this._PreviewList = PreviewList;

  SeasonListDataBuilder();

  SeasonListDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _seasonId = $v.seasonId;
      _seriesId = $v.seriesId;
      _thumbnail = $v.thumbnail;
      _seasonName = $v.seasonName;
      _tagLine = $v.tagLine;
      _vendorName = $v.vendorName;
      _plot = $v.plot;
      _episodeList = $v.episodeList?.toBuilder();
      _castList = $v.castList?.toBuilder();
      _List = $v.List?.toBuilder();
      _LanguageList = $v.LanguageList?.toBuilder();
      _PreviewList = $v.PreviewList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SeasonListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SeasonListData;
  }

  @override
  void update(void Function(SeasonListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SeasonListData build() {
    _$SeasonListData _$result;
    try {
      _$result = _$v ??
          new _$SeasonListData._(
              seasonId: seasonId,
              seriesId: seriesId,
              thumbnail: thumbnail,
              seasonName: seasonName,
              tagLine: tagLine,
              vendorName: vendorName,
              plot: plot,
              episodeList: _episodeList?.build(),
              castList: _castList?.build(),
              List: _List?.build(),
              LanguageList: _LanguageList?.build(),
              PreviewList: _PreviewList?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'episodeList';
        _episodeList?.build();
        _$failedField = 'castList';
        _castList?.build();
        _$failedField = 'List';
        _List?.build();
        _$failedField = 'LanguageList';
        _LanguageList?.build();
        _$failedField = 'PreviewList';
        _PreviewList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SeasonListData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$EpisodeListData extends EpisodeListData {
  @override
  final int? episodeNumber;
  @override
  final String? name;
  @override
  final String? thumbnail;
  @override
  final String? episodeUrl;

  factory _$EpisodeListData([void Function(EpisodeListDataBuilder)? updates]) =>
      (new EpisodeListDataBuilder()..update(updates)).build();

  _$EpisodeListData._(
      {this.episodeNumber, this.name, this.thumbnail, this.episodeUrl})
      : super._();

  @override
  EpisodeListData rebuild(void Function(EpisodeListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EpisodeListDataBuilder toBuilder() =>
      new EpisodeListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EpisodeListData &&
        episodeNumber == other.episodeNumber &&
        name == other.name &&
        thumbnail == other.thumbnail &&
        episodeUrl == other.episodeUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, episodeNumber.hashCode), name.hashCode),
            thumbnail.hashCode),
        episodeUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EpisodeListData')
          ..add('episodeNumber', episodeNumber)
          ..add('name', name)
          ..add('thumbnail', thumbnail)
          ..add('episodeUrl', episodeUrl))
        .toString();
  }
}

class EpisodeListDataBuilder
    implements Builder<EpisodeListData, EpisodeListDataBuilder> {
  _$EpisodeListData? _$v;

  int? _episodeNumber;
  int? get episodeNumber => _$this._episodeNumber;
  set episodeNumber(int? episodeNumber) =>
      _$this._episodeNumber = episodeNumber;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _thumbnail;
  String? get thumbnail => _$this._thumbnail;
  set thumbnail(String? thumbnail) => _$this._thumbnail = thumbnail;

  String? _episodeUrl;
  String? get episodeUrl => _$this._episodeUrl;
  set episodeUrl(String? episodeUrl) => _$this._episodeUrl = episodeUrl;

  EpisodeListDataBuilder();

  EpisodeListDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _episodeNumber = $v.episodeNumber;
      _name = $v.name;
      _thumbnail = $v.thumbnail;
      _episodeUrl = $v.episodeUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EpisodeListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EpisodeListData;
  }

  @override
  void update(void Function(EpisodeListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EpisodeListData build() {
    final _$result = _$v ??
        new _$EpisodeListData._(
            episodeNumber: episodeNumber,
            name: name,
            thumbnail: thumbnail,
            episodeUrl: episodeUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
