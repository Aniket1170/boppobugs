// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfileResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProfileResponse> _$profileResponseSerializer =
    new _$ProfileResponseSerializer();
Serializer<ProfileData> _$profileDataSerializer = new _$ProfileDataSerializer();

class _$ProfileResponseSerializer
    implements StructuredSerializer<ProfileResponse> {
  @override
  final Iterable<Type> types = const [ProfileResponse, _$ProfileResponse];
  @override
  final String wireName = 'ProfileResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProfileResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.success;
    if (value != null) {
      result
        ..add('success')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ProfileData)])));
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
  ProfileResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProfileData)]))!
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

class _$ProfileDataSerializer implements StructuredSerializer<ProfileData> {
  @override
  final Iterable<Type> types = const [ProfileData, _$ProfileData];
  @override
  final String wireName = 'ProfileData';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProfileData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.countryCode;
    if (value != null) {
      result
        ..add('country_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mobileNo;
    if (value != null) {
      result
        ..add('mobile_no')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.age;
    if (value != null) {
      result
        ..add('age')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isMobileVerified;
    if (value != null) {
      result
        ..add('mobile_verified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isActive;
    if (value != null) {
      result
        ..add('is_active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  ProfileData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileDataBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country_code':
          result.countryCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mobile_no':
          result.mobileNo = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'mobile_verified':
          result.isMobileVerified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_active':
          result.isActive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$ProfileResponse extends ProfileResponse {
  @override
  final String? message;
  @override
  final bool? success;
  @override
  final BuiltList<ProfileData>? data;
  @override
  final BuiltList<dynamic>? errors;

  factory _$ProfileResponse([void Function(ProfileResponseBuilder)? updates]) =>
      (new ProfileResponseBuilder()..update(updates)).build();

  _$ProfileResponse._({this.message, this.success, this.data, this.errors})
      : super._();

  @override
  ProfileResponse rebuild(void Function(ProfileResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileResponseBuilder toBuilder() =>
      new ProfileResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileResponse &&
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
    return (newBuiltValueToStringHelper('ProfileResponse')
          ..add('message', message)
          ..add('success', success)
          ..add('data', data)
          ..add('errors', errors))
        .toString();
  }
}

class ProfileResponseBuilder
    implements Builder<ProfileResponse, ProfileResponseBuilder> {
  _$ProfileResponse? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<ProfileData>? _data;
  ListBuilder<ProfileData> get data =>
      _$this._data ??= new ListBuilder<ProfileData>();
  set data(ListBuilder<ProfileData>? data) => _$this._data = data;

  ListBuilder<dynamic>? _errors;
  ListBuilder<dynamic> get errors =>
      _$this._errors ??= new ListBuilder<dynamic>();
  set errors(ListBuilder<dynamic>? errors) => _$this._errors = errors;

  ProfileResponseBuilder();

  ProfileResponseBuilder get _$this {
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
  void replace(ProfileResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfileResponse;
  }

  @override
  void update(void Function(ProfileResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfileResponse build() {
    _$ProfileResponse _$result;
    try {
      _$result = _$v ??
          new _$ProfileResponse._(
              message: message,
              success: success,
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
            'ProfileResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ProfileData extends ProfileData {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? countryCode;
  @override
  final int? mobileNo;
  @override
  final int? age;
  @override
  final int? gender;
  @override
  final bool? isMobileVerified;
  @override
  final bool? isActive;

  factory _$ProfileData([void Function(ProfileDataBuilder)? updates]) =>
      (new ProfileDataBuilder()..update(updates)).build();

  _$ProfileData._(
      {this.id,
      this.name,
      this.countryCode,
      this.mobileNo,
      this.age,
      this.gender,
      this.isMobileVerified,
      this.isActive})
      : super._();

  @override
  ProfileData rebuild(void Function(ProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileDataBuilder toBuilder() => new ProfileDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileData &&
        id == other.id &&
        name == other.name &&
        countryCode == other.countryCode &&
        mobileNo == other.mobileNo &&
        age == other.age &&
        gender == other.gender &&
        isMobileVerified == other.isMobileVerified &&
        isActive == other.isActive;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), name.hashCode),
                            countryCode.hashCode),
                        mobileNo.hashCode),
                    age.hashCode),
                gender.hashCode),
            isMobileVerified.hashCode),
        isActive.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfileData')
          ..add('id', id)
          ..add('name', name)
          ..add('countryCode', countryCode)
          ..add('mobileNo', mobileNo)
          ..add('age', age)
          ..add('gender', gender)
          ..add('isMobileVerified', isMobileVerified)
          ..add('isActive', isActive))
        .toString();
  }
}

class ProfileDataBuilder implements Builder<ProfileData, ProfileDataBuilder> {
  _$ProfileData? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(String? countryCode) => _$this._countryCode = countryCode;

  int? _mobileNo;
  int? get mobileNo => _$this._mobileNo;
  set mobileNo(int? mobileNo) => _$this._mobileNo = mobileNo;

  int? _age;
  int? get age => _$this._age;
  set age(int? age) => _$this._age = age;

  int? _gender;
  int? get gender => _$this._gender;
  set gender(int? gender) => _$this._gender = gender;

  bool? _isMobileVerified;
  bool? get isMobileVerified => _$this._isMobileVerified;
  set isMobileVerified(bool? isMobileVerified) =>
      _$this._isMobileVerified = isMobileVerified;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  ProfileDataBuilder();

  ProfileDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _countryCode = $v.countryCode;
      _mobileNo = $v.mobileNo;
      _age = $v.age;
      _gender = $v.gender;
      _isMobileVerified = $v.isMobileVerified;
      _isActive = $v.isActive;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfileData;
  }

  @override
  void update(void Function(ProfileDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfileData build() {
    final _$result = _$v ??
        new _$ProfileData._(
            id: id,
            name: name,
            countryCode: countryCode,
            mobileNo: mobileNo,
            age: age,
            gender: gender,
            isMobileVerified: isMobileVerified,
            isActive: isActive);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
