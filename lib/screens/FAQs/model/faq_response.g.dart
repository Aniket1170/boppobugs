// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FAQResponse> _$fAQResponseSerializer = new _$FAQResponseSerializer();
Serializer<FAQData> _$fAQDataSerializer = new _$FAQDataSerializer();

class _$FAQResponseSerializer implements StructuredSerializer<FAQResponse> {
  @override
  final Iterable<Type> types = const [FAQResponse, _$FAQResponse];
  @override
  final String wireName = 'FAQResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, FAQResponse object,
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
              const FullType(BuiltList, const [const FullType(FAQData)])),
      'errors',
      serializers.serialize(object.errors,
          specifiedType:
              const FullType(BuiltList, const [const FullType(dynamic)])),
    ];

    return result;
  }

  @override
  FAQResponse deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FAQResponseBuilder();

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
                      BuiltList, const [const FullType(FAQData)]))!
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

class _$FAQDataSerializer implements StructuredSerializer<FAQData> {
  @override
  final Iterable<Type> types = const [FAQData, _$FAQData];
  @override
  final String wireName = 'FAQData';

  @override
  Iterable<Object?> serialize(Serializers serializers, FAQData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
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
    return result;
  }

  @override
  FAQData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FAQDataBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$FAQResponse extends FAQResponse {
  @override
  final String message;
  @override
  final bool success;
  @override
  final BuiltList<FAQData> data;
  @override
  final BuiltList<dynamic> errors;

  factory _$FAQResponse([void Function(FAQResponseBuilder)? updates]) =>
      (new FAQResponseBuilder()..update(updates)).build();

  _$FAQResponse._(
      {required this.message,
      required this.success,
      required this.data,
      required this.errors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(message, 'FAQResponse', 'message');
    BuiltValueNullFieldError.checkNotNull(success, 'FAQResponse', 'success');
    BuiltValueNullFieldError.checkNotNull(data, 'FAQResponse', 'data');
    BuiltValueNullFieldError.checkNotNull(errors, 'FAQResponse', 'errors');
  }

  @override
  FAQResponse rebuild(void Function(FAQResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FAQResponseBuilder toBuilder() => new FAQResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FAQResponse &&
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
    return (newBuiltValueToStringHelper('FAQResponse')
          ..add('message', message)
          ..add('success', success)
          ..add('data', data)
          ..add('errors', errors))
        .toString();
  }
}

class FAQResponseBuilder implements Builder<FAQResponse, FAQResponseBuilder> {
  _$FAQResponse? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<FAQData>? _data;
  ListBuilder<FAQData> get data => _$this._data ??= new ListBuilder<FAQData>();
  set data(ListBuilder<FAQData>? data) => _$this._data = data;

  ListBuilder<dynamic>? _errors;
  ListBuilder<dynamic> get errors =>
      _$this._errors ??= new ListBuilder<dynamic>();
  set errors(ListBuilder<dynamic>? errors) => _$this._errors = errors;

  FAQResponseBuilder();

  FAQResponseBuilder get _$this {
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
  void replace(FAQResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FAQResponse;
  }

  @override
  void update(void Function(FAQResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FAQResponse build() {
    _$FAQResponse _$result;
    try {
      _$result = _$v ??
          new _$FAQResponse._(
              message: BuiltValueNullFieldError.checkNotNull(
                  message, 'FAQResponse', 'message'),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, 'FAQResponse', 'success'),
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
            'FAQResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FAQData extends FAQData {
  @override
  final int? id;
  @override
  final String? type;
  @override
  final String? description;

  factory _$FAQData([void Function(FAQDataBuilder)? updates]) =>
      (new FAQDataBuilder()..update(updates)).build();

  _$FAQData._({this.id, this.type, this.description}) : super._();

  @override
  FAQData rebuild(void Function(FAQDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FAQDataBuilder toBuilder() => new FAQDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FAQData &&
        id == other.id &&
        type == other.type &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), type.hashCode), description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FAQData')
          ..add('id', id)
          ..add('type', type)
          ..add('description', description))
        .toString();
  }
}

class FAQDataBuilder implements Builder<FAQData, FAQDataBuilder> {
  _$FAQData? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  FAQDataBuilder();

  FAQDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FAQData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FAQData;
  }

  @override
  void update(void Function(FAQDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FAQData build() {
    final _$result =
        _$v ?? new _$FAQData._(id: id, type: type, description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
