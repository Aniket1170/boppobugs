import 'package:boppo_stream/CommomWidgets/build_app_bar.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/CommomWidgets/price_tag.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/Details/details_page.dart';
import 'package:boppo_stream/screens/Home/HomePage/model/HomeResponse.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  final List<WatchingListData> list;
  final String label;

  const MoviesPage({Key? key, required this.list, required this.label})
      : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  void _navToDetailPage(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(
                  contentTypeId: widget.list[index].contentTypePId ?? 1,
                  id: widget.list[index].id ?? 1,
                  seasonId: widget.list[index].seasonId,
                  movieThumbnailUrl: '$kImageBaseUrl${widget.list[index].file}',
                )));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: BuildAppBar(title: widget.label),
        body: Container(
          margin:
              const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 20),
          child: GridView.count(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              childAspectRatio: (20.w / (20.w * 1.5)),
              crossAxisCount: 3,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              children: List<Widget>.generate(
                  this.widget.list.length,
                  (index) => InkWell(
                        onTap: () => _navToDetailPage(context, index),
                        child: _movieGridItem(
                            '$kImageBaseUrl${widget.list[index].file}', index),
                      ))),
          // '${widget.list![index].baseUrl}/${widget.list![index].file}'))),
        ),
      );

  Widget _movieGridItem(String imageVal, int index) => ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Stack(
          children: [
            ImageHelper(
              image: '$imageVal',
              imageType: ImageType.network,
              imageShape: ImageShape.roundedCorner,
              boxFit: BoxFit.fill,
              width: 100.w,
              height: 100.h,
            ),
            Positioned(
              left: 5.0,
              top: 5.0,
              child: PriceTag(currentValue: widget.list[index].inr),
            )
          ],
        ),
      );
}
