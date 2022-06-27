import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/screens/Details/details_page.dart';
import 'package:boppo_stream/screens/Home/HomePage/model/HomeResponse.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';

class WebSeriesPage extends StatefulWidget {
  final List<WatchingListData> list;

  const WebSeriesPage({Key? key, required this.list}) : super(key: key);

  @override
  _WebSeriesPageState createState() => _WebSeriesPageState();
}

class _WebSeriesPageState extends State<WebSeriesPage> {
  void _navToDetailPage(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(
                  contentTypeId: widget.list[index].contentTypePId ?? 1,
                  id: widget.list[index].id ?? 1,
                  movieThumbnailUrl: '$kImageBaseUrl${widget.list[index].file}',
                )));
  }

  @override
  Widget build(BuildContext context) {
    final double itemHeight = MediaQuery.of(context).size.height / 3;
    final double itemWidth = MediaQuery.of(context).size.width / 2;
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
          'Web Series',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
        child: GridView.count(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            childAspectRatio: ((itemHeight) / (itemWidth * 2)),
            crossAxisCount: 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            children: List<Widget>.generate(
                this.widget.list.length,
                (index) => InkWell(
                      onTap: () => _navToDetailPage(context, index),
                      child: _movieGridItem(
                          '$kImageBaseUrl${widget.list[index].file}'),
                    ))),
        // '${widget.list![index].baseUrl}/${widget.list![index].file}'))),
      ),
    );
  }

  Widget _movieGridItem(String imageVal) => ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: ImageHelper(
            image: '$imageVal',
            imageType: ImageType.network,
            boxFit: BoxFit.fill,
            width: MediaQuery.of(context).size.width),
      );
}
