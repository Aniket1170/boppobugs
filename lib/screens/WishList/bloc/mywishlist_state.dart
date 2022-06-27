part of 'mywishlist_bloc.dart';

abstract class MywishlistState extends Equatable {
  const MywishlistState();

  @override
  List<Object> get props => [];
}

class MywishlistInitial extends MywishlistState {
  const MywishlistInitial();

  @override
  List<Object> get props => [];
}

class MywishlistLoading extends MywishlistState {
  const MywishlistLoading();

  @override
  List<Object> get props => [];
}

class MywishlistSuccess extends MywishlistState {
  final List<WishlistData> wishList;
  const MywishlistSuccess({required this.wishList});

  @override
  List<Object> get props => [wishList];
}

class DetailAddFavSuccess extends MywishlistState {
  const DetailAddFavSuccess();

  @override
  List<Object> get props => [];
}

class MywishlistError extends MywishlistState {
  final String error;
  const MywishlistError({required this.error});

  @override
  List<Object> get props => [error];
}
