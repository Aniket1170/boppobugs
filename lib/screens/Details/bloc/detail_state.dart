part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {
  const DetailInitial();

  @override
  List<Object> get props => [];
}

class GetDetailLoading extends DetailState {
  const GetDetailLoading();

  @override
  List<Object> get props => [];
}

class DetailLoading extends DetailState {
  const DetailLoading();

  @override
  List<Object> get props => [];
}

class DetailFavLoading extends DetailState {
  const DetailFavLoading();

  @override
  List<Object> get props => [];
}

class DetailMovieSuccess extends DetailState {
  final List<DetailMovieData> data;
  const DetailMovieSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class AddOrderMovieSuccess extends DetailState {
  final AddOrderData data;
  const AddOrderMovieSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class DetailSuccess extends DetailState {
  const DetailSuccess();

  @override
  List<Object> get props => [];
}

class DetailAddFavSuccess extends DetailState {
  const DetailAddFavSuccess();

  @override
  List<Object> get props => [];
}

class DetailError extends DetailState {
  final String error;
  const DetailError({required this.error});

  @override
  List<Object> get props => [error];
}
