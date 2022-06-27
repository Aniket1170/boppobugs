// import 'package:boppo_stream/Chopper/BuiltValueConverter.dart';
// import 'package:boppo_stream/Chopper/HeaderInterceptor.dart';
// import 'package:boppo_stream/screens/Home/HomePage/model/HomeResponse.dart';
// import 'package:boppo_stream/utils/base_config.dart';
// import 'package:chopper/chopper.dart';

// part 'ApiService.chopper.dart';

// @ChopperApi()
// abstract class ApiService extends ChopperService {
//   @Get(path: 'home/gethomedata')
//   Future<Response<HomeResponse>> getHomeData();

//   @Post(path: 'product/getproductlist')
//   Future<Response<HomeResponse>> getProductList(
//     @Body() Map<String, dynamic> body,
//   );

//   @Get(path: 'order/producthistory')
//   Future<Response<HomeResponse>> productHistory();

//   @Post(path: 'product/srbynameprod')
//   Future<Response<HomeResponse>> searchMovie(
//     @Body() Map<String, dynamic> body,
//   );

//   static ApiService create() {
//     final client = ChopperClient(
//       // The first part of the URL is now here
//       baseUrl: BASE_URL,

//       services: [
//         // The generated implementation
//         _$ApiService(),
//       ],
//       converter: BuiltValueConverter(),
//       errorConverter: BuiltValueConverter(),
//       interceptors: [
//         HeaderInterceptor(),
//         HttpLoggingInterceptor()
//       ], //HeaderInterceptor()
//     );

//     // The generated class with the ChopperClient passed in
//     return _$ApiService(client);
//   }
// }
