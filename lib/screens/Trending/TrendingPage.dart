import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/CommomWidgets/price_tag.dart';
import 'package:boppo_stream/screens/Details/details_page.dart';
import 'package:boppo_stream/screens/Home/HomePage/model/HomeResponse.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';

class TrendingPage extends StatefulWidget {
  final List<WatchingListData> list;

  const TrendingPage({Key? key, required this.list}) : super(key: key);

  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  void _navToDetailPage(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(
                  contentTypeId: widget.list[index].contentTypePId ?? 1,
                  id: widget.list[index].id ?? 1,
                  movieThumbnailUrl: '$kImageBaseUrl${widget.list[index].file}',
                  // // movieBanner: '${widget.list[index].baseUrl}${widget.list[index].file}',
                  // movieName: widget.list[index].name ?? '',
                )));
  }

  @override
  Widget build(BuildContext context) {
    // final double itemHeight = MediaQuery.of(context).size.height / 3;
    // final double itemWidth = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        titleSpacing: 16.0,
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        centerTitle: true,
        leading: TextButton.icon(
          icon: Row(
            children: [
              Icon(Icons.arrow_back_ios_outlined),
            ],
          ),
          label: Text(
            'Back',
            textAlign: TextAlign.start,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Trending',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
        child: GridView.count(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            // childAspectRatio: (itemHeight / itemWidth),
            childAspectRatio: 0.9,
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            children: List<Widget>.generate(
                this.widget.list.length,
                (index) => InkWell(
                      onTap: () => _navToDetailPage(context, index),
                      child: _movieGridItem(
                          context, '$kImageBaseUrl${widget.list[index].file}',
                          currentValue: widget.list[index].inr ?? 0),
                    ))),
        // '${widget.list![index].baseUrl}/${widget.list![index].file}'))),
      ),
    );
  }

  Widget _movieGridItem(BuildContext context, String imageVal,
          {num? currentValue, num? originalValue}) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          children: [
            ImageHelper(
              image: '$imageVal',
              imageType: ImageType.network,
              boxFit: BoxFit.fill,
            ),
            // FadeInImage(
            //   image: NetworkImage(imageVal),
            //   placeholder: AssetImage(kPlaceholder),
            //   fit: BoxFit.fill,
            //   width: MediaQuery.of(context).size.width,
            // ),
            // Image.network(
            //   "$imageVal",
            //   // width: 160,
            //   height: 200,
            //   fit: BoxFit.fill,
            //   loadingBuilder: (BuildContext ctx, Widget child,
            //       ImageChunkEvent? loadingProgress) {
            //     if (loadingProgress == null) {
            //       return child;
            //     } else {
            //       return Container(
            //         width: 160,
            //         height: 200,
            //         child: Center(
            //           // child: CircularProgressIndicator(
            //           //   valueColor:
            //           //       AlwaysStoppedAnimation<Color>(Colors.green),
            //           // ),
            //           child: CupertinoActivityIndicator(
            //             animating: true,
            //             radius: 30,
            //           ),
            //         ),
            //       );
            //     }
            //   },
            // ),
            Positioned(
              right: 5.0,
              top: 5.0,
              child: PriceTag(
                  currentValue: currentValue, originalValue: originalValue),
            )
          ],
        ),
      );
}
