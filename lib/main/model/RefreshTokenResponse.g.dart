// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RefreshTokenResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RefreshTokenResponse> _$refreshTokenResponseSerializer =
    new _$RefreshTokenResponseSerializer();
Serializer<RefreshTokenData> _$refreshTokenDataSerializer =
    new _$RefreshTokenDataSerializer();

class _$RefreshTokenResponseSerializer
    implements StructuredSerializer<RefreshTokenResponse> {
  @override
  final Iterable<Type> types = const [
    RefreshTokenResponse,
    _$RefreshTokenResponse
  ];
  @override
  final String wireName = 'RefreshTokenResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, RefreshTokenResponse object,
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
              BuiltList, const [const FullType(RefreshTokenData)])),
      'errors',
      serializers.serialize(object.errors,
          specifiedType:
              const FullType(BuiltList, const [const FullType(dynamic)])),
    ];

    return result;
  }

  @override
  RefreshTokenResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RefreshTokenResponseBuilder();

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
                      BuiltList, const [const FullType(RefreshTokenData)]))!
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

class _$RefreshTokenDataSerializer
    implements StructuredSerializer<RefreshTokenData> {
  @override
  final Iterable<Type> types = const [RefreshTokenData, _$RefreshTokenData];
  @override
  final String wireName = 'RefreshTokenData';

  @override
  Iterable<Object?> serialize(Serializers serializers, RefreshTokenData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.accessToken;
    if (value != null) {
      result
        ..add('access_token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.refreshToken;
    if (value != null) {
      result
        ..add('refresh_Token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RefreshTokenData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RefreshTokenDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'access_token':
          result.accessToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'refresh_Token':
          result.refreshToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$RefreshTokenResponse extends RefreshTokenResponse {
  @override
  final String message;
  @override
  final bool success;
  @override
  final BuiltList<RefreshTokenData> data;
  @override
  final BuiltList<dynamic> errors;

  factory _$RefreshTokenResponse(
          [void Function(RefreshTokenResponseBuilder)? updates]) =>
      (new RefreshTokenResponseBuilder()..update(updates)).build();

  _$RefreshTokenResponse._(
      {required this.message,
      required this.success,
      required this.data,
      required this.errors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, 'RefreshTokenResponse', 'message');
    BuiltValueNullFieldError.checkNotNull(
        success, 'RefreshTokenResponse', 'success');
    BuiltValueNullFieldError.checkNotNull(data, 'RefreshTokenResponse', 'data');
    BuiltValueNullFieldError.checkNotNull(
        errors, 'RefreshTokenResponse', 'errors');
  }

  @override
  RefreshTokenResponse rebuild(
          void Function(RefreshTokenResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefreshTokenResponseBuilder toBuilder() =>
      new RefreshTokenResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefreshTokenResponse &&
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
    return (newBuiltValueToStringHelper('RefreshTokenResponse')
          ..add('message', message)
          ..add('success', success)
          ..add('data', data)
          ..add('errors', errors))
        .toString();
  }
}

class RefreshTokenResponseBuilder
    implements Builder<RefreshTokenResponse, RefreshTokenResponseBuilder> {
  _$RefreshTokenResponse? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<RefreshTokenData>? _data;
  ListBuilder<RefreshTokenData> get data =>
      _$this._data ??= new ListBuilder<RefreshTokenData>();
  set data(ListBuilder<RefreshTokenData>? data) => _$this._data = data;

  ListBuilder<dynamic>? _errors;
  ListBuilder<dynamic> get errors =>
      _$this._errors ??= new ListBuilder<dynamic>();
  set errors(ListBuilder<dynamic>? errors) => _$this._errors = errors;

  RefreshTokenResponseBuilder();

  RefreshTokenResponseBuilder get _$this {
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
  void replace(RefreshTokenResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RefreshTokenResponse;
  }

  @override
  void update(void Function(RefreshTokenResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RefreshTokenResponse build() {
    _$RefreshTokenResponse _$result;
    try {
      _$result = _$v ??
          new _$RefreshTokenResponse._(
              message: BuiltValueNullFieldError.checkNotNull(
                  message, 'RefreshTokenResponse', 'message'),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, 'RefreshTokenResponse', 'success'),
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
            'RefreshTokenResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$RefreshTokenData extends RefreshTokenData {
  @override
  final String? accessToken;
  @override
  final String? refreshToken;

  factory _$RefreshTokenData(
          [void Function(RefreshTokenDataBuilder)? updates]) =>
      (new RefreshTokenDataBuilder()..update(updates)).build();

  _$RefreshTokenData._({this.accessToken, this.refreshToken}) : super._();

  @override
  RefreshTokenData rebuild(void Function(RefreshTokenDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefreshTokenDataBuilder toBuilder() =>
      new RefreshTokenDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefreshTokenData &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, accessToken.hashCode), refreshToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RefreshTokenData')
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken))
        .toString();
  }
}

class RefreshTokenDataBuilder
    implements Builder<RefreshTokenData, RefreshTokenDataBuilder> {
  _$RefreshTokenData? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  RefreshTokenDataBuilder();

  RefreshTokenDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RefreshTokenData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RefreshTokenData;
  }

  @override
  void update(void Function(RefreshTokenDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RefreshTokenData build() {
    final _$result = _$v ??
        new _$RefreshTokenData._(
            accessToken: accessToken, refreshToken: refreshToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
