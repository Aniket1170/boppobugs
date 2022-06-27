import 'package:boppo_stream/Chopper/BuiltValueConverter.dart';
import 'package:boppo_stream/Chopper/HeaderInterceptor.dart';
import 'package:boppo_stream/screens/Home/HomePage/model/HomeResponse.dart';
import 'package:boppo_stream/utils/base_config.dart';
import 'package:chopper/chopper.dart';

part 'HomeApiService.chopper.dart';

@ChopperApi()
abstract class HomeApiService extends ChopperService {
  @Get(path: 'gethomedata')
  Future<Response<HomeResponse>> getHomeData();

  @Get(path: 'order/producthistory')
  Future<Response<HomeResponse>> productHistory();

  @Post(path: 'product/srbynameprod')
  Future<Response<HomeResponse>> searchMovie(
    @Body() Map<String, dynamic> body,
  );

  static HomeApiService create() {
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: HOME_BASE_URL,

      services: [
        // The generated implementation
        _$HomeApiService(),
      ],
      converter: BuiltValueConverter(),
      errorConverter: BuiltValueConverter(),
      interceptors: [
        HeaderInterceptor(),
        HttpLoggingInterceptor()
      ], //HeaderInterceptor()
    );

    // The generated class with the ChopperClient passed in
    return _$HomeApiService(client);
  }
}
