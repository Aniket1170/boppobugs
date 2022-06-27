// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NormalSuccessResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NormalSuccessResponse> _$normalSuccessResponseSerializer =
    new _$NormalSuccessResponseSerializer();
Serializer<NormalSuccessData> _$normalSuccessDataSerializer =
    new _$NormalSuccessDataSerializer();

class _$NormalSuccessResponseSerializer
    implements StructuredSerializer<NormalSuccessResponse> {
  @override
  final Iterable<Type> types = const [
    NormalSuccessResponse,
    _$NormalSuccessResponse
  ];
  @override
  final String wireName = 'NormalSuccessResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NormalSuccessResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'success',
      serializers.serialize(object.success,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(NormalSuccessData)])));
    }
    value = object.errors;
    if (value != null) {
      result
        ..add('errors')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(dynamic)])));
    }
    return result;
  }

  @override
  NormalSuccessResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NormalSuccessResponseBuilder();

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
                      BuiltList, const [const FullType(NormalSuccessData)]))!
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

class _$NormalSuccessDataSerializer
    implements StructuredSerializer<NormalSuccessData> {
  @override
  final Iterable<Type> types = const [NormalSuccessData, _$NormalSuccessData];
  @override
  final String wireName = 'NormalSuccessData';

  @override
  Iterable<Object?> serialize(Serializers serializers, NormalSuccessData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.contentTypeId;
    if (value != null) {
      result
        ..add('content_type_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.contentId;
    if (value != null) {
      result
        ..add('content_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.userId;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  NormalSuccessData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NormalSuccessDataBuilder();

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
        case 'content_type_id':
          result.contentTypeId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'content_id':
          result.contentId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$NormalSuccessResponse extends NormalSuccessResponse {
  @override
  final String message;
  @override
  final bool success;
  @override
  final BuiltList<NormalSuccessData>? data;
  @override
  final BuiltList<dynamic>? errors;

  factory _$NormalSuccessResponse(
          [void Function(NormalSuccessResponseBuilder)? updates]) =>
      (new NormalSuccessResponseBuilder()..update(updates)).build();

  _$NormalSuccessResponse._(
      {required this.message, required this.success, this.data, this.errors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, 'NormalSuccessResponse', 'message');
    BuiltValueNullFieldError.checkNotNull(
        success, 'NormalSuccessResponse', 'success');
  }

  @override
  NormalSuccessResponse rebuild(
          void Function(NormalSuccessResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NormalSuccessResponseBuilder toBuilder() =>
      new NormalSuccessResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NormalSuccessResponse &&
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
    return (newBuiltValueToStringHelper('NormalSuccessResponse')
          ..add('message', message)
          ..add('success', success)
          ..add('data', data)
          ..add('errors', errors))
        .toString();
  }
}

class NormalSuccessResponseBuilder
    implements Builder<NormalSuccessResponse, NormalSuccessResponseBuilder> {
  _$NormalSuccessResponse? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<NormalSuccessData>? _data;
  ListBuilder<NormalSuccessData> get data =>
      _$this._data ??= new ListBuilder<NormalSuccessData>();
  set data(ListBuilder<NormalSuccessData>? data) => _$this._data = data;

  ListBuilder<dynamic>? _errors;
  ListBuilder<dynamic> get errors =>
      _$this._errors ??= new ListBuilder<dynamic>();
  set errors(ListBuilder<dynamic>? errors) => _$this._errors = errors;

  NormalSuccessResponseBuilder();

  NormalSuccessResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _success = $v.success;
      _data = $v.data?.toBuilder();
      _errors = $v.errors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NormalSuccessResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NormalSuccessResponse;
  }

  @override
  void update(void Function(NormalSuccessResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NormalSuccessResponse build() {
    _$NormalSuccessResponse _$result;
    try {
      _$result = _$v ??
          new _$NormalSuccessResponse._(
              message: BuiltValueNullFieldError.checkNotNull(
                  message, 'NormalSuccessResponse', 'message'),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, 'NormalSuccessResponse', 'success'),
              data: _data?.build(),
              errors: _errors?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'errors';
        _errors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NormalSuccessResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NormalSuccessData extends NormalSuccessData {
  @override
  final int? id;
  @override
  final int? contentTypeId;
  @override
  final int? contentId;
  @override
  final int? userId;

  factory _$NormalSuccessData(
          [void Function(NormalSuccessDataBuilder)? updates]) =>
      (new NormalSuccessDataBuilder()..update(updates)).build();

  _$NormalSuccessData._(
      {this.id, this.contentTypeId, this.contentId, this.userId})
      : super._();

  @override
  NormalSuccessData rebuild(void Function(NormalSuccessDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NormalSuccessDataBuilder toBuilder() =>
      new NormalSuccessDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NormalSuccessData &&
        id == other.id &&
        contentTypeId == other.contentTypeId &&
        contentId == other.contentId &&
        userId == other.userId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), contentTypeId.hashCode),
            contentId.hashCode),
        userId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NormalSuccessData')
          ..add('id', id)
          ..add('contentTypeId', contentTypeId)
          ..add('contentId', contentId)
          ..add('userId', userId))
        .toString();
  }
}

class NormalSuccessDataBuilder
    implements Builder<NormalSuccessData, NormalSuccessDataBuilder> {
  _$NormalSuccessData? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _contentTypeId;
  int? get contentTypeId => _$this._contentTypeId;
  set contentTypeId(int? contentTypeId) =>
      _$this._contentTypeId = contentTypeId;

  int? _contentId;
  int? get contentId => _$this._contentId;
  set contentId(int? contentId) => _$this._contentId = contentId;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  NormalSuccessDataBuilder();

  NormalSuccessDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _contentTypeId = $v.contentTypeId;
      _contentId = $v.contentId;
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NormalSuccessData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NormalSuccessData;
  }

  @override
  void update(void Function(NormalSuccessDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NormalSuccessData build() {
    final _$result = _$v ??
        new _$NormalSuccessData._(
            id: id,
            contentTypeId: contentTypeId,
            contentId: contentId,
            userId: userId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
