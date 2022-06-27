part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  const HomeLoading();

  @override
  List<Object> get props => [];
}

class HomeSuccess extends HomeState {
  final HomeData homeData;
  const HomeSuccess({required this.homeData});

  @override
  List<Object> get props => [homeData];
}

class HomeError extends HomeState {
  final int code;
  final String error;
  const HomeError({required this.code, required this.error});

  @override
  List<Object> get props => [code, error];
}
