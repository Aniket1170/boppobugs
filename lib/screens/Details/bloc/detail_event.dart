part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetail extends DetailEvent {
  final int contentTypeId;
  final int id;

  const GetMovieDetail({required this.contentTypeId, required this.id});

  @override
  List<Object> get props => [contentTypeId, id];
}

class RefreshMovieDetail extends DetailEvent {
  final int contentTypeId;
  final int id;

  const RefreshMovieDetail({required this.contentTypeId, required this.id});

  @override
  List<Object> get props => [contentTypeId, id];
}

class GetWebseriesDetail extends DetailEvent {
  final int seasonId;
  final int id;

  const GetWebseriesDetail({required this.seasonId, required this.id});

  @override
  List<Object> get props => [seasonId, id];
}

class RefreshWebseriesDetail extends DetailEvent {
  final int seasonId;
  final int id;

  const RefreshWebseriesDetail({required this.seasonId, required this.id});

  @override
  List<Object> get props => [seasonId, id];
}

class AddtoWatchLater extends DetailEvent {
  final int contentTypeId;
  final int contentId;

  const AddtoWatchLater({required this.contentTypeId, required this.contentId});

  @override
  List<Object> get props => [contentTypeId, contentId];
}

class RemoveFromWatchLater extends DetailEvent {
  final int contentTypeId;
  final int contentId;

  const RemoveFromWatchLater(
      {required this.contentTypeId, required this.contentId});

  @override
  List<Object> get props => [contentTypeId, contentId];
}

class AddOrder extends DetailEvent {
  final String amountType;
  final int contentTypeId;
  final int contentId;
  final int seasonId;

  const AddOrder(
      {required this.amountType,
      required this.contentTypeId,
      required this.contentId,
      required this.seasonId});

  @override
  List<Object> get props => [amountType, contentTypeId, contentId, seasonId];
}

class VerifyPayment extends DetailEvent {
  final int contentTypeId;
  final int contentId;

  const VerifyPayment({required this.contentTypeId, required this.contentId});

  @override
  List<Object> get props => [contentTypeId, contentId];
}
