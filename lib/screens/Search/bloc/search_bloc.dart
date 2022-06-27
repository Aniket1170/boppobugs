import 'package:boppo_stream/APIService/ProductApiService/ProductApiService.dart';
import 'package:boppo_stream/Chopper/ApiErrorMessage.dart';
import 'package:boppo_stream/screens/Search/model/SearchMovieResponse.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  ApiErrorMessage _apiErrorMessage = ApiErrorMessage();

  SearchBloc() : super(const SearchInitial()) {
    on<SearchMovie>(_searchMovie);
  }

  // void onSearchInitiated(String query) {
  //   dispatch(SearchInitiated((b) => b..query = query));
  // }

  // void fetchNextResultPage() {
  //   dispatch(FetchNextResultPage());
  // }

  void _searchMovie(SearchMovie event, Emitter<SearchState> emit) async {
    try {
      emit(SearchLoading());

      Map<String, dynamic> requestBody = {"name": event.movieName};

      final Response<SearchMovieResponse> _homeResponse =
          await ProductApiService.create().searchMovie(requestBody);
      if (_homeResponse.isSuccessful) {
        // successful request
        final body = _homeResponse.body;
        debugPrint("home log $body");
        if (body != null) {
          final _data = body.data;
          // if (_data != null)
          emit(SearchSuccess(searchDataList: _data.toList()));
        } else
          emit(SearchError(error: EXCEPTIONAL_MESSAGE));
      } else {
        // error from server
        final message = _apiErrorMessage.errorResponse(_homeResponse);
        emit(SearchError(error: message));
      }
    } catch (e) {
      emit(SearchError(error: EXCEPTIONAL_MESSAGE));
    }
  }
}
