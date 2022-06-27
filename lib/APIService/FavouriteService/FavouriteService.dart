import 'package:boppo_stream/Chopper/BuiltValueConverter.dart';
import 'package:boppo_stream/Chopper/HeaderInterceptor.dart';
import 'package:boppo_stream/screens/Details/model/NormalSuccessResponse.dart';
import 'package:boppo_stream/screens/WishList/model/wishlist_response.dart';
import 'package:boppo_stream/utils/base_config.dart';
import 'package:chopper/chopper.dart';

part 'FavouriteService.chopper.dart';

@ChopperApi()
abstract class FavouriteService extends ChopperService {
  @Post(path: 'addtofavourite')
  Future<Response<NormalSuccessResponse>> addToFavourite(
    @Body() List<Map<String, dynamic>> body,
  );

  @Post(path: 'removefromfavourite')
  Future<Response<NormalSuccessResponse>> removeFromFavourite(
    @Body() List<Map<String, dynamic>> body,
  );

  @Get(path: 'getfavourite')
  Future<Response<WishlistResponse>> getfavourite();

  static FavouriteService create() {
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: FAV_BASE_URL,

      services: [
        // The generated implementation
        _$FavouriteService(),
      ],
      converter: BuiltValueConverter(),
      errorConverter: BuiltValueConverter(),
      interceptors: [
        HeaderInterceptor(),
        HttpLoggingInterceptor()
      ], //HeaderInterceptor()
    );

    // The generated class with the ChopperClient passed in
    return _$FavouriteService(client);
  }
}
