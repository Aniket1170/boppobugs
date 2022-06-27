import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/Details/details_page.dart';
import 'package:boppo_stream/screens/Home/HomePage/model/HomeResponse.dart';
import 'package:flutter/material.dart';

class WebSeriesListItem extends StatelessWidget {
  WebSeriesListItem({
    Key? key,
    required this.imageUrl,
    required this.watchingListData,
  }) : super(key: key);

  final String imageUrl;
  final WatchingListData watchingListData;

  void _navToDetailPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(
                  contentTypeId: watchingListData.contentTypePId ?? 1,
                  id: watchingListData.id ?? 1,
                  seasonId: watchingListData.seasonId,
                  movieThumbnailUrl: imageUrl,
                )));
  }

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.only(left: 8.0),
      height: 160,
      child: GestureDetector(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: ImageHelper(
              image: '$imageUrl',
              imageType: ImageType.network,
              boxFit: BoxFit.fill,
              width: 25.w,
              height: 20.h),
        ),
        onTap: () => _navToDetailPage(context),
      ));
}
