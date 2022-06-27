import 'package:boppo_stream/main/model/RefreshTokenResponse.dart';
import 'package:boppo_stream/screens/Details/model/NormalSuccessResponse.dart';
import 'package:boppo_stream/screens/Details/model/add_order.dart';
import 'package:boppo_stream/screens/Details/model/detail_movie_response.dart';
import 'package:boppo_stream/screens/FAQs/model/faq_response.dart';
import 'package:boppo_stream/screens/Home/HomePage/model/HomeResponse.dart';
import 'package:boppo_stream/screens/Login/model/LoginResponse.dart';
import 'package:boppo_stream/screens/WishList/model/wishlist_response.dart';
import 'package:boppo_stream/screens/OrderHistory/model/OrderResponse.dart';
import 'package:boppo_stream/screens/Profile/model/ProfileResponse.dart';
import 'package:boppo_stream/screens/Search/model/SearchMovieResponse.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';

part 'Serializers.g.dart';

@SerializersFor([
  LoginResponse,
  RefreshTokenResponse,
  NormalSuccessResponse,
  HomeResponse,
  SearchMovieResponse,
  OrderResponse,
  DetailMovieResponse,
  ProfileResponse,
  FAQResponse,
  WishlistResponse,
  AddOrderResponse
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
