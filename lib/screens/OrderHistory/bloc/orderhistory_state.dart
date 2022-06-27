part of 'orderhistory_bloc.dart';

class OrderhistoryState extends Equatable {
  const OrderhistoryState();

  @override
  List<Object> get props => [];
}

class OrderhistoryInitial extends OrderhistoryState {}

class OrderhistoryLoading extends OrderhistoryState {
  const OrderhistoryLoading();

  @override
  List<Object> get props => [];
}

class OrderhistorySuccess extends OrderhistoryState {
  final List<MovieData> orderList;

  const OrderhistorySuccess({required this.orderList});

  @override
  List<Object> get props => [orderList];
}

class AddOrderMovieSuccess extends OrderhistoryState {
  final AddOrderData data;

  /// movie or season name
  final String name;

  const AddOrderMovieSuccess({required this.data, required this.name});

  @override
  List<Object> get props => [data, name];
}

class OrderhistoryError extends OrderhistoryState {
  final String error;
  const OrderhistoryError({required this.error});

  @override
  List<Object> get props => [error];
}
