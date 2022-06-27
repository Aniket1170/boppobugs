import 'package:boppo_stream/APIService/FavouriteService/FavouriteService.dart';
import 'package:boppo_stream/APIService/OrderHistory/OrderHistoryService.dart';
import 'package:boppo_stream/APIService/ProductApiService/ProductApiService.dart';
import 'package:boppo_stream/Chopper/ApiErrorMessage.dart';
import 'package:boppo_stream/screens/Details/model/ContentList.dart';
import 'package:boppo_stream/screens/Details/model/NormalSuccessResponse.dart';
import 'package:bloc/bloc.dart';
import 'package:boppo_stream/screens/Details/model/add_order.dart';
import 'package:boppo_stream/screens/Details/model/detail_movie_response.dart';
import 'package:boppo_stream/screens/OrderHistory/model/OrderResponse.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final ApiErrorMessage _apiErrorMessage = ApiErrorMessage();

  DetailBloc() : super(DetailInitial()) {
    on<GetMovieDetail>(_getMovieDetail);
    on<GetWebseriesDetail>(_getWebSeriesDetail);
    on<RefreshMovieDetail>(_refreshMovieDetail);
    on<RefreshWebseriesDetail>(_refreshWebseriesDetail);
    on<AddtoWatchLater>(_addToFav);
    on<RemoveFromWatchLater>(_removeFromFav);
    on<AddOrder>(_addOrder);
    on<VerifyPayment>(_verifyPayment);
  }

  void _getMovieDetail(GetMovieDetail event, Emitter<DetailState> emit) async {
    try {
      emit(GetDetailLoading());

      Map<String, dynamic> body = {
        "content_type_id": event.contentTypeId,
        "id": event.id
      };

      final Response<DetailMovieResponse> _detailResponse =
          await ProductApiService.create().prodbyid(body);
      if (_detailResponse.isSuccessful) {
        // successful request
        final body = _detailResponse.body;
        debugPrint("home log $body");
        if (body != null) {
          final _data = body.data;
          emit(DetailMovieSuccess(data: _data.toList()));
        } else
          emit(DetailError(error: EXCEPTIONAL_MESSAGE));
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_detailResponse);
        emit(DetailError(error: message));
      }
    } catch (e) {
      emit(DetailError(error: e.toString()));
    }
  }

  void _refreshMovieDetail(
      RefreshMovieDetail event, Emitter<DetailState> emit) async {
    try {
      emit(DetailLoading());

      Map<String, dynamic> body = {
        "content_type_id": event.contentTypeId,
        "id": event.id
      };

      final Response<DetailMovieResponse> _detailResponse =
          await ProductApiService.create().prodbyid(body);
      if (_detailResponse.isSuccessful) {
        // successful request
        final body = _detailResponse.body;
        debugPrint("home log $body");
        if (body != null) {
          final _data = body.data;
          emit(DetailMovieSuccess(data: _data.toList()));
        } else
          emit(DetailError(error: EXCEPTIONAL_MESSAGE));
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_detailResponse);
        emit(DetailError(error: message));
      }
    } catch (e) {
      emit(DetailError(error: e.toString()));
    }
  }

  void _getWebSeriesDetail(
      GetWebseriesDetail event, Emitter<DetailState> emit) async {
    try {
      emit(GetDetailLoading());

      Map<String, dynamic> body = {
        "id": event.id,
        "season_id": event.seasonId,
      };

      final Response<DetailMovieResponse> _detailResponse =
          await ProductApiService.create().seasonFlow(body);
      if (_detailResponse.isSuccessful) {
        // successful request
        final body = _detailResponse.body;
        debugPrint("home log $body");
        if (body != null) {
          final _data = body.data;
          emit(DetailMovieSuccess(data: _data.toList()));
        } else
          emit(DetailError(error: EXCEPTIONAL_MESSAGE));
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_detailResponse);
        emit(DetailError(error: message));
      }
    } catch (e) {
      emit(DetailError(error: e.toString()));
    }
  }

  void _refreshWebseriesDetail(
      RefreshWebseriesDetail event, Emitter<DetailState> emit) async {
    try {
      emit(DetailLoading());

      Map<String, dynamic> body = {
        "id": event.id,
        "season_id": event.seasonId,
      };

      final Response<DetailMovieResponse> _detailResponse =
          await ProductApiService.create().seasonFlow(body);
      if (_detailResponse.isSuccessful) {
        // successful request
        final body = _detailResponse.body;
        debugPrint("home log $body");
        if (body != null) {
          final _data = body.data;
          emit(DetailMovieSuccess(data: _data.toList()));
        } else
          emit(DetailError(error: EXCEPTIONAL_MESSAGE));
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_detailResponse);
        emit(DetailError(error: message));
      }
    } catch (e) {
      emit(DetailError(error: e.toString()));
    }
  }

  void _addToFav(AddtoWatchLater event, Emitter<DetailState> emit) async {
    try {
      emit(DetailLoading());

      Map<String, dynamic> body = {
        "content_type_id": event.contentTypeId,
        "content_id": event.contentId
      };

      final Response<NormalSuccessResponse> _homeResponse =
          await FavouriteService.create().addToFavourite([body]);
      if (_homeResponse.isSuccessful) {
        // successful request
        final body = _homeResponse.body;
        debugPrint("home log $body");
        if (body != null) {
          // final _data = body.data;
          emit(DetailAddFavSuccess());
        } else
          emit(DetailError(error: EXCEPTIONAL_MESSAGE));
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_homeResponse);
        emit(DetailError(error: message));
      }
    } catch (e) {
      emit(DetailError(error: e.toString()));
    }
  }

  void _removeFromFav(
      RemoveFromWatchLater event, Emitter<DetailState> emit) async {
    try {
      emit(DetailLoading());

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
          emit(DetailError(error: EXCEPTIONAL_MESSAGE));
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_homeResponse);
        emit(DetailError(error: message));
      }
    } catch (e) {
      emit(DetailError(error: e.toString()));
    }
  }

  void _addOrder(AddOrder event, Emitter<DetailState> emit) async {
    try {
      emit(DetailLoading());
      ContentList data;

      if (event.seasonId == -1) {
        data = ContentList(
            contentTypeId: event.contentTypeId,
            contentId: event.contentId,
            seasonId: null);
      } else {
        data = ContentList(
            contentTypeId: event.contentTypeId,
            contentId: event.contentId,
            seasonId: event.seasonId);
      }

      Map<String, dynamic> body = {
        "amount_type": event.amountType,
        "cartList": [data.toJson()],
      };

      final Response<AddOrderResponse> _homeResponse =
          await OrderHistoryService.create().addorder(body);
      if (_homeResponse.isSuccessful) {
        // successful request
        final body = _homeResponse.body;
        debugPrint("home log $body");
        if (body != null) {
          // final _data = body.data;
          emit(AddOrderMovieSuccess(data: body.data));
        } else
          emit(DetailError(error: EXCEPTIONAL_MESSAGE));
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_homeResponse);
        emit(DetailError(error: message));
      }
    } catch (e) {
      emit(DetailError(error: e.toString()));
    }
  }

  void _verifyPayment(VerifyPayment event, Emitter<DetailState> emit) async {
    try {
      emit(DetailLoading());

      final Response<OrderResponse> _homeResponse =
          await OrderHistoryService.create().paymentverify();
      if (_homeResponse.isSuccessful) {
        // successful request
        final body = _homeResponse.body;
        debugPrint("home log $body");
        if (body != null) {
          // final _data = body.data;
          emit(DetailSuccess());
        } else
          emit(DetailError(error: EXCEPTIONAL_MESSAGE));
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_homeResponse);
        emit(DetailError(error: message));
      }
    } catch (e) {
      emit(DetailError(error: e.toString()));
    }
  }
}
