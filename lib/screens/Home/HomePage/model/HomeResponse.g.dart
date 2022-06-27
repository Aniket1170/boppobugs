// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HomeResponse> _$homeResponseSerializer =
    new _$HomeResponseSerializer();
Serializer<HomeData> _$homeDataSerializer = new _$HomeDataSerializer();
Serializer<WatchingListData> _$watchingListDataSerializer =
    new _$WatchingListDataSerializer();
Serializer<CastListData> _$castListDataSerializer =
    new _$CastListDataSerializer();
Serializer<TagListData> _$tagListDataSerializer = new _$TagListDataSerializer();
Serializer<LanguageListData> _$languageListDataSerializer =
    new _$LanguageListDataSerializer();

class _$HomeResponseSerializer implements StructuredSerializer<HomeResponse> {
  @override
  final Iterable<Type> types = const [HomeResponse, _$HomeResponse];
  @override
  final String wireName = 'HomeResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, HomeResponse object,
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
          specifiedType:
              const FullType(BuiltList, const [const FullType(HomeData)])),
      'errors',
      serializers.serialize(object.errors,
          specifiedType:
              const FullType(BuiltList, const [const FullType(dynamic)])),
    ];

    return result;
  }

  @override
  HomeResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HomeResponseBuilder();

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
                      BuiltList, const [const FullType(HomeData)]))!
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

class _$HomeDataSerializer implements StructuredSerializer<HomeData> {
  @override
  final Iterable<Type> types = const [HomeData, _$HomeData];
  @override
  final String wireName = 'HomeData';

  @override
  Iterable<Object?> serialize(Serializers serializers, HomeData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.banner;
    if (value != null) {
      result
        ..add('banner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(WatchingListData)])));
    }
    value = object.moviesList;
    if (value != null) {
      result
        ..add('movieList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(WatchingListData)])));
    }
    value = object.watchingList;
    if (value != null) {
      result
        ..add('watchingList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(WatchingListData)])));
    }
    value = object.latestTrendMovies;
    if (value != null) {
      result
        ..add('latestTrendMovies')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(WatchingListData)])));
    }
    value = object.webseries;
    if (value != null) {
      result
        ..add('webseries')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(WatchingListData)])));
    }
    value = object.docshortfilm;
    if (value != null) {
      result
        ..add('docshortfilm')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(WatchingListData)])));
    }
    return result;
  }

  @override
  HomeData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HomeDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'banner':
          result.banner.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(WatchingListData)]))!
              as BuiltList<Object?>);
          break;
        case 'movieList':
          result.moviesList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(WatchingListData)]))!
              as BuiltList<Object?>);
          break;
        case 'watchingList':
          result.watchingList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(WatchingListData)]))!
              as BuiltList<Object?>);
          break;
        case 'latestTrendMovies':
          result.latestTrendMovies.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(WatchingListData)]))!
              as BuiltList<Object?>);
          break;
        case 'webseries':
          result.webseries.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(WatchingListData)]))!
              as BuiltList<Object?>);
          break;
        case 'docshortfilm':
          result.docshortfilm.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(WatchingListData)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$WatchingListDataSerializer
    implements StructuredSerializer<WatchingListData> {
  @override
  final Iterable<Type> types = const [WatchingListData, _$WatchingListData];
  @override
  final String wireName = 'WatchingListData';

  @override
  Iterable<Object?> serialize(Serializers serializers, WatchingListData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.seasonId;
    if (value != null) {
      result
        ..add('season_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.movieId;
    if (value != null) {
      result
        ..add('movie_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isWatched;
    if (value != null) {
      result
        ..add('is_watched')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isPurchased;
    if (value != null) {
      result
        ..add('is_purchased')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.vendorId;
    if (value != null) {
      result
        ..add('vendor_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.vendorName;
    if (value != null) {
      result
        ..add('vendor_name')
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
    value = object.companyLogo;
    if (value != null) {
      result
        ..add('company_logo')
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
        ..add('name')
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
    value = object.inr;
    if (value != null) {
      result
        ..add('inr')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
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
    value = object.contentTypePId;
    if (value != null) {
      result
        ..add('content_type_p_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.castList;
    if (value != null) {
      result
        ..add('castList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(CastListData)])));
    }
    value = object.genreList;
    if (value != null) {
      result
        ..add('genreList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(TagListData)])));
    }
    value = object.languageList;
    if (value != null) {
      result
        ..add('languageList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(LanguageListData)])));
    }
    return result;
  }

  @override
  WatchingListData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WatchingListDataBuilder();

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
        case 'season_id':
          result.seasonId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'movie_id':
          result.movieId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_watched':
          result.isWatched = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_purchased':
          result.isPurchased = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'vendor_id':
          result.vendorId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'vendor_name':
          result.vendorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company_logo':
          result.companyLogo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sku_id':
          result.skuId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'plot':
          result.plot = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'inr':
          result.inr = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
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
        case 'content_type_p_id':
          result.contentTypePId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'castList':
          result.castList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CastListData)]))!
              as BuiltList<Object?>);
          break;
        case 'genreList':
          result.genreList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TagListData)]))!
              as BuiltList<Object?>);
          break;
        case 'languageList':
          result.languageList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(LanguageListData)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$CastListDataSerializer implements StructuredSerializer<CastListData> {
  @override
  final Iterable<Type> types = const [CastListData, _$CastListData];
  @override
  final String wireName = 'CastListData';

  @override
  Iterable<Object?> serialize(Serializers serializers, CastListData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.movieCastId;
    if (value != null) {
      result
        ..add('movie_cast_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.movieCastType;
    if (value != null) {
      result
        ..add('movie_cast_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.movieIdCast;
    if (value != null) {
      result
        ..add('movie_id_cast')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.movieCastName;
    if (value != null) {
      result
        ..add('movie_cast_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CastListData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CastListDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'movie_cast_id':
          result.movieCastId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'movie_cast_type':
          result.movieCastType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'movie_id_cast':
          result.movieIdCast = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'movie_cast_name':
          result.movieCastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$TagListDataSerializer implements StructuredSerializer<TagListData> {
  @override
  final Iterable<Type> types = const [TagListData, _$TagListData];
  @override
  final String wireName = 'TagListData';

  @override
  Iterable<Object?> serialize(Serializers serializers, TagListData object,
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
        ..add('movieTagName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  TagListData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TagListDataBuilder();

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
        case 'movieTagName':
          result.movieTagName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$LanguageListDataSerializer
    implements StructuredSerializer<LanguageListData> {
  @override
  final Iterable<Type> types = const [LanguageListData, _$LanguageListData];
  @override
  final String wireName = 'LanguageListData';

  @override
  Iterable<Object?> serialize(Serializers serializers, LanguageListData object,
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
    value = object.movieLanguageName;
    if (value != null) {
      result
        ..add('movie_language_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  LanguageListData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LanguageListDataBuilder();

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
          result.movieLanguageName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$HomeResponse extends HomeResponse {
  @override
  final String message;
  @override
  final bool success;
  @override
  final BuiltList<HomeData> data;
  @override
  final BuiltList<dynamic> errors;

  factory _$HomeResponse([void Function(HomeResponseBuilder)? updates]) =>
      (new HomeResponseBuilder()..update(updates)).build();

  _$HomeResponse._(
      {required this.message,
      required this.success,
      required this.data,
      required this.errors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(message, 'HomeResponse', 'message');
    BuiltValueNullFieldError.checkNotNull(success, 'HomeResponse', 'success');
    BuiltValueNullFieldError.checkNotNull(data, 'HomeResponse', 'data');
    BuiltValueNullFieldError.checkNotNull(errors, 'HomeResponse', 'errors');
  }

  @override
  HomeResponse rebuild(void Function(HomeResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeResponseBuilder toBuilder() => new HomeResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeResponse &&
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
    return (newBuiltValueToStringHelper('HomeResponse')
          ..add('message', message)
          ..add('success', success)
          ..add('data', data)
          ..add('errors', errors))
        .toString();
  }
}

class HomeResponseBuilder
    implements Builder<HomeResponse, HomeResponseBuilder> {
  _$HomeResponse? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<HomeData>? _data;
  ListBuilder<HomeData> get data =>
      _$this._data ??= new ListBuilder<HomeData>();
  set data(ListBuilder<HomeData>? data) => _$this._data = data;

  ListBuilder<dynamic>? _errors;
  ListBuilder<dynamic> get errors =>
      _$this._errors ??= new ListBuilder<dynamic>();
  set errors(ListBuilder<dynamic>? errors) => _$this._errors = errors;

  HomeResponseBuilder();

  HomeResponseBuilder get _$this {
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
  void replace(HomeResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HomeResponse;
  }

  @override
  void update(void Function(HomeResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HomeResponse build() {
    _$HomeResponse _$result;
    try {
      _$result = _$v ??
          new _$HomeResponse._(
              message: BuiltValueNullFieldError.checkNotNull(
                  message, 'HomeResponse', 'message'),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, 'HomeResponse', 'success'),
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
            'HomeResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$HomeData extends HomeData {
  @override
  final BuiltList<WatchingListData>? banner;
  @override
  final BuiltList<WatchingListData>? moviesList;
  @override
  final BuiltList<WatchingListData>? watchingList;
  @override
  final BuiltList<WatchingListData>? latestTrendMovies;
  @override
  final BuiltList<WatchingListData>? webseries;
  @override
  final BuiltList<WatchingListData>? docshortfilm;

  factory _$HomeData([void Function(HomeDataBuilder)? updates]) =>
      (new HomeDataBuilder()..update(updates)).build();

  _$HomeData._(
      {this.banner,
      this.moviesList,
      this.watchingList,
      this.latestTrendMovies,
      this.webseries,
      this.docshortfilm})
      : super._();

  @override
  HomeData rebuild(void Function(HomeDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeDataBuilder toBuilder() => new HomeDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeData &&
        banner == other.banner &&
        moviesList == other.moviesList &&
        watchingList == other.watchingList &&
        latestTrendMovies == other.latestTrendMovies &&
        webseries == other.webseries &&
        docshortfilm == other.docshortfilm;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, banner.hashCode), moviesList.hashCode),
                    watchingList.hashCode),
                latestTrendMovies.hashCode),
            webseries.hashCode),
        docshortfilm.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HomeData')
          ..add('banner', banner)
          ..add('moviesList', moviesList)
          ..add('watchingList', watchingList)
          ..add('latestTrendMovies', latestTrendMovies)
          ..add('webseries', webseries)
          ..add('docshortfilm', docshortfilm))
        .toString();
  }
}

class HomeDataBuilder implements Builder<HomeData, HomeDataBuilder> {
  _$HomeData? _$v;

  ListBuilder<WatchingListData>? _banner;
  ListBuilder<WatchingListData> get banner =>
      _$this._banner ??= new ListBuilder<WatchingListData>();
  set banner(ListBuilder<WatchingListData>? banner) => _$this._banner = banner;

  ListBuilder<WatchingListData>? _moviesList;
  ListBuilder<WatchingListData> get moviesList =>
      _$this._moviesList ??= new ListBuilder<WatchingListData>();
  set moviesList(ListBuilder<WatchingListData>? moviesList) =>
      _$this._moviesList = moviesList;

  ListBuilder<WatchingListData>? _watchingList;
  ListBuilder<WatchingListData> get watchingList =>
      _$this._watchingList ??= new ListBuilder<WatchingListData>();
  set watchingList(ListBuilder<WatchingListData>? watchingList) =>
      _$this._watchingList = watchingList;

  ListBuilder<WatchingListData>? _latestTrendMovies;
  ListBuilder<WatchingListData> get latestTrendMovies =>
      _$this._latestTrendMovies ??= new ListBuilder<WatchingListData>();
  set latestTrendMovies(ListBuilder<WatchingListData>? latestTrendMovies) =>
      _$this._latestTrendMovies = latestTrendMovies;

  ListBuilder<WatchingListData>? _webseries;
  ListBuilder<WatchingListData> get webseries =>
      _$this._webseries ??= new ListBuilder<WatchingListData>();
  set webseries(ListBuilder<WatchingListData>? webseries) =>
      _$this._webseries = webseries;

  ListBuilder<WatchingListData>? _docshortfilm;
  ListBuilder<WatchingListData> get docshortfilm =>
      _$this._docshortfilm ??= new ListBuilder<WatchingListData>();
  set docshortfilm(ListBuilder<WatchingListData>? docshortfilm) =>
      _$this._docshortfilm = docshortfilm;

  HomeDataBuilder();

  HomeDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _banner = $v.banner?.toBuilder();
      _moviesList = $v.moviesList?.toBuilder();
      _watchingList = $v.watchingList?.toBuilder();
      _latestTrendMovies = $v.latestTrendMovies?.toBuilder();
      _webseries = $v.webseries?.toBuilder();
      _docshortfilm = $v.docshortfilm?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HomeData;
  }

  @override
  void update(void Function(HomeDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HomeData build() {
    _$HomeData _$result;
    try {
      _$result = _$v ??
          new _$HomeData._(
              banner: _banner?.build(),
              moviesList: _moviesList?.build(),
              watchingList: _watchingList?.build(),
              latestTrendMovies: _latestTrendMovies?.build(),
              webseries: _webseries?.build(),
              docshortfilm: _docshortfilm?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'banner';
        _banner?.build();
        _$failedField = 'moviesList';
        _moviesList?.build();
        _$failedField = 'watchingList';
        _watchingList?.build();
        _$failedField = 'latestTrendMovies';
        _latestTrendMovies?.build();
        _$failedField = 'webseries';
        _webseries?.build();
        _$failedField = 'docshortfilm';
        _docshortfilm?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HomeData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$WatchingListData extends WatchingListData {
  @override
  final int? id;
  @override
  final int? seasonId;
  @override
  final int? movieId;
  @override
  final int? isWatched;
  @override
  final int? isPurchased;
  @override
  final int? vendorId;
  @override
  final String? vendorName;
  @override
  final String? description;
  @override
  final String? companyLogo;
  @override
  final String? skuId;
  @override
  final String? name;
  @override
  final String? plot;
  @override
  final num? inr;
  @override
  final num? price;
  @override
  final num? usd;
  @override
  final num? euro;
  @override
  final String? file;
  @override
  final String? mobileBanner;
  @override
  final String? baseUrl;
  @override
  final int? docShortfilmId;
  @override
  final int? contentTypePId;
  @override
  final BuiltList<CastListData>? castList;
  @override
  final BuiltList<TagListData>? genreList;
  @override
  final BuiltList<LanguageListData>? languageList;

  factory _$WatchingListData(
          [void Function(WatchingListDataBuilder)? updates]) =>
      (new WatchingListDataBuilder()..update(updates)).build();

  _$WatchingListData._(
      {this.id,
      this.seasonId,
      this.movieId,
      this.isWatched,
      this.isPurchased,
      this.vendorId,
      this.vendorName,
      this.description,
      this.companyLogo,
      this.skuId,
      this.name,
      this.plot,
      this.inr,
      this.price,
      this.usd,
      this.euro,
      this.file,
      this.mobileBanner,
      this.baseUrl,
      this.docShortfilmId,
      this.contentTypePId,
      this.castList,
      this.genreList,
      this.languageList})
      : super._();

  @override
  WatchingListData rebuild(void Function(WatchingListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WatchingListDataBuilder toBuilder() =>
      new WatchingListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WatchingListData &&
        id == other.id &&
        seasonId == other.seasonId &&
        movieId == other.movieId &&
        isWatched == other.isWatched &&
        isPurchased == other.isPurchased &&
        vendorId == other.vendorId &&
        vendorName == other.vendorName &&
        description == other.description &&
        companyLogo == other.companyLogo &&
        skuId == other.skuId &&
        name == other.name &&
        plot == other.plot &&
        inr == other.inr &&
        price == other.price &&
        usd == other.usd &&
        euro == other.euro &&
        file == other.file &&
        mobileBanner == other.mobileBanner &&
        baseUrl == other.baseUrl &&
        docShortfilmId == other.docShortfilmId &&
        contentTypePId == other.contentTypePId &&
        castList == other.castList &&
        genreList == other.genreList &&
        languageList == other.languageList;
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
                                                                            $jc($jc($jc($jc($jc($jc(0, id.hashCode), seasonId.hashCode), movieId.hashCode), isWatched.hashCode), isPurchased.hashCode),
                                                                                vendorId.hashCode),
                                                                            vendorName.hashCode),
                                                                        description.hashCode),
                                                                    companyLogo.hashCode),
                                                                skuId.hashCode),
                                                            name.hashCode),
                                                        plot.hashCode),
                                                    inr.hashCode),
                                                price.hashCode),
                                            usd.hashCode),
                                        euro.hashCode),
                                    file.hashCode),
                                mobileBanner.hashCode),
                            baseUrl.hashCode),
                        docShortfilmId.hashCode),
                    contentTypePId.hashCode),
                castList.hashCode),
            genreList.hashCode),
        languageList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WatchingListData')
          ..add('id', id)
          ..add('seasonId', seasonId)
          ..add('movieId', movieId)
          ..add('isWatched', isWatched)
          ..add('isPurchased', isPurchased)
          ..add('vendorId', vendorId)
          ..add('vendorName', vendorName)
          ..add('description', description)
          ..add('companyLogo', companyLogo)
          ..add('skuId', skuId)
          ..add('name', name)
          ..add('plot', plot)
          ..add('inr', inr)
          ..add('price', price)
          ..add('usd', usd)
          ..add('euro', euro)
          ..add('file', file)
          ..add('mobileBanner', mobileBanner)
          ..add('baseUrl', baseUrl)
          ..add('docShortfilmId', docShortfilmId)
          ..add('contentTypePId', contentTypePId)
          ..add('castList', castList)
          ..add('genreList', genreList)
          ..add('languageList', languageList))
        .toString();
  }
}

class WatchingListDataBuilder
    implements Builder<WatchingListData, WatchingListDataBuilder> {
  _$WatchingListData? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _seasonId;
  int? get seasonId => _$this._seasonId;
  set seasonId(int? seasonId) => _$this._seasonId = seasonId;

  int? _movieId;
  int? get movieId => _$this._movieId;
  set movieId(int? movieId) => _$this._movieId = movieId;

  int? _isWatched;
  int? get isWatched => _$this._isWatched;
  set isWatched(int? isWatched) => _$this._isWatched = isWatched;

  int? _isPurchased;
  int? get isPurchased => _$this._isPurchased;
  set isPurchased(int? isPurchased) => _$this._isPurchased = isPurchased;

  int? _vendorId;
  int? get vendorId => _$this._vendorId;
  set vendorId(int? vendorId) => _$this._vendorId = vendorId;

  String? _vendorName;
  String? get vendorName => _$this._vendorName;
  set vendorName(String? vendorName) => _$this._vendorName = vendorName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _companyLogo;
  String? get companyLogo => _$this._companyLogo;
  set companyLogo(String? companyLogo) => _$this._companyLogo = companyLogo;

  String? _skuId;
  String? get skuId => _$this._skuId;
  set skuId(String? skuId) => _$this._skuId = skuId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _plot;
  String? get plot => _$this._plot;
  set plot(String? plot) => _$this._plot = plot;

  num? _inr;
  num? get inr => _$this._inr;
  set inr(num? inr) => _$this._inr = inr;

  num? _price;
  num? get price => _$this._price;
  set price(num? price) => _$this._price = price;

  num? _usd;
  num? get usd => _$this._usd;
  set usd(num? usd) => _$this._usd = usd;

  num? _euro;
  num? get euro => _$this._euro;
  set euro(num? euro) => _$this._euro = euro;

  String? _file;
  String? get file => _$this._file;
  set file(String? file) => _$this._file = file;

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

  int? _contentTypePId;
  int? get contentTypePId => _$this._contentTypePId;
  set contentTypePId(int? contentTypePId) =>
      _$this._contentTypePId = contentTypePId;

  ListBuilder<CastListData>? _castList;
  ListBuilder<CastListData> get castList =>
      _$this._castList ??= new ListBuilder<CastListData>();
  set castList(ListBuilder<CastListData>? castList) =>
      _$this._castList = castList;

  ListBuilder<TagListData>? _genreList;
  ListBuilder<TagListData> get genreList =>
      _$this._genreList ??= new ListBuilder<TagListData>();
  set genreList(ListBuilder<TagListData>? genreList) =>
      _$this._genreList = genreList;

  ListBuilder<LanguageListData>? _languageList;
  ListBuilder<LanguageListData> get languageList =>
      _$this._languageList ??= new ListBuilder<LanguageListData>();
  set languageList(ListBuilder<LanguageListData>? languageList) =>
      _$this._languageList = languageList;

  WatchingListDataBuilder();

  WatchingListDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _seasonId = $v.seasonId;
      _movieId = $v.movieId;
      _isWatched = $v.isWatched;
      _isPurchased = $v.isPurchased;
      _vendorId = $v.vendorId;
      _vendorName = $v.vendorName;
      _description = $v.description;
      _companyLogo = $v.companyLogo;
      _skuId = $v.skuId;
      _name = $v.name;
      _plot = $v.plot;
      _inr = $v.inr;
      _price = $v.price;
      _usd = $v.usd;
      _euro = $v.euro;
      _file = $v.file;
      _mobileBanner = $v.mobileBanner;
      _baseUrl = $v.baseUrl;
      _docShortfilmId = $v.docShortfilmId;
      _contentTypePId = $v.contentTypePId;
      _castList = $v.castList?.toBuilder();
      _genreList = $v.genreList?.toBuilder();
      _languageList = $v.languageList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WatchingListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WatchingListData;
  }

  @override
  void update(void Function(WatchingListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WatchingListData build() {
    _$WatchingListData _$result;
    try {
      _$result = _$v ??
          new _$WatchingListData._(
              id: id,
              seasonId: seasonId,
              movieId: movieId,
              isWatched: isWatched,
              isPurchased: isPurchased,
              vendorId: vendorId,
              vendorName: vendorName,
              description: description,
              companyLogo: companyLogo,
              skuId: skuId,
              name: name,
              plot: plot,
              inr: inr,
              price: price,
              usd: usd,
              euro: euro,
              file: file,
              mobileBanner: mobileBanner,
              baseUrl: baseUrl,
              docShortfilmId: docShortfilmId,
              contentTypePId: contentTypePId,
              castList: _castList?.build(),
              genreList: _genreList?.build(),
              languageList: _languageList?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'castList';
        _castList?.build();
        _$failedField = 'genreList';
        _genreList?.build();
        _$failedField = 'languageList';
        _languageList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'WatchingListData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CastListData extends CastListData {
  @override
  final String? movieCastId;
  @override
  final String? movieCastType;
  @override
  final String? movieIdCast;
  @override
  final String? movieCastName;

  factory _$CastListData([void Function(CastListDataBuilder)? updates]) =>
      (new CastListDataBuilder()..update(updates)).build();

  _$CastListData._(
      {this.movieCastId,
      this.movieCastType,
      this.movieIdCast,
      this.movieCastName})
      : super._();

  @override
  CastListData rebuild(void Function(CastListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CastListDataBuilder toBuilder() => new CastListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CastListData &&
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
    return (newBuiltValueToStringHelper('CastListData')
          ..add('movieCastId', movieCastId)
          ..add('movieCastType', movieCastType)
          ..add('movieIdCast', movieIdCast)
          ..add('movieCastName', movieCastName))
        .toString();
  }
}

class CastListDataBuilder
    implements Builder<CastListData, CastListDataBuilder> {
  _$CastListData? _$v;

  String? _movieCastId;
  String? get movieCastId => _$this._movieCastId;
  set movieCastId(String? movieCastId) => _$this._movieCastId = movieCastId;

  String? _movieCastType;
  String? get movieCastType => _$this._movieCastType;
  set movieCastType(String? movieCastType) =>
      _$this._movieCastType = movieCastType;

  String? _movieIdCast;
  String? get movieIdCast => _$this._movieIdCast;
  set movieIdCast(String? movieIdCast) => _$this._movieIdCast = movieIdCast;

  String? _movieCastName;
  String? get movieCastName => _$this._movieCastName;
  set movieCastName(String? movieCastName) =>
      _$this._movieCastName = movieCastName;

  CastListDataBuilder();

  CastListDataBuilder get _$this {
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
  void replace(CastListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CastListData;
  }

  @override
  void update(void Function(CastListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CastListData build() {
    final _$result = _$v ??
        new _$CastListData._(
            movieCastId: movieCastId,
            movieCastType: movieCastType,
            movieIdCast: movieIdCast,
            movieCastName: movieCastName);
    replace(_$result);
    return _$result;
  }
}

class _$TagListData extends TagListData {
  @override
  final int? movieTagId;
  @override
  final int? movieIdTag;
  @override
  final String? movieTagName;

  factory _$TagListData([void Function(TagListDataBuilder)? updates]) =>
      (new TagListDataBuilder()..update(updates)).build();

  _$TagListData._({this.movieTagId, this.movieIdTag, this.movieTagName})
      : super._();

  @override
  TagListData rebuild(void Function(TagListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TagListDataBuilder toBuilder() => new TagListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TagListData &&
        movieTagId == other.movieTagId &&
        movieIdTag == other.movieIdTag &&
        movieTagName == other.movieTagName;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, movieTagId.hashCode), movieIdTag.hashCode),
        movieTagName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TagListData')
          ..add('movieTagId', movieTagId)
          ..add('movieIdTag', movieIdTag)
          ..add('movieTagName', movieTagName))
        .toString();
  }
}

class TagListDataBuilder implements Builder<TagListData, TagListDataBuilder> {
  _$TagListData? _$v;

  int? _movieTagId;
  int? get movieTagId => _$this._movieTagId;
  set movieTagId(int? movieTagId) => _$this._movieTagId = movieTagId;

  int? _movieIdTag;
  int? get movieIdTag => _$this._movieIdTag;
  set movieIdTag(int? movieIdTag) => _$this._movieIdTag = movieIdTag;

  String? _movieTagName;
  String? get movieTagName => _$this._movieTagName;
  set movieTagName(String? movieTagName) => _$this._movieTagName = movieTagName;

  TagListDataBuilder();

  TagListDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _movieTagId = $v.movieTagId;
      _movieIdTag = $v.movieIdTag;
      _movieTagName = $v.movieTagName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TagListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TagListData;
  }

  @override
  void update(void Function(TagListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TagListData build() {
    final _$result = _$v ??
        new _$TagListData._(
            movieTagId: movieTagId,
            movieIdTag: movieIdTag,
            movieTagName: movieTagName);
    replace(_$result);
    return _$result;
  }
}

class _$LanguageListData extends LanguageListData {
  @override
  final int? languageId;
  @override
  final int? movieIdLang;
  @override
  final String? movieLanguageName;

  factory _$LanguageListData(
          [void Function(LanguageListDataBuilder)? updates]) =>
      (new LanguageListDataBuilder()..update(updates)).build();

  _$LanguageListData._(
      {this.languageId, this.movieIdLang, this.movieLanguageName})
      : super._();

  @override
  LanguageListData rebuild(void Function(LanguageListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LanguageListDataBuilder toBuilder() =>
      new LanguageListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LanguageListData &&
        languageId == other.languageId &&
        movieIdLang == other.movieIdLang &&
        movieLanguageName == other.movieLanguageName;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, languageId.hashCode), movieIdLang.hashCode),
        movieLanguageName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LanguageListData')
          ..add('languageId', languageId)
          ..add('movieIdLang', movieIdLang)
          ..add('movieLanguageName', movieLanguageName))
        .toString();
  }
}

class LanguageListDataBuilder
    implements Builder<LanguageListData, LanguageListDataBuilder> {
  _$LanguageListData? _$v;

  int? _languageId;
  int? get languageId => _$this._languageId;
  set languageId(int? languageId) => _$this._languageId = languageId;

  int? _movieIdLang;
  int? get movieIdLang => _$this._movieIdLang;
  set movieIdLang(int? movieIdLang) => _$this._movieIdLang = movieIdLang;

  String? _movieLanguageName;
  String? get movieLanguageName => _$this._movieLanguageName;
  set movieLanguageName(String? movieLanguageName) =>
      _$this._movieLanguageName = movieLanguageName;

  LanguageListDataBuilder();

  LanguageListDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _languageId = $v.languageId;
      _movieIdLang = $v.movieIdLang;
      _movieLanguageName = $v.movieLanguageName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LanguageListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LanguageListData;
  }

  @override
  void update(void Function(LanguageListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LanguageListData build() {
    final _$result = _$v ??
        new _$LanguageListData._(
            languageId: languageId,
            movieIdLang: movieIdLang,
            movieLanguageName: movieLanguageName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
