import 'package:boppo_stream/Chopper/BuiltValueConverter.dart';
import 'package:boppo_stream/Chopper/HeaderInterceptor.dart';
import 'package:boppo_stream/screens/FAQs/model/faq_response.dart';
import 'package:boppo_stream/utils/base_config.dart';
import 'package:chopper/chopper.dart';

part 'FAQService.chopper.dart';

@ChopperApi()
abstract class FAQService extends ChopperService {
  @Get(path: 'getFaq')
  Future<Response<FAQResponse>> getFaq();

  static FAQService create() {
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: FAQ_BASE_URL,

      services: [
        // The generated implementation
        _$FAQService(),
      ],
      converter: BuiltValueConverter(),
      errorConverter: BuiltValueConverter(),
      interceptors: [
        HeaderInterceptor(),
        HttpLoggingInterceptor()
      ], //HeaderInterceptor()
    );

    // The generated class with the ChopperClient passed in
    return _$FAQService(client);
  }
}
