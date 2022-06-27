import 'package:bloc/bloc.dart';
import 'package:boppo_stream/APIService/FavouriteService/FavouriteService.dart';
import 'package:boppo_stream/Chopper/ApiErrorMessage.dart';
import 'package:boppo_stream/screens/Details/model/NormalSuccessResponse.dart';
import 'package:boppo_stream/screens/WishList/model/wishlist_response.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'mywishlist_event.dart';
part 'mywishlist_state.dart';

class MywishlistBloc extends Bloc<MywishlistEvent, MywishlistState> {
  ApiErrorMessage _apiErrorMessage = ApiErrorMessage();

  MywishlistBloc() : super(MywishlistInitial()) {
    on<GetWishlist>(_getProductList);
    on<RemoveFromWatchLater>(_removeFromWatchLater);
  }

  void _getProductList(GetWishlist event, Emitter<MywishlistState> emit) async {
    try {
      emit(MywishlistLoading());

      final Response<WishlistResponse> _getFavResponse =
          await FavouriteService.create().getfavourite();
      if (_getFavResponse.isSuccessful) {
        // successful request
        final body = _getFavResponse.body;
        debugPrint("getFavourite log $body");
        if (body != null) {
          final _data = body.data;
          emit(MywishlistSuccess(wishList: _data.toList()));
        } else
          emit(MywishlistError(error: EXCEPTIONAL_MESSAGE));
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_getFavResponse);
        emit(MywishlistError(error: message));
      }
    } catch (e) {
      emit(MywishlistError(error: EXCEPTIONAL_MESSAGE));
    }
  }

  void _removeFromWatchLater(
      RemoveFromWatchLater event, Emitter<MywishlistState> emit) async {
    try {
      emit(MywishlistLoading());

      Map<String, dynamic> body = {
        "content_type_id": event.contentTypeId,
        "content_id": event.contentId
      };

      final Response<NormalSuccessResponse> _homeResponse =
          await FavouriteService.create().removeFromFavourite([body]);
      if (_homeResponse.isSuccessful) {
        // successful request
        final body = _homeResponse.body;
        debugPrint("home log $body");
        if (body != null) {
          // final _data = body.data;
          emit(DetailAddFavSuccess());
        } else
          emit(MywishlistError(error: EXCEPTIONAL_MESSAGE));
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_homeResponse);
        emit(MywishlistError(error: message));
      }
    } catch (e) {
      emit(MywishlistError(error: EXCEPTIONAL_MESSAGE));
    }
  }
}
