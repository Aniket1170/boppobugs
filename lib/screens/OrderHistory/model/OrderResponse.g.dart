// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderResponse> _$orderResponseSerializer =
    new _$OrderResponseSerializer();
Serializer<OrderData> _$orderDataSerializer = new _$OrderDataSerializer();
Serializer<MovieData> _$movieDataSerializer = new _$MovieDataSerializer();
Serializer<CastsData> _$castsDataSerializer = new _$CastsDataSerializer();

class _$OrderResponseSerializer implements StructuredSerializer<OrderResponse> {
  @override
  final Iterable<Type> types = const [OrderResponse, _$OrderResponse];
  @override
  final String wireName = 'OrderResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, OrderResponse object,
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
              const FullType(BuiltList, const [const FullType(OrderData)])),
      'errors',
      serializers.serialize(object.errors,
          specifiedType:
              const FullType(BuiltList, const [const FullType(dynamic)])),
    ];

    return result;
  }

  @override
  OrderResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderResponseBuilder();

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
                      BuiltList, const [const FullType(OrderData)]))!
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

class _$OrderDataSerializer implements StructuredSerializer<OrderData> {
  @override
  final Iterable<Type> types = const [OrderData, _$OrderData];
  @override
  final String wireName = 'OrderData';

  @override
  Iterable<Object?> serialize(Serializers serializers, OrderData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.movies;
    if (value != null) {
      result
        ..add('movies')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(MovieData)])));
    }
    value = object.Season;
    if (value != null) {
      result
        ..add('Season')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(MovieData)])));
    }
    return result;
  }

  @override
  OrderData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'movies':
          result.movies.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MovieData)]))!
              as BuiltList<Object?>);
          break;
        case 'Season':
          result.Season.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MovieData)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$MovieDataSerializer implements StructuredSerializer<MovieData> {
  @override
  final Iterable<Type> types = const [MovieData, _$MovieData];
  @override
  final String wireName = 'MovieData';

  @override
  Iterable<Object?> serialize(Serializers serializers, MovieData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.movieName;
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
    value = object.thumbnail;
    if (value != null) {
      result
        ..add('thumbnail')
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
    value = object.orderNo;
    if (value != null) {
      result
        ..add('order_no')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.userId;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.paymentType;
    if (value != null) {
      result
        ..add('payment_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.amountType;
    if (value != null) {
      result
        ..add('amount_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taxAmount;
    if (value != null) {
      result
        ..add('tax_amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.totalAmount;
    if (value != null) {
      result
        ..add('total_amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.notificationId;
    if (value != null) {
      result
        ..add('notification_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.vendorId;
    if (value != null) {
      result
        ..add('vendor_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.orderId;
    if (value != null) {
      result
        ..add('order_id')
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
    value = object.skuId;
    if (value != null) {
      result
        ..add('sku_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.discount;
    if (value != null) {
      result
        ..add('discount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.transactionStatus;
    if (value != null) {
      result
        ..add('transaction_status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.collectedAmt;
    if (value != null) {
      result
        ..add('collected_amt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('image_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.castList;
    if (value != null) {
      result
        ..add('castList')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(CastsData)])));
    }
    return result;
  }

  @override
  MovieData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieDataBuilder();

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
          result.movieName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'movie_file':
          result.movieFile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'order_no':
          result.orderNo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'payment_type':
          result.paymentType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'amount_type':
          result.amountType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tax_amount':
          result.taxAmount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'total_amount':
          result.totalAmount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'notification_id':
          result.notificationId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'vendor_id':
          result.vendorId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'order_id':
          result.orderId = serializers.deserialize(value,
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
        case 'sku_id':
          result.skuId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'discount':
          result.discount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'transaction_status':
          result.transactionStatus = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'collected_amt':
          result.collectedAmt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image_url':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'castList':
          result.castList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CastsData)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$CastsDataSerializer implements StructuredSerializer<CastsData> {
  @override
  final Iterable<Type> types = const [CastsData, _$CastsData];
  @override
  final String wireName = 'CastsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, CastsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.movieCastType;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.movieId;
    if (value != null) {
      result
        ..add('movie_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.movieCastName;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CastsData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CastsDataBuilder();

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
          result.movieCastType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'movie_id':
          result.movieId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.movieCastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$OrderResponse extends OrderResponse {
  @override
  final String message;
  @override
  final bool success;
  @override
  final BuiltList<OrderData> data;
  @override
  final BuiltList<dynamic> errors;

  factory _$OrderResponse([void Function(OrderResponseBuilder)? updates]) =>
      (new OrderResponseBuilder()..update(updates)).build();

  _$OrderResponse._(
      {required this.message,
      required this.success,
      required this.data,
      required this.errors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(message, 'OrderResponse', 'message');
    BuiltValueNullFieldError.checkNotNull(success, 'OrderResponse', 'success');
    BuiltValueNullFieldError.checkNotNull(data, 'OrderResponse', 'data');
    BuiltValueNullFieldError.checkNotNull(errors, 'OrderResponse', 'errors');
  }

  @override
  OrderResponse rebuild(void Function(OrderResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderResponseBuilder toBuilder() => new OrderResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderResponse &&
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
    return (newBuiltValueToStringHelper('OrderResponse')
          ..add('message', message)
          ..add('success', success)
          ..add('data', data)
          ..add('errors', errors))
        .toString();
  }
}

class OrderResponseBuilder
    implements Builder<OrderResponse, OrderResponseBuilder> {
  _$OrderResponse? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<OrderData>? _data;
  ListBuilder<OrderData> get data =>
      _$this._data ??= new ListBuilder<OrderData>();
  set data(ListBuilder<OrderData>? data) => _$this._data = data;

  ListBuilder<dynamic>? _errors;
  ListBuilder<dynamic> get errors =>
      _$this._errors ??= new ListBuilder<dynamic>();
  set errors(ListBuilder<dynamic>? errors) => _$this._errors = errors;

  OrderResponseBuilder();

  OrderResponseBuilder get _$this {
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
  void replace(OrderResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderResponse;
  }

  @override
  void update(void Function(OrderResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrderResponse build() {
    _$OrderResponse _$result;
    try {
      _$result = _$v ??
          new _$OrderResponse._(
              message: BuiltValueNullFieldError.checkNotNull(
                  message, 'OrderResponse', 'message'),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, 'OrderResponse', 'success'),
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
            'OrderResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OrderData extends OrderData {
  @override
  final BuiltList<MovieData>? movies;
  @override
  final BuiltList<MovieData>? Season;

  factory _$OrderData([void Function(OrderDataBuilder)? updates]) =>
      (new OrderDataBuilder()..update(updates)).build();

  _$OrderData._({this.movies, this.Season}) : super._();

  @override
  OrderData rebuild(void Function(OrderDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderDataBuilder toBuilder() => new OrderDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderData &&
        movies == other.movies &&
        Season == other.Season;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, movies.hashCode), Season.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrderData')
          ..add('movies', movies)
          ..add('Season', Season))
        .toString();
  }
}

class OrderDataBuilder implements Builder<OrderData, OrderDataBuilder> {
  _$OrderData? _$v;

  ListBuilder<MovieData>? _movies;
  ListBuilder<MovieData> get movies =>
      _$this._movies ??= new ListBuilder<MovieData>();
  set movies(ListBuilder<MovieData>? movies) => _$this._movies = movies;

  ListBuilder<MovieData>? _Season;
  ListBuilder<MovieData> get Season =>
      _$this._Season ??= new ListBuilder<MovieData>();
  set Season(ListBuilder<MovieData>? Season) => _$this._Season = Season;

  OrderDataBuilder();

  OrderDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _movies = $v.movies?.toBuilder();
      _Season = $v.Season?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderData;
  }

  @override
  void update(void Function(OrderDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrderData build() {
    _$OrderData _$result;
    try {
      _$result = _$v ??
          new _$OrderData._(movies: _movies?.build(), Season: _Season?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'movies';
        _movies?.build();
        _$failedField = 'Season';
        _Season?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'OrderData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MovieData extends MovieData {
  @override
  final int? id;
  @override
  final String? movieName;
  @override
  final String? description;
  @override
  final String? thumbnail;
  @override
  final String? movieFile;
  @override
  final String? orderNo;
  @override
  final int? status;
  @override
  final int? userId;
  @override
  final String? paymentType;
  @override
  final String? amountType;
  @override
  final String? amount;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? taxAmount;
  @override
  final String? totalAmount;
  @override
  final int? notificationId;
  @override
  final int? vendorId;
  @override
  final int? orderId;
  @override
  final int? contentTypeId;
  @override
  final int? contentId;
  @override
  final String? skuId;
  @override
  final String? discount;
  @override
  final int? transactionStatus;
  @override
  final String? collectedAmt;
  @override
  final String? imageUrl;
  @override
  final BuiltList<CastsData>? castList;

  factory _$MovieData([void Function(MovieDataBuilder)? updates]) =>
      (new MovieDataBuilder()..update(updates)).build();

  _$MovieData._(
      {this.id,
      this.movieName,
      this.description,
      this.thumbnail,
      this.movieFile,
      this.orderNo,
      this.status,
      this.userId,
      this.paymentType,
      this.amountType,
      this.amount,
      this.createdAt,
      this.updatedAt,
      this.taxAmount,
      this.totalAmount,
      this.notificationId,
      this.vendorId,
      this.orderId,
      this.contentTypeId,
      this.contentId,
      this.skuId,
      this.discount,
      this.transactionStatus,
      this.collectedAmt,
      this.imageUrl,
      this.castList})
      : super._();

  @override
  MovieData rebuild(void Function(MovieDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieDataBuilder toBuilder() => new MovieDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieData &&
        id == other.id &&
        movieName == other.movieName &&
        description == other.description &&
        thumbnail == other.thumbnail &&
        movieFile == other.movieFile &&
        orderNo == other.orderNo &&
        status == other.status &&
        userId == other.userId &&
        paymentType == other.paymentType &&
        amountType == other.amountType &&
        amount == other.amount &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        taxAmount == other.taxAmount &&
        totalAmount == other.totalAmount &&
        notificationId == other.notificationId &&
        vendorId == other.vendorId &&
        orderId == other.orderId &&
        contentTypeId == other.contentTypeId &&
        contentId == other.contentId &&
        skuId == other.skuId &&
        discount == other.discount &&
        transactionStatus == other.transactionStatus &&
        collectedAmt == other.collectedAmt &&
        imageUrl == other.imageUrl &&
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
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc(0, id.hashCode), movieName.hashCode), description.hashCode), thumbnail.hashCode), movieFile.hashCode), orderNo.hashCode), status.hashCode),
                                                                                userId.hashCode),
                                                                            paymentType.hashCode),
                                                                        amountType.hashCode),
                                                                    amount.hashCode),
                                                                createdAt.hashCode),
                                                            updatedAt.hashCode),
                                                        taxAmount.hashCode),
                                                    totalAmount.hashCode),
                                                notificationId.hashCode),
                                            vendorId.hashCode),
                                        orderId.hashCode),
                                    contentTypeId.hashCode),
                                contentId.hashCode),
                            skuId.hashCode),
                        discount.hashCode),
                    transactionStatus.hashCode),
                collectedAmt.hashCode),
            imageUrl.hashCode),
        castList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieData')
          ..add('id', id)
          ..add('movieName', movieName)
          ..add('description', description)
          ..add('thumbnail', thumbnail)
          ..add('movieFile', movieFile)
          ..add('orderNo', orderNo)
          ..add('status', status)
          ..add('userId', userId)
          ..add('paymentType', paymentType)
          ..add('amountType', amountType)
          ..add('amount', amount)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('taxAmount', taxAmount)
          ..add('totalAmount', totalAmount)
          ..add('notificationId', notificationId)
          ..add('vendorId', vendorId)
          ..add('orderId', orderId)
          ..add('contentTypeId', contentTypeId)
          ..add('contentId', contentId)
          ..add('skuId', skuId)
          ..add('discount', discount)
          ..add('transactionStatus', transactionStatus)
          ..add('collectedAmt', collectedAmt)
          ..add('imageUrl', imageUrl)
          ..add('castList', castList))
        .toString();
  }
}

class MovieDataBuilder implements Builder<MovieData, MovieDataBuilder> {
  _$MovieData? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _movieName;
  String? get movieName => _$this._movieName;
  set movieName(String? movieName) => _$this._movieName = movieName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _thumbnail;
  String? get thumbnail => _$this._thumbnail;
  set thumbnail(String? thumbnail) => _$this._thumbnail = thumbnail;

  String? _movieFile;
  String? get movieFile => _$this._movieFile;
  set movieFile(String? movieFile) => _$this._movieFile = movieFile;

  String? _orderNo;
  String? get orderNo => _$this._orderNo;
  set orderNo(String? orderNo) => _$this._orderNo = orderNo;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _paymentType;
  String? get paymentType => _$this._paymentType;
  set paymentType(String? paymentType) => _$this._paymentType = paymentType;

  String? _amountType;
  String? get amountType => _$this._amountType;
  set amountType(String? amountType) => _$this._amountType = amountType;

  String? _amount;
  String? get amount => _$this._amount;
  set amount(String? amount) => _$this._amount = amount;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  String? _taxAmount;
  String? get taxAmount => _$this._taxAmount;
  set taxAmount(String? taxAmount) => _$this._taxAmount = taxAmount;

  String? _totalAmount;
  String? get totalAmount => _$this._totalAmount;
  set totalAmount(String? totalAmount) => _$this._totalAmount = totalAmount;

  int? _notificationId;
  int? get notificationId => _$this._notificationId;
  set notificationId(int? notificationId) =>
      _$this._notificationId = notificationId;

  int? _vendorId;
  int? get vendorId => _$this._vendorId;
  set vendorId(int? vendorId) => _$this._vendorId = vendorId;

  int? _orderId;
  int? get orderId => _$this._orderId;
  set orderId(int? orderId) => _$this._orderId = orderId;

  int? _contentTypeId;
  int? get contentTypeId => _$this._contentTypeId;
  set contentTypeId(int? contentTypeId) =>
      _$this._contentTypeId = contentTypeId;

  int? _contentId;
  int? get contentId => _$this._contentId;
  set contentId(int? contentId) => _$this._contentId = contentId;

  String? _skuId;
  String? get skuId => _$this._skuId;
  set skuId(String? skuId) => _$this._skuId = skuId;

  String? _discount;
  String? get discount => _$this._discount;
  set discount(String? discount) => _$this._discount = discount;

  int? _transactionStatus;
  int? get transactionStatus => _$this._transactionStatus;
  set transactionStatus(int? transactionStatus) =>
      _$this._transactionStatus = transactionStatus;

  String? _collectedAmt;
  String? get collectedAmt => _$this._collectedAmt;
  set collectedAmt(String? collectedAmt) => _$this._collectedAmt = collectedAmt;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  ListBuilder<CastsData>? _castList;
  ListBuilder<CastsData> get castList =>
      _$this._castList ??= new ListBuilder<CastsData>();
  set castList(ListBuilder<CastsData>? castList) => _$this._castList = castList;

  MovieDataBuilder();

  MovieDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _movieName = $v.movieName;
      _description = $v.description;
      _thumbnail = $v.thumbnail;
      _movieFile = $v.movieFile;
      _orderNo = $v.orderNo;
      _status = $v.status;
      _userId = $v.userId;
      _paymentType = $v.paymentType;
      _amountType = $v.amountType;
      _amount = $v.amount;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _taxAmount = $v.taxAmount;
      _totalAmount = $v.totalAmount;
      _notificationId = $v.notificationId;
      _vendorId = $v.vendorId;
      _orderId = $v.orderId;
      _contentTypeId = $v.contentTypeId;
      _contentId = $v.contentId;
      _skuId = $v.skuId;
      _discount = $v.discount;
      _transactionStatus = $v.transactionStatus;
      _collectedAmt = $v.collectedAmt;
      _imageUrl = $v.imageUrl;
      _castList = $v.castList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovieData;
  }

  @override
  void update(void Function(MovieDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieData build() {
    _$MovieData _$result;
    try {
      _$result = _$v ??
          new _$MovieData._(
              id: id,
              movieName: movieName,
              description: description,
              thumbnail: thumbnail,
              movieFile: movieFile,
              orderNo: orderNo,
              status: status,
              userId: userId,
              paymentType: paymentType,
              amountType: amountType,
              amount: amount,
              createdAt: createdAt,
              updatedAt: updatedAt,
              taxAmount: taxAmount,
              totalAmount: totalAmount,
              notificationId: notificationId,
              vendorId: vendorId,
              orderId: orderId,
              contentTypeId: contentTypeId,
              contentId: contentId,
              skuId: skuId,
              discount: discount,
              transactionStatus: transactionStatus,
              collectedAmt: collectedAmt,
              imageUrl: imageUrl,
              castList: _castList?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'castList';
        _castList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MovieData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CastsData extends CastsData {
  @override
  final int? id;
  @override
  final String? movieCastType;
  @override
  final int? movieId;
  @override
  final String? movieCastName;

  factory _$CastsData([void Function(CastsDataBuilder)? updates]) =>
      (new CastsDataBuilder()..update(updates)).build();

  _$CastsData._({this.id, this.movieCastType, this.movieId, this.movieCastName})
      : super._();

  @override
  CastsData rebuild(void Function(CastsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CastsDataBuilder toBuilder() => new CastsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CastsData &&
        id == other.id &&
        movieCastType == other.movieCastType &&
        movieId == other.movieId &&
        movieCastName == other.movieCastName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), movieCastType.hashCode), movieId.hashCode),
        movieCastName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CastsData')
          ..add('id', id)
          ..add('movieCastType', movieCastType)
          ..add('movieId', movieId)
          ..add('movieCastName', movieCastName))
        .toString();
  }
}

class CastsDataBuilder implements Builder<CastsData, CastsDataBuilder> {
  _$CastsData? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _movieCastType;
  String? get movieCastType => _$this._movieCastType;
  set movieCastType(String? movieCastType) =>
      _$this._movieCastType = movieCastType;

  int? _movieId;
  int? get movieId => _$this._movieId;
  set movieId(int? movieId) => _$this._movieId = movieId;

  String? _movieCastName;
  String? get movieCastName => _$this._movieCastName;
  set movieCastName(String? movieCastName) =>
      _$this._movieCastName = movieCastName;

  CastsDataBuilder();

  CastsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _movieCastType = $v.movieCastType;
      _movieId = $v.movieId;
      _movieCastName = $v.movieCastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CastsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CastsData;
  }

  @override
  void update(void Function(CastsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CastsData build() {
    final _$result = _$v ??
        new _$CastsData._(
            id: id,
            movieCastType: movieCastType,
            movieId: movieId,
            movieCastName: movieCastName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
