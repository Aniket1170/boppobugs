import 'package:boppo_stream/screens/Details/details_page.dart';
import 'package:boppo_stream/screens/PlayerView/player_screen.dart';
import 'package:boppo_stream/screens/WishList/bloc/mywishlist_bloc.dart';
import 'package:boppo_stream/screens/WishList/components/wishlist_item.dart';
import 'package:boppo_stream/screens/WishList/model/wishlist_response.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:boppo_stream/utils/share.dart';
import 'package:flutter/material.dart';

class MyWistList extends StatelessWidget {
  final MywishlistBloc bloc;

  final List<WishlistData> wishList;

  MyWistList({Key? key, required this.bloc, required this.wishList})
      : super(key: key);

  bool _isSearching = false;
  String? _directorName;
  String? _movieName;
  String? _movieDescription;
  String? _shareUrl;
  String? _movieImage;
  List<WishlistData> _searchList = [];
  List<String> _casts = [];
  List<String> _previews = [];

  void _onWatchListClick(int? contentTypeId, int? id) {
    if (contentTypeId != null && id != null) {
      bloc.add(
          RemoveFromWatchLater(contentTypeId: contentTypeId, contentId: id));
    }
  }

  void _onShareClick() {
    Share.instance.share();
  }

  void _onWatchTrailerClick(BuildContext context) {
    if (_previews.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlayerScreen(
                    videoList: _previews,
                  )));
    }
  }

  void _getMovieDetails(WishlistData detailMovieData) {
    _clearAllLists();

    final castList = detailMovieData.castList;
    if (castList != null && castList.isNotEmpty) {
      castList.forEach((i) {
        if (i.movieCastType == 'director') {
          _directorName = i.movieCastName ?? '';
        } else {
          _casts.add(i.movieCastName ?? '');
        }
      });
    }
    _movieName = detailMovieData.name ?? '';
    _movieImage = detailMovieData.file ?? '';
    _movieDescription = detailMovieData.description;
    final previewList = detailMovieData.previewList;
    if (previewList != null && previewList.isNotEmpty) {
      previewList.forEach((i) {
        _previews.add('$kImageBaseUrl${i.movieFilePath}');
      });
    }
  }

  void _showDetailsScreen(BuildContext context, int index) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(
                  contentTypeId: wishList[index].contentTypeId ?? 1,
                  id: wishList[index].contentId ?? 1,
                  movieThumbnailUrl: '$kImageBaseUrl$_movieImage',
                ))).then((value) => _getWishList());
  }

  void _clearAllLists() {
    _casts.clear();
  }

  Future<void> _getWishList() async {
    bloc.add(GetWishlist());
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
        padding: const EdgeInsets.only(bottom: 8.0),
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: _isSearching ? _searchList.length : wishList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          _getMovieDetails(wishList[index]);
          return InkWell(
            onTap: () => _showDetailsScreen(context, index),
            child: WishListItem(
              casts: _casts,
              movieImage: _movieImage ?? '',
              movieDescription: _movieDescription,
              movieName: _movieName ?? '',
              onWatchListClick: () {
                _onWatchListClick(wishList[index].contentTypeId,
                    wishList[index].contentTypeId);
              },
              onShareClick: _onShareClick,
              onWatchTrailerClick: () => _onWatchTrailerClick(context),
            ),
          );
        },
      );
}
