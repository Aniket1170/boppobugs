part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {
  const SearchInitial();

  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  const SearchLoading();

  @override
  List<Object> get props => [];
}

class SearchSuccess extends SearchState {
  final List<SearchData> searchDataList;

  const SearchSuccess({required this.searchDataList});

  @override
  List<Object> get props => [searchDataList];
}

class SearchError extends SearchState {
  final String error;
  const SearchError({required this.error});

  @override
  List<Object> get props => [error];
}
