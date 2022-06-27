import 'package:boppo_stream/APIService/HomeApiService/HomeApiService.dart';
import 'package:boppo_stream/Chopper/ApiErrorMessage.dart';
import 'package:boppo_stream/screens/Home/HomePage/model/HomeResponse.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiErrorMessage _apiErrorMessage = ApiErrorMessage();
  HomeBloc() : super(const HomeInitial()) {
    on<GetHomeData>(_getHomeData);
  }

  void _getHomeData(GetHomeData event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoading());

      final Response<HomeResponse> _homeResponse =
          await HomeApiService.create().getHomeData();
      if (_homeResponse.isSuccessful) {
        // successful request
        final body = _homeResponse.body;
        debugPrint("home log $body");
        if (body != null) {
          final _data = body.data;
          // if (_data != null)
          emit(HomeSuccess(homeData: _data[0]));
          // else
          //   emit(HomeError(error: EXCEPTIONAL_MESSAGE));
        }
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_homeResponse);
        emit(HomeError(error: message, code: _homeResponse.statusCode));
      }
    } catch (e) {
      emit(HomeError(error: EXCEPTIONAL_MESSAGE, code: 0));
    }
  }
}
