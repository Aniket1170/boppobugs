part of 'mywishlist_bloc.dart';

abstract class MywishlistEvent extends Equatable {
  const MywishlistEvent();

  @override
  List<Object> get props => [];
}

class GetWishlist extends MywishlistEvent {
  const GetWishlist();

  @override
  List<Object> get props => [];
}

class RemoveFromWatchLater extends MywishlistEvent {
  final int contentTypeId;
  final int contentId;

  const RemoveFromWatchLater(
      {required this.contentTypeId, required this.contentId});

  @override
  List<Object> get props => [contentTypeId, contentId];
}
