import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
part 'ProfileResponse.g.dart';

abstract class ProfileResponse
    implements Built<ProfileResponse, ProfileResponseBuilder> {
  // @nullable
  @BuiltValueField(wireName: 'message')
  String? get message;

  // @nullable
  @BuiltValueField(wireName: 'success')
  bool? get success;

  // @nullable
  @BuiltValue(wireName: 'data')
  BuiltList<ProfileData>? get data;

  // @nullable
  @BuiltValueField(wireName: 'errors')
  BuiltList<dynamic>? get errors;

  ProfileResponse._();

  factory ProfileResponse([updates(ProfileResponseBuilder b)]) =
      _$ProfileResponse;

  static Serializer<ProfileResponse> get serializer =>
      _$profileResponseSerializer;
}

abstract class ProfileData implements Built<ProfileData, ProfileDataBuilder> {
  // @nullable
  @BuiltValueField(wireName: 'id')
  int? get id;

  // @nullable
  @BuiltValueField(wireName: 'name')
  String? get name;

  // @nullable
  @BuiltValueField(wireName: 'country_code')
  String? get countryCode;

  // @nullable
  @BuiltValueField(wireName: 'mobile_no')
  int? get mobileNo;

  // @nullable
  @BuiltValueField(wireName: 'age')
  int? get age;

  // @nullable
  @BuiltValueField(wireName: 'gender')
  int? get gender;

  // @nullable
  @BuiltValueField(wireName: 'mobile_verified')
  bool? get isMobileVerified;

  // @nullable
  @BuiltValueField(wireName: 'is_active')
  bool? get isActive;

  ProfileData._();

  factory ProfileData([updates(ProfileDataBuilder b)]) = _$ProfileData;

  static Serializer<ProfileData> get serializer => _$profileDataSerializer;
}
