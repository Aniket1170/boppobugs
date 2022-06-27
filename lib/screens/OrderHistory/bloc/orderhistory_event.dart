part of 'orderhistory_bloc.dart';

abstract class OrderhistoryEvent extends Equatable {
  const OrderhistoryEvent();

  @override
  List<Object> get props => [];
}

class GetOrderHistory extends OrderhistoryEvent {
  const GetOrderHistory();

  @override
  List<Object> get props => [];
}

class AddOrder extends OrderhistoryEvent {
  /// movie or season name
  final String name;
  final String amountType;
  final int contentTypeId;
  final int contentId;
  final int seasonId;

  const AddOrder({
    required this.name,
    required this.amountType,
    required this.contentTypeId,
    required this.contentId,
    required this.seasonId,
  });

  @override
  List<Object> get props =>
      [name, amountType, contentTypeId, contentId, seasonId];
}
