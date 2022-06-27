import 'package:boppo_stream/Chopper/BuiltValueConverter.dart';
import 'package:boppo_stream/Chopper/HeaderInterceptor.dart';
import 'package:boppo_stream/screens/Details/model/NormalSuccessResponse.dart';
import 'package:boppo_stream/utils/base_config.dart';
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;

part 'ContactUserService.chopper.dart';

@ChopperApi()
abstract class ContactUserService extends ChopperService {
  // @Post(path: 'details')
  // Future<Response<NormalSuccessResponse>> details(
  //   @Body() Map<String, dynamic> body,
  // );

  @Post(
      path: 'details',
      headers: {"Content-Type": "application/x-www-form-urlencoded"})
  @multipart
  Future<Response<NormalSuccessResponse>> details(
      @Part("about") String about,
      @Part("user_id") String userId,
      @PartFile("file") http.MultipartFile file);

  static ContactUserService create() {
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: CONTACT_BASE_URL,

      services: [
        // The generated implementation
        _$ContactUserService(),
      ],
      converter: BuiltValueConverter(),
      errorConverter: BuiltValueConverter(),
      interceptors: [
        HeaderInterceptor(),
        HttpLoggingInterceptor()
      ], //HeaderInterceptor()
    );

    // The generated class with the ChopperClient passed in
    return _$ContactUserService(client);
  }
}
