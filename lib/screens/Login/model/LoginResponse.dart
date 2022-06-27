import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
part 'LoginResponse.g.dart';

abstract class LoginResponse
    implements Built<LoginResponse, LoginResponseBuilder> {
  // @nullable
  @BuiltValueField(wireName: 'message')
  String get message;

  // @nullable
  @BuiltValueField(wireName: 'success')
  bool get success;

  // @nullable
  @BuiltValue(wireName: 'data')
  BuiltList<LoginData> get data;

  // @nullable
  @BuiltValueField(wireName: 'errors')
  BuiltList<dynamic> get errors;

  LoginResponse._();

  factory LoginResponse([updates(LoginResponseBuilder b)]) = _$LoginResponse;

  static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;
}

abstract class LoginData implements Built<LoginData, LoginDataBuilder> {
  // @nullable
  @BuiltValueField(wireName: 'access_token')
  String? get accessToken;

  // @nullable
  @BuiltValueField(wireName: 'refresh_Token')
  String? get refreshToken;

  @BuiltValue(wireName: 'data')
  BuiltList<UserData>? get data;

  LoginData._();

  factory LoginData([updates(LoginDataBuilder b)]) = _$LoginData;

  static Serializer<LoginData> get serializer => _$loginDataSerializer;
}

abstract class UserData implements Built<UserData, UserDataBuilder> {
  @BuiltValueField(wireName: 'user_id')
  int? get userId;

  @BuiltValueField(wireName: 'user_name')
  String? get userName;

  @BuiltValueField(wireName: 'user_age')
  int? get userAge;

  @BuiltValueField(wireName: 'user_dob')
  String? get dob;

  @BuiltValueField(wireName: 'gender')
  int? get gender;

  UserData._();

  factory UserData([updates(UserDataBuilder b)]) = _$UserData;

  static Serializer<UserData> get serializer => _$userDataSerializer;
}
