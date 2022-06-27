// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WishlistResponse> _$wishlistResponseSerializer =
    new _$WishlistResponseSerializer();
Serializer<WishlistData> _$wishlistDataSerializer =
    new _$WishlistDataSerializer();
Serializer<WishListCastItem> _$wishListCastItemSerializer =
    new _$WishListCastItemSerializer();

class _$WishlistResponseSerializer
    implements StructuredSerializer<WishlistResponse> {
  @override
  final Iterable<Type> types = const [WishlistResponse, _$WishlistResponse];
  @override
  final String wireName = 'WishlistResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, WishlistResponse object,
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
              const FullType(BuiltList, const [const FullType(WishlistData)])),
      'errors',
      serializers.serialize(object.errors,
          specifiedType:
              const FullType(BuiltList, const [const FullType(dynamic)])),
    ];

    return result;
  }

  @override
  WishlistResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WishlistResponseBuilder();

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
                      BuiltList, const [const FullType(WishlistData)]))!
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

class _$WishlistDataSerializer implements StructuredSerializer<WishlistData> {
  @override
  final Iterable<Type> types = const [WishlistData, _$WishlistData];
  @override
  final String wireName = 'WishlistData';

  @override
  Iterable<Object?> serialize(Serializers serializers, WishlistData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.contentId;
    if (value != null) {
      result
        ..add('content_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.contentTypeId;
    if (value != null) {
      result
        ..add('content_type_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.userId;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.file;
    if (value != null) {
      result
        ..add('file')
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
    value = object.previewList;
    if (value != null) {
      result
        ..add('previewList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(MoviePreviewListData)])));
    }
    value = object.castList;
    if (value != null) {
      result
        ..add('castList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(WishListCastItem)])));
    }
    return result;
  }

  @override
  WishlistData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WishlistDataBuilder();

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
        case 'content_id':
          result.contentId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'content_type_id':
          result.contentTypeId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'file':
          result.file = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'previewList':
          result.previewList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MoviePreviewListData)]))!
              as BuiltList<Object?>);
          break;
        case 'castList':
          result.castList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(WishListCastItem)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$WishListCastItemSerializer
    implements StructuredSerializer<WishListCastItem> {
  @override
  final Iterable<Type> types = const [WishListCastItem, _$WishListCastItem];
  @override
  final String wireName = 'WishListCastItem';

  @override
  Iterable<Object?> serialize(Serializers serializers, WishListCastItem object,
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
  WishListCastItem deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WishListCastItemBuilder();

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

class _$WishlistResponse extends WishlistResponse {
  @override
  final String message;
  @override
  final bool success;
  @override
  final BuiltList<WishlistData> data;
  @override
  final BuiltList<dynamic> errors;

  factory _$WishlistResponse(
          [void Function(WishlistResponseBuilder)? updates]) =>
      (new WishlistResponseBuilder()..update(updates)).build();

  _$WishlistResponse._(
      {required this.message,
      required this.success,
      required this.data,
      required this.errors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, 'WishlistResponse', 'message');
    BuiltValueNullFieldError.checkNotNull(
        success, 'WishlistResponse', 'success');
    BuiltValueNullFieldError.checkNotNull(data, 'WishlistResponse', 'data');
    BuiltValueNullFieldError.checkNotNull(errors, 'WishlistResponse', 'errors');
  }

  @override
  WishlistResponse rebuild(void Function(WishlistResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WishlistResponseBuilder toBuilder() =>
      new WishlistResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WishlistResponse &&
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
    return (newBuiltValueToStringHelper('WishlistResponse')
          ..add('message', message)
          ..add('success', success)
          ..add('data', data)
          ..add('errors', errors))
        .toString();
  }
}

class WishlistResponseBuilder
    implements Builder<WishlistResponse, WishlistResponseBuilder> {
  _$WishlistResponse? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<WishlistData>? _data;
  ListBuilder<WishlistData> get data =>
      _$this._data ??= new ListBuilder<WishlistData>();
  set data(ListBuilder<WishlistData>? data) => _$this._data = data;

  ListBuilder<dynamic>? _errors;
  ListBuilder<dynamic> get errors =>
      _$this._errors ??= new ListBuilder<dynamic>();
  set errors(ListBuilder<dynamic>? errors) => _$this._errors = errors;

  WishlistResponseBuilder();

  WishlistResponseBuilder get _$this {
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
  void replace(WishlistResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WishlistResponse;
  }

  @override
  void update(void Function(WishlistResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WishlistResponse build() {
    _$WishlistResponse _$result;
    try {
      _$result = _$v ??
          new _$WishlistResponse._(
              message: BuiltValueNullFieldError.checkNotNull(
                  message, 'WishlistResponse', 'message'),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, 'WishlistResponse', 'success'),
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
            'WishlistResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$WishlistData extends WishlistData {
  @override
  final int? id;
  @override
  final int? contentId;
  @override
  final int? contentTypeId;
  @override
  final int? userId;
  @override
  final String? name;
  @override
  final String? file;
  @override
  final String? description;
  @override
  final BuiltList<MoviePreviewListData>? previewList;
  @override
  final BuiltList<WishListCastItem>? castList;

  factory _$WishlistData([void Function(WishlistDataBuilder)? updates]) =>
      (new WishlistDataBuilder()..update(updates)).build();

  _$WishlistData._(
      {this.id,
      this.contentId,
      this.contentTypeId,
      this.userId,
      this.name,
      this.file,
      this.description,
      this.previewList,
      this.castList})
      : super._();

  @override
  WishlistData rebuild(void Function(WishlistDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WishlistDataBuilder toBuilder() => new WishlistDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WishlistData &&
        id == other.id &&
        contentId == other.contentId &&
        contentTypeId == other.contentTypeId &&
        userId == other.userId &&
        name == other.name &&
        file == other.file &&
        description == other.description &&
        previewList == other.previewList &&
        castList == other.castList;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), contentId.hashCode),
                                contentTypeId.hashCode),
                            userId.hashCode),
                        name.hashCode),
                    file.hashCode),
                description.hashCode),
            previewList.hashCode),
        castList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WishlistData')
          ..add('id', id)
          ..add('contentId', contentId)
          ..add('contentTypeId', contentTypeId)
          ..add('userId', userId)
          ..add('name', name)
          ..add('file', file)
          ..add('description', description)
          ..add('previewList', previewList)
          ..add('castList', castList))
        .toString();
  }
}

class WishlistDataBuilder
    implements Builder<WishlistData, WishlistDataBuilder> {
  _$WishlistData? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _contentId;
  int? get contentId => _$this._contentId;
  set contentId(int? contentId) => _$this._contentId = contentId;

  int? _contentTypeId;
  int? get contentTypeId => _$this._contentTypeId;
  set contentTypeId(int? contentTypeId) =>
      _$this._contentTypeId = contentTypeId;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _file;
  String? get file => _$this._file;
  set file(String? file) => _$this._file = file;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<MoviePreviewListData>? _previewList;
  ListBuilder<MoviePreviewListData> get previewList =>
      _$this._previewList ??= new ListBuilder<MoviePreviewListData>();
  set previewList(ListBuilder<MoviePreviewListData>? previewList) =>
      _$this._previewList = previewList;

  ListBuilder<WishListCastItem>? _castList;
  ListBuilder<WishListCastItem> get castList =>
      _$this._castList ??= new ListBuilder<WishListCastItem>();
  set castList(ListBuilder<WishListCastItem>? castList) =>
      _$this._castList = castList;

  WishlistDataBuilder();

  WishlistDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _contentId = $v.contentId;
      _contentTypeId = $v.contentTypeId;
      _userId = $v.userId;
      _name = $v.name;
      _file = $v.file;
      _description = $v.description;
      _previewList = $v.previewList?.toBuilder();
      _castList = $v.castList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WishlistData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WishlistData;
  }

  @override
  void update(void Function(WishlistDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WishlistData build() {
    _$WishlistData _$result;
    try {
      _$result = _$v ??
          new _$WishlistData._(
              id: id,
              contentId: contentId,
              contentTypeId: contentTypeId,
              userId: userId,
              name: name,
              file: file,
              description: description,
              previewList: _previewList?.build(),
              castList: _castList?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'previewList';
        _previewList?.build();
        _$failedField = 'castList';
        _castList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'WishlistData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$WishListCastItem extends WishListCastItem {
  @override
  final int? movieCastId;
  @override
  final String? movieCastType;
  @override
  final int? movieIdCast;
  @override
  final String? movieCastName;

  factory _$WishListCastItem(
          [void Function(WishListCastItemBuilder)? updates]) =>
      (new WishListCastItemBuilder()..update(updates)).build();

  _$WishListCastItem._(
      {this.movieCastId,
      this.movieCastType,
      this.movieIdCast,
      this.movieCastName})
      : super._();

  @override
  WishListCastItem rebuild(void Function(WishListCastItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WishListCastItemBuilder toBuilder() =>
      new WishListCastItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WishListCastItem &&
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
    return (newBuiltValueToStringHelper('WishListCastItem')
          ..add('movieCastId', movieCastId)
          ..add('movieCastType', movieCastType)
          ..add('movieIdCast', movieIdCast)
          ..add('movieCastName', movieCastName))
        .toString();
  }
}

class WishListCastItemBuilder
    implements Builder<WishListCastItem, WishListCastItemBuilder> {
  _$WishListCastItem? _$v;

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

  WishListCastItemBuilder();

  WishListCastItemBuilder get _$this {
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
  void replace(WishListCastItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WishListCastItem;
  }

  @override
  void update(void Function(WishListCastItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WishListCastItem build() {
    final _$result = _$v ??
        new _$WishListCastItem._(
            movieCastId: movieCastId,
            movieCastType: movieCastType,
            movieIdCast: movieIdCast,
            movieCastName: movieCastName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
