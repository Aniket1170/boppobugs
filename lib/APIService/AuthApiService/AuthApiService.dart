import 'package:boppo_stream/Chopper/BuiltValueConverter.dart';
import 'package:boppo_stream/Chopper/HeaderInterceptor.dart';
import 'package:boppo_stream/main/model/RefreshTokenResponse.dart';
import 'package:boppo_stream/screens/Login/model/LoginResponse.dart';
import 'package:boppo_stream/utils/base_config.dart';
import 'package:chopper/chopper.dart';

part 'AuthApiService.chopper.dart';

@ChopperApi()
abstract class AuthApiService extends ChopperService {
  @Post(path: 'login')
  Future<Response<LoginResponse>> login(
    @Body() Map<String, dynamic> body,
  );

  @Post(path: 'verifyotp')
  Future<Response<LoginResponse>> verifyOtp(
    @Body() Map<String, dynamic> body,
  );

  @Post(path: 'resendotp')
  Future<Response<LoginResponse>> resendOtp(
    @Body() Map<String, dynamic> body,
  );

  @Post(path: 'refreshtoken')
  Future<Response<RefreshTokenResponse>> refreshToken(
    @Body() Map<String, dynamic> body,
  );

  @Post(path: 'upbasicdetail')
  Future<Response<RefreshTokenResponse>> upbasicdetail(
    @Body() Map<String, dynamic> body,
  );

  static AuthApiService create() {
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: AUTH_BASE_URL,

      services: [
        // The generated implementation
        _$AuthApiService(),
      ],
      converter: BuiltValueConverter(),
      errorConverter: BuiltValueConverter(),
      interceptors: [
        HeaderInterceptor(),
        HttpLoggingInterceptor()
      ], //HeaderInterceptor()
    );

    // The generated class with the ChopperClient passed in
    return _$AuthApiService(client);
  }
}
