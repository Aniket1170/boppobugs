import 'package:boppo_stream/Chopper/BuiltValueConverter.dart';
import 'package:boppo_stream/Chopper/HeaderInterceptor.dart';
import 'package:boppo_stream/screens/Profile/model/ProfileResponse.dart';
import 'package:boppo_stream/utils/base_config.dart';
import 'package:chopper/chopper.dart';

part 'ProfileApiService.chopper.dart';

@ChopperApi()
abstract class ProfileApiService extends ChopperService {
  @Get(path: 'getprofile')
  Future<Response<ProfileResponse>> getprofile();

  static ProfileApiService create() {
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: PROFILE_BASE_URL,

      services: [
        // The generated implementation
        _$ProfileApiService(),
      ],
      converter: BuiltValueConverter(),
      errorConverter: BuiltValueConverter(),
      interceptors: [
        HeaderInterceptor(),
        HttpLoggingInterceptor()
      ], //HeaderInterceptor()
    );

    // The generated class with the ChopperClient passed in
    return _$ProfileApiService(client);
  }
}
