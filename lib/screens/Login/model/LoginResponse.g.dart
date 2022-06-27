// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LoginResponse> _$loginResponseSerializer =
    new _$LoginResponseSerializer();
Serializer<LoginData> _$loginDataSerializer = new _$LoginDataSerializer();
Serializer<UserData> _$userDataSerializer = new _$UserDataSerializer();

class _$LoginResponseSerializer implements StructuredSerializer<LoginResponse> {
  @override
  final Iterable<Type> types = const [LoginResponse, _$LoginResponse];
  @override
  final String wireName = 'LoginResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, LoginResponse object,
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
              const FullType(BuiltList, const [const FullType(LoginData)])),
      'errors',
      serializers.serialize(object.errors,
          specifiedType:
              const FullType(BuiltList, const [const FullType(dynamic)])),
    ];

    return result;
  }

  @override
  LoginResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginResponseBuilder();

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
                      BuiltList, const [const FullType(LoginData)]))!
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

class _$LoginDataSerializer implements StructuredSerializer<LoginData> {
  @override
  final Iterable<Type> types = const [LoginData, _$LoginData];
  @override
  final String wireName = 'LoginData';

  @override
  Iterable<Object?> serialize(Serializers serializers, LoginData object,
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
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(UserData)])));
    }
    return result;
  }

  @override
  LoginData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginDataBuilder();

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
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserData)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UserDataSerializer implements StructuredSerializer<UserData> {
  @override
  final Iterable<Type> types = const [UserData, _$UserData];
  @override
  final String wireName = 'UserData';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userId;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userAge;
    if (value != null) {
      result
        ..add('user_age')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.dob;
    if (value != null) {
      result
        ..add('user_dob')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  UserData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'user_name':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_age':
          result.userAge = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'user_dob':
          result.dob = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$LoginResponse extends LoginResponse {
  @override
  final String message;
  @override
  final bool success;
  @override
  final BuiltList<LoginData> data;
  @override
  final BuiltList<dynamic> errors;

  factory _$LoginResponse([void Function(LoginResponseBuilder)? updates]) =>
      (new LoginResponseBuilder()..update(updates)).build();

  _$LoginResponse._(
      {required this.message,
      required this.success,
      required this.data,
      required this.errors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(message, 'LoginResponse', 'message');
    BuiltValueNullFieldError.checkNotNull(success, 'LoginResponse', 'success');
    BuiltValueNullFieldError.checkNotNull(data, 'LoginResponse', 'data');
    BuiltValueNullFieldError.checkNotNull(errors, 'LoginResponse', 'errors');
  }

  @override
  LoginResponse rebuild(void Function(LoginResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginResponseBuilder toBuilder() => new LoginResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginResponse &&
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
    return (newBuiltValueToStringHelper('LoginResponse')
          ..add('message', message)
          ..add('success', success)
          ..add('data', data)
          ..add('errors', errors))
        .toString();
  }
}

class LoginResponseBuilder
    implements Builder<LoginResponse, LoginResponseBuilder> {
  _$LoginResponse? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<LoginData>? _data;
  ListBuilder<LoginData> get data =>
      _$this._data ??= new ListBuilder<LoginData>();
  set data(ListBuilder<LoginData>? data) => _$this._data = data;

  ListBuilder<dynamic>? _errors;
  ListBuilder<dynamic> get errors =>
      _$this._errors ??= new ListBuilder<dynamic>();
  set errors(ListBuilder<dynamic>? errors) => _$this._errors = errors;

  LoginResponseBuilder();

  LoginResponseBuilder get _$this {
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
  void replace(LoginResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginResponse;
  }

  @override
  void update(void Function(LoginResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginResponse build() {
    _$LoginResponse _$result;
    try {
      _$result = _$v ??
          new _$LoginResponse._(
              message: BuiltValueNullFieldError.checkNotNull(
                  message, 'LoginResponse', 'message'),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, 'LoginResponse', 'success'),
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
            'LoginResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$LoginData extends LoginData {
  @override
  final String? accessToken;
  @override
  final String? refreshToken;
  @override
  final BuiltList<UserData>? data;

  factory _$LoginData([void Function(LoginDataBuilder)? updates]) =>
      (new LoginDataBuilder()..update(updates)).build();

  _$LoginData._({this.accessToken, this.refreshToken, this.data}) : super._();

  @override
  LoginData rebuild(void Function(LoginDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginDataBuilder toBuilder() => new LoginDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginData &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, accessToken.hashCode), refreshToken.hashCode),
        data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginData')
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken)
          ..add('data', data))
        .toString();
  }
}

class LoginDataBuilder implements Builder<LoginData, LoginDataBuilder> {
  _$LoginData? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  ListBuilder<UserData>? _data;
  ListBuilder<UserData> get data =>
      _$this._data ??= new ListBuilder<UserData>();
  set data(ListBuilder<UserData>? data) => _$this._data = data;

  LoginDataBuilder();

  LoginDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginData;
  }

  @override
  void update(void Function(LoginDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginData build() {
    _$LoginData _$result;
    try {
      _$result = _$v ??
          new _$LoginData._(
              accessToken: accessToken,
              refreshToken: refreshToken,
              data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LoginData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserData extends UserData {
  @override
  final int? userId;
  @override
  final String? userName;
  @override
  final int? userAge;
  @override
  final String? dob;
  @override
  final int? gender;

  factory _$UserData([void Function(UserDataBuilder)? updates]) =>
      (new UserDataBuilder()..update(updates)).build();

  _$UserData._(
      {this.userId, this.userName, this.userAge, this.dob, this.gender})
      : super._();

  @override
  UserData rebuild(void Function(UserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataBuilder toBuilder() => new UserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserData &&
        userId == other.userId &&
        userName == other.userName &&
        userAge == other.userAge &&
        dob == other.dob &&
        gender == other.gender;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, userId.hashCode), userName.hashCode),
                userAge.hashCode),
            dob.hashCode),
        gender.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserData')
          ..add('userId', userId)
          ..add('userName', userName)
          ..add('userAge', userAge)
          ..add('dob', dob)
          ..add('gender', gender))
        .toString();
  }
}

class UserDataBuilder implements Builder<UserData, UserDataBuilder> {
  _$UserData? _$v;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  int? _userAge;
  int? get userAge => _$this._userAge;
  set userAge(int? userAge) => _$this._userAge = userAge;

  String? _dob;
  String? get dob => _$this._dob;
  set dob(String? dob) => _$this._dob = dob;

  int? _gender;
  int? get gender => _$this._gender;
  set gender(int? gender) => _$this._gender = gender;

  UserDataBuilder();

  UserDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _userName = $v.userName;
      _userAge = $v.userAge;
      _dob = $v.dob;
      _gender = $v.gender;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserData;
  }

  @override
  void update(void Function(UserDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserData build() {
    final _$result = _$v ??
        new _$UserData._(
            userId: userId,
            userName: userName,
            userAge: userAge,
            dob: dob,
            gender: gender);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
