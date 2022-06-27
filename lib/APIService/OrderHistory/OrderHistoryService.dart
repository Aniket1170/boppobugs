import 'package:boppo_stream/Chopper/BuiltValueConverter.dart';
import 'package:boppo_stream/Chopper/HeaderInterceptor.dart';
import 'package:boppo_stream/screens/Details/model/add_order.dart';
import 'package:boppo_stream/screens/OrderHistory/model/OrderResponse.dart';
import 'package:boppo_stream/utils/base_config.dart';
import 'package:chopper/chopper.dart';

part 'OrderHistoryService.chopper.dart';

@ChopperApi()
abstract class OrderHistoryService extends ChopperService {
  @Get(path: 'producthistory')
  Future<Response<OrderResponse>> productHistory();

  @Post(path: 'addorder')
  Future<Response<AddOrderResponse>> addorder(
    @Body() Map<String, dynamic> body,
  );

  @Get(path: 'paymentverify')
  Future<Response<OrderResponse>> paymentverify();

  static OrderHistoryService create() {
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: ORDER_BASE_URL,

      services: [
        // The generated implementation
        _$OrderHistoryService(),
      ],
      converter: BuiltValueConverter(),
      errorConverter: BuiltValueConverter(),
      interceptors: [HeaderInterceptor(), HttpLoggingInterceptor()],
    );

    // The generated class with the ChopperClient passed in
    return _$OrderHistoryService(client);
  }
}
