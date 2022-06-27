import 'package:flutter/material.dart';

import '../model/movie_cast.dart';
import 'movie_cast_detail_item.dart';

class MovieCastDetailsWidget extends StatefulWidget {
  const MovieCastDetailsWidget(
      {Key? key, required this.castsList, this.showSeeAll = false})
      : super(key: key);
  final List<MovieCast> castsList;
  final bool showSeeAll;

  @override
  State<MovieCastDetailsWidget> createState() => _MovieCastDetailsWidgetState();
}

class _MovieCastDetailsWidgetState extends State<MovieCastDetailsWidget> {
  bool _showAll = false;

  void _onSeeAllClick() {
    setState(() {
      _showAll = !_showAll;
    });
  }

  @override
  Widget build(BuildContext context) => this.widget.castsList.isNotEmpty
      ? ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: (widget.showSeeAll && !_showAll)
              ? 1
              : this.widget.castsList.length,
          itemBuilder: (context, index) => MovieCastDetailItem(
            header: this.widget.castsList[index].header,
            items: this.widget.castsList[index].castList,
            singleValue: this.widget.castsList[index].singleCast,
            showSeeAll: (widget.showSeeAll && index == 0) ? true : false,
            onSeeAllClick: _onSeeAllClick,
          ),
        )
      : Container();
}
