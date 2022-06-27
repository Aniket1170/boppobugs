import 'package:boppo_stream/Chopper/BuiltValueConverter.dart';
import 'package:boppo_stream/Chopper/HeaderInterceptor.dart';
import 'package:boppo_stream/screens/Details/model/detail_movie_response.dart';
import 'package:boppo_stream/screens/Search/model/SearchMovieResponse.dart';
import 'package:boppo_stream/utils/base_config.dart';
import 'package:chopper/chopper.dart';

part 'ProductApiService.chopper.dart';

@ChopperApi()
abstract class ProductApiService extends ChopperService {
  @Post(path: 'srbynameprod')
  Future<Response<SearchMovieResponse>> searchMovie(
    @Body() Map<String, dynamic> body,
  );

  @Post(path: 'prodbyid')
  Future<Response<DetailMovieResponse>> prodbyid(
    @Body() Map<String, dynamic> body,
  );

  @Post(path: 'seasonFlow')
  Future<Response<DetailMovieResponse>> seasonFlow(
    @Body() Map<String, dynamic> body,
  );

  static ProductApiService create() {
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: PRODUCT_BASE_URL,

      services: [
        // The generated implementation
        _$ProductApiService(),
      ],
      converter: BuiltValueConverter(),
      errorConverter: BuiltValueConverter(),
      interceptors: [
        HeaderInterceptor(),
        HttpLoggingInterceptor()
      ], //HeaderInterceptor()
    );

    // The generated class with the ChopperClient passed in
    return _$ProductApiService(client);
  }
}
