import 'package:boppo_stream/Chopper/Serializers.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:chopper/chopper.dart';
import 'package:built_collection/built_collection.dart';

class BuiltValueConverter extends JsonConverter
    implements Converter, ErrorConverter {
  final Type? errorType;

  BuiltValueConverter({this.errorType});

  final jsonSerializers =
      (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

  T? _deserializer<T>(dynamic value) => jsonSerializers.deserializeWith(
        jsonSerializers.serializerForType(T) as Serializer<T>,
        value,
      );

  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    final jsonResponse = super.convertResponse(response);
    print(response);

    final body = _decode<Item>(jsonResponse.body);

    return jsonResponse.copyWith<ResultType>(body: body);
  }

  dynamic _decode<T>(entity) {
    // debugPrint(entity); // debug print causes problem with chopper
    print(entity);

    /// handle case when we want to access to Map<String, dynamic> directly
    /// getResource or getMapResource
    /// Avoid dynamic or unconverted value, this could lead to several issues
    if (entity is T) return entity;

    try {
      if (entity is List) return _deserializeListOf<T>(entity);
      return _deserializer<T>(entity);
    } catch (e) {
      print(e);
      return null;
    }
  }

  BuiltList<T> _deserializeListOf<T>(Iterable value) => BuiltList(
        value.map((value) => _deserializer<T>(value)).toList(growable: true),
      );

  @override
  Response convertError<BodyType, InnerType>(Response response) {
    print(response.body);
    final jsonResponse = super.convertResponse(response);

    final body = _decode(jsonResponse.body);

    return jsonResponse.copyWith(body: body);
  }
}
