// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchMovieResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchMovieResponse> _$searchMovieResponseSerializer =
    new _$SearchMovieResponseSerializer();
Serializer<SearchData> _$searchDataSerializer = new _$SearchDataSerializer();
Serializer<SearchCastListData> _$searchCastListDataSerializer =
    new _$SearchCastListDataSerializer();
Serializer<SearchTagListData> _$searchTagListDataSerializer =
    new _$SearchTagListDataSerializer();
Serializer<SearchLanguageListData> _$searchLanguageListDataSerializer =
    new _$SearchLanguageListDataSerializer();
Serializer<SearchPreviewListData> _$searchPreviewListDataSerializer =
    new _$SearchPreviewListDataSerializer();

class _$SearchMovieResponseSerializer
    implements StructuredSerializer<SearchMovieResponse> {
  @override
  final Iterable<Type> types = const [
    SearchMovieResponse,
    _$SearchMovieResponse
  ];
  @override
  final String wireName = 'SearchMovieResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SearchMovieResponse object,
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
              const FullType(BuiltList, const [const FullType(SearchData)])),
      'errors',
      serializers.serialize(object.errors,
          specifiedType:
              const FullType(BuiltList, const [const FullType(dynamic)])),
    ];

    return result;
  }

  @override
  SearchMovieResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchMovieResponseBuilder();

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
                      BuiltList, const [const FullType(SearchData)]))!
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

class _$SearchDataSerializer implements StructuredSerializer<SearchData> {
  @override
  final Iterable<Type> types = const [SearchData, _$SearchData];
  @override
  final String wireName = 'SearchData';

  @override
  Iterable<Object?> serialize(Serializers serializers, SearchData object,
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
        ..add('name')
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
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.usd;
    if (value != null) {
      result
        ..add('usd')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.euro;
    if (value != null) {
      result
        ..add('euro')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
                BuiltList, const [const FullType(SearchCastListData)])));
    }
    value = object.tagList;
    if (value != null) {
      result
        ..add('tagList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(SearchTagListData)])));
    }
    value = object.languageList;
    if (value != null) {
      result
        ..add('languageList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(SearchLanguageListData)])));
    }
    value = object.previewList;
    if (value != null) {
      result
        ..add('previewList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(SearchPreviewListData)])));
    }
    return result;
  }

  @override
  SearchData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchDataBuilder();

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
        case 'vendor_name':
          result.vendorName = serializers.deserialize(value,
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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'plot':
          result.plot = serializers.deserialize(value,
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
        case 'is_purchased':
          result.isPurchased = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'inr':
          result.inr = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'usd':
          result.usd = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'euro':
          result.euro = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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
        case 'content_type_id':
          result.contentTypeId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'castList':
          result.castList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SearchCastListData)]))!
              as BuiltList<Object?>);
          break;
        case 'tagList':
          result.tagList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SearchTagListData)]))!
              as BuiltList<Object?>);
          break;
        case 'languageList':
          result.languageList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(SearchLanguageListData)
              ]))! as BuiltList<Object?>);
          break;
        case 'previewList':
          result.previewList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(SearchPreviewListData)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$SearchCastListDataSerializer
    implements StructuredSerializer<SearchCastListData> {
  @override
  final Iterable<Type> types = const [SearchCastListData, _$SearchCastListData];
  @override
  final String wireName = 'SearchCastListData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SearchCastListData object,
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
        ..add('doc_cast_type')
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
        ..add('doc_cast_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SearchCastListData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchCastListDataBuilder();

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
        case 'doc_cast_type':
          result.movieCastType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'movie_id':
          result.movieIdCast = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'doc_cast_name':
          result.movieCastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SearchTagListDataSerializer
    implements StructuredSerializer<SearchTagListData> {
  @override
  final Iterable<Type> types = const [SearchTagListData, _$SearchTagListData];
  @override
  final String wireName = 'SearchTagListData';

  @override
  Iterable<Object?> serialize(Serializers serializers, SearchTagListData object,
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
        ..add('doc_tag_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SearchTagListData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchTagListDataBuilder();

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
        case 'doc_tag_name':
          result.movieTagName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SearchLanguageListDataSerializer
    implements StructuredSerializer<SearchLanguageListData> {
  @override
  final Iterable<Type> types = const [
    SearchLanguageListData,
    _$SearchLanguageListData
  ];
  @override
  final String wireName = 'SearchLanguageListData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SearchLanguageListData object,
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
        ..add('doc_language_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SearchLanguageListData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchLanguageListDataBuilder();

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
        case 'doc_language_name':
          result.languageName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SearchPreviewListDataSerializer
    implements StructuredSerializer<SearchPreviewListData> {
  @override
  final Iterable<Type> types = const [
    SearchPreviewListData,
    _$SearchPreviewListData
  ];
  @override
  final String wireName = 'SearchPreviewListData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SearchPreviewListData object,
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
  SearchPreviewListData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchPreviewListDataBuilder();

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

class _$SearchMovieResponse extends SearchMovieResponse {
  @override
  final String message;
  @override
  final bool success;
  @override
  final BuiltList<SearchData> data;
  @override
  final BuiltList<dynamic> errors;

  factory _$SearchMovieResponse(
          [void Function(SearchMovieResponseBuilder)? updates]) =>
      (new SearchMovieResponseBuilder()..update(updates)).build();

  _$SearchMovieResponse._(
      {required this.message,
      required this.success,
      required this.data,
      required this.errors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, 'SearchMovieResponse', 'message');
    BuiltValueNullFieldError.checkNotNull(
        success, 'SearchMovieResponse', 'success');
    BuiltValueNullFieldError.checkNotNull(data, 'SearchMovieResponse', 'data');
    BuiltValueNullFieldError.checkNotNull(
        errors, 'SearchMovieResponse', 'errors');
  }

  @override
  SearchMovieResponse rebuild(
          void Function(SearchMovieResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchMovieResponseBuilder toBuilder() =>
      new SearchMovieResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchMovieResponse &&
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
    return (newBuiltValueToStringHelper('SearchMovieResponse')
          ..add('message', message)
          ..add('success', success)
          ..add('data', data)
          ..add('errors', errors))
        .toString();
  }
}

class SearchMovieResponseBuilder
    implements Builder<SearchMovieResponse, SearchMovieResponseBuilder> {
  _$SearchMovieResponse? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<SearchData>? _data;
  ListBuilder<SearchData> get data =>
      _$this._data ??= new ListBuilder<SearchData>();
  set data(ListBuilder<SearchData>? data) => _$this._data = data;

  ListBuilder<dynamic>? _errors;
  ListBuilder<dynamic> get errors =>
      _$this._errors ??= new ListBuilder<dynamic>();
  set errors(ListBuilder<dynamic>? errors) => _$this._errors = errors;

  SearchMovieResponseBuilder();

  SearchMovieResponseBuilder get _$this {
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
  void replace(SearchMovieResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchMovieResponse;
  }

  @override
  void update(void Function(SearchMovieResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchMovieResponse build() {
    _$SearchMovieResponse _$result;
    try {
      _$result = _$v ??
          new _$SearchMovieResponse._(
              message: BuiltValueNullFieldError.checkNotNull(
                  message, 'SearchMovieResponse', 'message'),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, 'SearchMovieResponse', 'success'),
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
            'SearchMovieResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SearchData extends SearchData {
  @override
  final int? id;
  @override
  final int? vendorId;
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
  final String? companyLogo;
  @override
  final int? isWatched;
  @override
  final int? isPurchased;
  @override
  final int? inr;
  @override
  final int? usd;
  @override
  final int? euro;
  @override
  final String? file;
  @override
  final String? mobileBanner;
  @override
  final String? baseUrl;
  @override
  final int? docShortfilmId;
  @override
  final int? contentTypeId;
  @override
  final BuiltList<SearchCastListData>? castList;
  @override
  final BuiltList<SearchTagListData>? tagList;
  @override
  final BuiltList<SearchLanguageListData>? languageList;
  @override
  final BuiltList<SearchPreviewListData>? previewList;

  factory _$SearchData([void Function(SearchDataBuilder)? updates]) =>
      (new SearchDataBuilder()..update(updates)).build();

  _$SearchData._(
      {this.id,
      this.vendorId,
      this.vendorName,
      this.skuId,
      this.name,
      this.description,
      this.plot,
      this.companyLogo,
      this.isWatched,
      this.isPurchased,
      this.inr,
      this.usd,
      this.euro,
      this.file,
      this.mobileBanner,
      this.baseUrl,
      this.docShortfilmId,
      this.contentTypeId,
      this.castList,
      this.tagList,
      this.languageList,
      this.previewList})
      : super._();

  @override
  SearchData rebuild(void Function(SearchDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchDataBuilder toBuilder() => new SearchDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchData &&
        id == other.id &&
        vendorId == other.vendorId &&
        vendorName == other.vendorName &&
        skuId == other.skuId &&
        name == other.name &&
        description == other.description &&
        plot == other.plot &&
        companyLogo == other.companyLogo &&
        isWatched == other.isWatched &&
        isPurchased == other.isPurchased &&
        inr == other.inr &&
        usd == other.usd &&
        euro == other.euro &&
        file == other.file &&
        mobileBanner == other.mobileBanner &&
        baseUrl == other.baseUrl &&
        docShortfilmId == other.docShortfilmId &&
        contentTypeId == other.contentTypeId &&
        castList == other.castList &&
        tagList == other.tagList &&
        languageList == other.languageList &&
        previewList == other.previewList;
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
                                                                            $jc($jc($jc($jc(0, id.hashCode), vendorId.hashCode), vendorName.hashCode),
                                                                                skuId.hashCode),
                                                                            name.hashCode),
                                                                        description.hashCode),
                                                                    plot.hashCode),
                                                                companyLogo.hashCode),
                                                            isWatched.hashCode),
                                                        isPurchased.hashCode),
                                                    inr.hashCode),
                                                usd.hashCode),
                                            euro.hashCode),
                                        file.hashCode),
                                    mobileBanner.hashCode),
                                baseUrl.hashCode),
                            docShortfilmId.hashCode),
                        contentTypeId.hashCode),
                    castList.hashCode),
                tagList.hashCode),
            languageList.hashCode),
        previewList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchData')
          ..add('id', id)
          ..add('vendorId', vendorId)
          ..add('vendorName', vendorName)
          ..add('skuId', skuId)
          ..add('name', name)
          ..add('description', description)
          ..add('plot', plot)
          ..add('companyLogo', companyLogo)
          ..add('isWatched', isWatched)
          ..add('isPurchased', isPurchased)
          ..add('inr', inr)
          ..add('usd', usd)
          ..add('euro', euro)
          ..add('file', file)
          ..add('mobileBanner', mobileBanner)
          ..add('baseUrl', baseUrl)
          ..add('docShortfilmId', docShortfilmId)
          ..add('contentTypeId', contentTypeId)
          ..add('castList', castList)
          ..add('tagList', tagList)
          ..add('languageList', languageList)
          ..add('previewList', previewList))
        .toString();
  }
}

class SearchDataBuilder implements Builder<SearchData, SearchDataBuilder> {
  _$SearchData? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _vendorId;
  int? get vendorId => _$this._vendorId;
  set vendorId(int? vendorId) => _$this._vendorId = vendorId;

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

  String? _companyLogo;
  String? get companyLogo => _$this._companyLogo;
  set companyLogo(String? companyLogo) => _$this._companyLogo = companyLogo;

  int? _isWatched;
  int? get isWatched => _$this._isWatched;
  set isWatched(int? isWatched) => _$this._isWatched = isWatched;

  int? _isPurchased;
  int? get isPurchased => _$this._isPurchased;
  set isPurchased(int? isPurchased) => _$this._isPurchased = isPurchased;

  int? _inr;
  int? get inr => _$this._inr;
  set inr(int? inr) => _$this._inr = inr;

  int? _usd;
  int? get usd => _$this._usd;
  set usd(int? usd) => _$this._usd = usd;

  int? _euro;
  int? get euro => _$this._euro;
  set euro(int? euro) => _$this._euro = euro;

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

  int? _contentTypeId;
  int? get contentTypeId => _$this._contentTypeId;
  set contentTypeId(int? contentTypeId) =>
      _$this._contentTypeId = contentTypeId;

  ListBuilder<SearchCastListData>? _castList;
  ListBuilder<SearchCastListData> get castList =>
      _$this._castList ??= new ListBuilder<SearchCastListData>();
  set castList(ListBuilder<SearchCastListData>? castList) =>
      _$this._castList = castList;

  ListBuilder<SearchTagListData>? _tagList;
  ListBuilder<SearchTagListData> get tagList =>
      _$this._tagList ??= new ListBuilder<SearchTagListData>();
  set tagList(ListBuilder<SearchTagListData>? tagList) =>
      _$this._tagList = tagList;

  ListBuilder<SearchLanguageListData>? _languageList;
  ListBuilder<SearchLanguageListData> get languageList =>
      _$this._languageList ??= new ListBuilder<SearchLanguageListData>();
  set languageList(ListBuilder<SearchLanguageListData>? languageList) =>
      _$this._languageList = languageList;

  ListBuilder<SearchPreviewListData>? _previewList;
  ListBuilder<SearchPreviewListData> get previewList =>
      _$this._previewList ??= new ListBuilder<SearchPreviewListData>();
  set previewList(ListBuilder<SearchPreviewListData>? previewList) =>
      _$this._previewList = previewList;

  SearchDataBuilder();

  SearchDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _vendorId = $v.vendorId;
      _vendorName = $v.vendorName;
      _skuId = $v.skuId;
      _name = $v.name;
      _description = $v.description;
      _plot = $v.plot;
      _companyLogo = $v.companyLogo;
      _isWatched = $v.isWatched;
      _isPurchased = $v.isPurchased;
      _inr = $v.inr;
      _usd = $v.usd;
      _euro = $v.euro;
      _file = $v.file;
      _mobileBanner = $v.mobileBanner;
      _baseUrl = $v.baseUrl;
      _docShortfilmId = $v.docShortfilmId;
      _contentTypeId = $v.contentTypeId;
      _castList = $v.castList?.toBuilder();
      _tagList = $v.tagList?.toBuilder();
      _languageList = $v.languageList?.toBuilder();
      _previewList = $v.previewList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchData;
  }

  @override
  void update(void Function(SearchDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchData build() {
    _$SearchData _$result;
    try {
      _$result = _$v ??
          new _$SearchData._(
              id: id,
              vendorId: vendorId,
              vendorName: vendorName,
              skuId: skuId,
              name: name,
              description: description,
              plot: plot,
              companyLogo: companyLogo,
              isWatched: isWatched,
              isPurchased: isPurchased,
              inr: inr,
              usd: usd,
              euro: euro,
              file: file,
              mobileBanner: mobileBanner,
              baseUrl: baseUrl,
              docShortfilmId: docShortfilmId,
              contentTypeId: contentTypeId,
              castList: _castList?.build(),
              tagList: _tagList?.build(),
              languageList: _languageList?.build(),
              previewList: _previewList?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'castList';
        _castList?.build();
        _$failedField = 'tagList';
        _tagList?.build();
        _$failedField = 'languageList';
        _languageList?.build();
        _$failedField = 'previewList';
        _previewList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SearchCastListData extends SearchCastListData {
  @override
  final int? movieCastId;
  @override
  final String? movieCastType;
  @override
  final int? movieIdCast;
  @override
  final String? movieCastName;

  factory _$SearchCastListData(
          [void Function(SearchCastListDataBuilder)? updates]) =>
      (new SearchCastListDataBuilder()..update(updates)).build();

  _$SearchCastListData._(
      {this.movieCastId,
      this.movieCastType,
      this.movieIdCast,
      this.movieCastName})
      : super._();

  @override
  SearchCastListData rebuild(
          void Function(SearchCastListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchCastListDataBuilder toBuilder() =>
      new SearchCastListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchCastListData &&
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
    return (newBuiltValueToStringHelper('SearchCastListData')
          ..add('movieCastId', movieCastId)
          ..add('movieCastType', movieCastType)
          ..add('movieIdCast', movieIdCast)
          ..add('movieCastName', movieCastName))
        .toString();
  }
}

class SearchCastListDataBuilder
    implements Builder<SearchCastListData, SearchCastListDataBuilder> {
  _$SearchCastListData? _$v;

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

  SearchCastListDataBuilder();

  SearchCastListDataBuilder get _$this {
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
  void replace(SearchCastListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchCastListData;
  }

  @override
  void update(void Function(SearchCastListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchCastListData build() {
    final _$result = _$v ??
        new _$SearchCastListData._(
            movieCastId: movieCastId,
            movieCastType: movieCastType,
            movieIdCast: movieIdCast,
            movieCastName: movieCastName);
    replace(_$result);
    return _$result;
  }
}

class _$SearchTagListData extends SearchTagListData {
  @override
  final int? movieTagId;
  @override
  final int? movieIdTag;
  @override
  final String? movieTagName;

  factory _$SearchTagListData(
          [void Function(SearchTagListDataBuilder)? updates]) =>
      (new SearchTagListDataBuilder()..update(updates)).build();

  _$SearchTagListData._({this.movieTagId, this.movieIdTag, this.movieTagName})
      : super._();

  @override
  SearchTagListData rebuild(void Function(SearchTagListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchTagListDataBuilder toBuilder() =>
      new SearchTagListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchTagListData &&
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
    return (newBuiltValueToStringHelper('SearchTagListData')
          ..add('movieTagId', movieTagId)
          ..add('movieIdTag', movieIdTag)
          ..add('movieTagName', movieTagName))
        .toString();
  }
}

class SearchTagListDataBuilder
    implements Builder<SearchTagListData, SearchTagListDataBuilder> {
  _$SearchTagListData? _$v;

  int? _movieTagId;
  int? get movieTagId => _$this._movieTagId;
  set movieTagId(int? movieTagId) => _$this._movieTagId = movieTagId;

  int? _movieIdTag;
  int? get movieIdTag => _$this._movieIdTag;
  set movieIdTag(int? movieIdTag) => _$this._movieIdTag = movieIdTag;

  String? _movieTagName;
  String? get movieTagName => _$this._movieTagName;
  set movieTagName(String? movieTagName) => _$this._movieTagName = movieTagName;

  SearchTagListDataBuilder();

  SearchTagListDataBuilder get _$this {
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
  void replace(SearchTagListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchTagListData;
  }

  @override
  void update(void Function(SearchTagListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchTagListData build() {
    final _$result = _$v ??
        new _$SearchTagListData._(
            movieTagId: movieTagId,
            movieIdTag: movieIdTag,
            movieTagName: movieTagName);
    replace(_$result);
    return _$result;
  }
}

class _$SearchLanguageListData extends SearchLanguageListData {
  @override
  final int? languageId;
  @override
  final int? movieIdLang;
  @override
  final String? languageName;

  factory _$SearchLanguageListData(
          [void Function(SearchLanguageListDataBuilder)? updates]) =>
      (new SearchLanguageListDataBuilder()..update(updates)).build();

  _$SearchLanguageListData._(
      {this.languageId, this.movieIdLang, this.languageName})
      : super._();

  @override
  SearchLanguageListData rebuild(
          void Function(SearchLanguageListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchLanguageListDataBuilder toBuilder() =>
      new SearchLanguageListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchLanguageListData &&
        languageId == other.languageId &&
        movieIdLang == other.movieIdLang &&
        languageName == other.languageName;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, languageId.hashCode), movieIdLang.hashCode),
        languageName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchLanguageListData')
          ..add('languageId', languageId)
          ..add('movieIdLang', movieIdLang)
          ..add('languageName', languageName))
        .toString();
  }
}

class SearchLanguageListDataBuilder
    implements Builder<SearchLanguageListData, SearchLanguageListDataBuilder> {
  _$SearchLanguageListData? _$v;

  int? _languageId;
  int? get languageId => _$this._languageId;
  set languageId(int? languageId) => _$this._languageId = languageId;

  int? _movieIdLang;
  int? get movieIdLang => _$this._movieIdLang;
  set movieIdLang(int? movieIdLang) => _$this._movieIdLang = movieIdLang;

  String? _languageName;
  String? get languageName => _$this._languageName;
  set languageName(String? languageName) => _$this._languageName = languageName;

  SearchLanguageListDataBuilder();

  SearchLanguageListDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _languageId = $v.languageId;
      _movieIdLang = $v.movieIdLang;
      _languageName = $v.languageName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchLanguageListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchLanguageListData;
  }

  @override
  void update(void Function(SearchLanguageListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchLanguageListData build() {
    final _$result = _$v ??
        new _$SearchLanguageListData._(
            languageId: languageId,
            movieIdLang: movieIdLang,
            languageName: languageName);
    replace(_$result);
    return _$result;
  }
}

class _$SearchPreviewListData extends SearchPreviewListData {
  @override
  final int? languageId;
  @override
  final String? movieFilePath;
  @override
  final String? title;

  factory _$SearchPreviewListData(
          [void Function(SearchPreviewListDataBuilder)? updates]) =>
      (new SearchPreviewListDataBuilder()..update(updates)).build();

  _$SearchPreviewListData._({this.languageId, this.movieFilePath, this.title})
      : super._();

  @override
  SearchPreviewListData rebuild(
          void Function(SearchPreviewListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchPreviewListDataBuilder toBuilder() =>
      new SearchPreviewListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchPreviewListData &&
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
    return (newBuiltValueToStringHelper('SearchPreviewListData')
          ..add('languageId', languageId)
          ..add('movieFilePath', movieFilePath)
          ..add('title', title))
        .toString();
  }
}

class SearchPreviewListDataBuilder
    implements Builder<SearchPreviewListData, SearchPreviewListDataBuilder> {
  _$SearchPreviewListData? _$v;

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

  SearchPreviewListDataBuilder();

  SearchPreviewListDataBuilder get _$this {
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
  void replace(SearchPreviewListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchPreviewListData;
  }

  @override
  void update(void Function(SearchPreviewListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchPreviewListData build() {
    final _$result = _$v ??
        new _$SearchPreviewListData._(
            languageId: languageId, movieFilePath: movieFilePath, title: title);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
