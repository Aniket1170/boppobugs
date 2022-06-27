// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_order.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddOrderResponse> _$addOrderResponseSerializer =
    new _$AddOrderResponseSerializer();
Serializer<AddOrderData> _$addOrderDataSerializer =
    new _$AddOrderDataSerializer();

class _$AddOrderResponseSerializer
    implements StructuredSerializer<AddOrderResponse> {
  @override
  final Iterable<Type> types = const [AddOrderResponse, _$AddOrderResponse];
  @override
  final String wireName = 'AddOrderResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, AddOrderResponse object,
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
          specifiedType: const FullType(AddOrderData)),
      'errors',
      serializers.serialize(object.errors,
          specifiedType:
              const FullType(BuiltList, const [const FullType(dynamic)])),
    ];

    return result;
  }

  @override
  AddOrderResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddOrderResponseBuilder();

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
              specifiedType: const FullType(AddOrderData))! as AddOrderData);
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

class _$AddOrderDataSerializer implements StructuredSerializer<AddOrderData> {
  @override
  final Iterable<Type> types = const [AddOrderData, _$AddOrderData];
  @override
  final String wireName = 'AddOrderData';

  @override
  Iterable<Object?> serialize(Serializers serializers, AddOrderData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.orderId;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.entity;
    if (value != null) {
      result
        ..add('entity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.amountPaid;
    if (value != null) {
      result
        ..add('amount_paid')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.amountDue;
    if (value != null) {
      result
        ..add('amount_due')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.currency;
    if (value != null) {
      result
        ..add('currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.receipt;
    if (value != null) {
      result
        ..add('receipt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.attempts;
    if (value != null) {
      result
        ..add('attempts')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  AddOrderData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddOrderDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.orderId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'entity':
          result.entity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'amount_paid':
          result.amountPaid = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'amount_due':
          result.amountDue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'currency':
          result.currency = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'receipt':
          result.receipt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'attempts':
          result.attempts = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$AddOrderResponse extends AddOrderResponse {
  @override
  final String message;
  @override
  final bool success;
  @override
  final AddOrderData data;
  @override
  final BuiltList<dynamic> errors;

  factory _$AddOrderResponse(
          [void Function(AddOrderResponseBuilder)? updates]) =>
      (new AddOrderResponseBuilder()..update(updates)).build();

  _$AddOrderResponse._(
      {required this.message,
      required this.success,
      required this.data,
      required this.errors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, 'AddOrderResponse', 'message');
    BuiltValueNullFieldError.checkNotNull(
        success, 'AddOrderResponse', 'success');
    BuiltValueNullFieldError.checkNotNull(data, 'AddOrderResponse', 'data');
    BuiltValueNullFieldError.checkNotNull(errors, 'AddOrderResponse', 'errors');
  }

  @override
  AddOrderResponse rebuild(void Function(AddOrderResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddOrderResponseBuilder toBuilder() =>
      new AddOrderResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddOrderResponse &&
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
    return (newBuiltValueToStringHelper('AddOrderResponse')
          ..add('message', message)
          ..add('success', success)
          ..add('data', data)
          ..add('errors', errors))
        .toString();
  }
}

class AddOrderResponseBuilder
    implements Builder<AddOrderResponse, AddOrderResponseBuilder> {
  _$AddOrderResponse? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  AddOrderDataBuilder? _data;
  AddOrderDataBuilder get data => _$this._data ??= new AddOrderDataBuilder();
  set data(AddOrderDataBuilder? data) => _$this._data = data;

  ListBuilder<dynamic>? _errors;
  ListBuilder<dynamic> get errors =>
      _$this._errors ??= new ListBuilder<dynamic>();
  set errors(ListBuilder<dynamic>? errors) => _$this._errors = errors;

  AddOrderResponseBuilder();

  AddOrderResponseBuilder get _$this {
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
  void replace(AddOrderResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddOrderResponse;
  }

  @override
  void update(void Function(AddOrderResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AddOrderResponse build() {
    _$AddOrderResponse _$result;
    try {
      _$result = _$v ??
          new _$AddOrderResponse._(
              message: BuiltValueNullFieldError.checkNotNull(
                  message, 'AddOrderResponse', 'message'),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, 'AddOrderResponse', 'success'),
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
            'AddOrderResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$AddOrderData extends AddOrderData {
  @override
  final String? orderId;
  @override
  final String? entity;
  @override
  final int? amount;
  @override
  final int? amountPaid;
  @override
  final int? amountDue;
  @override
  final String? currency;
  @override
  final String? receipt;
  @override
  final String? status;
  @override
  final int? attempts;

  factory _$AddOrderData([void Function(AddOrderDataBuilder)? updates]) =>
      (new AddOrderDataBuilder()..update(updates)).build();

  _$AddOrderData._(
      {this.orderId,
      this.entity,
      this.amount,
      this.amountPaid,
      this.amountDue,
      this.currency,
      this.receipt,
      this.status,
      this.attempts})
      : super._();

  @override
  AddOrderData rebuild(void Function(AddOrderDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddOrderDataBuilder toBuilder() => new AddOrderDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddOrderData &&
        orderId == other.orderId &&
        entity == other.entity &&
        amount == other.amount &&
        amountPaid == other.amountPaid &&
        amountDue == other.amountDue &&
        currency == other.currency &&
        receipt == other.receipt &&
        status == other.status &&
        attempts == other.attempts;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, orderId.hashCode), entity.hashCode),
                                amount.hashCode),
                            amountPaid.hashCode),
                        amountDue.hashCode),
                    currency.hashCode),
                receipt.hashCode),
            status.hashCode),
        attempts.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddOrderData')
          ..add('orderId', orderId)
          ..add('entity', entity)
          ..add('amount', amount)
          ..add('amountPaid', amountPaid)
          ..add('amountDue', amountDue)
          ..add('currency', currency)
          ..add('receipt', receipt)
          ..add('status', status)
          ..add('attempts', attempts))
        .toString();
  }
}

class AddOrderDataBuilder
    implements Builder<AddOrderData, AddOrderDataBuilder> {
  _$AddOrderData? _$v;

  String? _orderId;
  String? get orderId => _$this._orderId;
  set orderId(String? orderId) => _$this._orderId = orderId;

  String? _entity;
  String? get entity => _$this._entity;
  set entity(String? entity) => _$this._entity = entity;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  int? _amountPaid;
  int? get amountPaid => _$this._amountPaid;
  set amountPaid(int? amountPaid) => _$this._amountPaid = amountPaid;

  int? _amountDue;
  int? get amountDue => _$this._amountDue;
  set amountDue(int? amountDue) => _$this._amountDue = amountDue;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  String? _receipt;
  String? get receipt => _$this._receipt;
  set receipt(String? receipt) => _$this._receipt = receipt;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _attempts;
  int? get attempts => _$this._attempts;
  set attempts(int? attempts) => _$this._attempts = attempts;

  AddOrderDataBuilder();

  AddOrderDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderId = $v.orderId;
      _entity = $v.entity;
      _amount = $v.amount;
      _amountPaid = $v.amountPaid;
      _amountDue = $v.amountDue;
      _currency = $v.currency;
      _receipt = $v.receipt;
      _status = $v.status;
      _attempts = $v.attempts;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddOrderData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddOrderData;
  }

  @override
  void update(void Function(AddOrderDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AddOrderData build() {
    final _$result = _$v ??
        new _$AddOrderData._(
            orderId: orderId,
            entity: entity,
            amount: amount,
            amountPaid: amountPaid,
            amountDue: amountDue,
            currency: currency,
            receipt: receipt,
            status: status,
            attempts: attempts);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
