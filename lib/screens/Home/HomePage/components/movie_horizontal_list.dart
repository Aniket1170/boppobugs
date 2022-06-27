import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/Home/HomePage/model/HomeResponse.dart';
import 'package:boppo_stream/screens/Movies/MoviesPage.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';
import 'movie_list_item.dart';

class MovieHorizontalList extends StatelessWidget {
  const MovieHorizontalList({
    Key? key,
    required String title,
    bool showPriceTag = true,
    required List<WatchingListData>? movieList,
  })  : _movieList = movieList,
        _title = title,
        _showPriceTag = showPriceTag,
        super(key: key);

  final List<WatchingListData>? _movieList;
  final String _title;
  final bool _showPriceTag;

  void _nav(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MoviesPage(
                  list: _movieList ?? [],
                  label: _title,
                )));
  }

  @override
  Widget build(BuildContext context) =>
      (_movieList != null && _movieList!.isNotEmpty)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => _nav(context),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 16.0, 4.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          _title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 11.5.sp, fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.arrow_forward, size: 5.w),
                        // Image.asset('assets/icons/rightarrow.png'),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  height: 30.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: this._movieList?.length,
                    itemBuilder: (context, index) => MovieListItem(
                        watchingListData: this._movieList![index],
                        showPriceTag: _showPriceTag,
                        imageUrl: '$kImageBaseUrl${_movieList![index].file}'),
                  ),
                ),
              ],
            )
          : Container();
}
