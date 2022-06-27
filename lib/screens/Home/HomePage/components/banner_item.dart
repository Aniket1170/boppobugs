import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/CommomWidgets/price_tag.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/Details/details_page.dart';
import 'package:boppo_stream/screens/Home/HomePage/model/HomeResponse.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';

class BannerItem extends StatelessWidget {
  final WatchingListData watchingListData;
  final int currentIndexCount;
  final int totalSlides;

  BannerItem({
    Key? key,
    required this.watchingListData,
    required this.currentIndexCount,
    required this.totalSlides,
  }) : super(key: key);

  void _navToDetailPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(
                  contentTypeId: watchingListData.contentTypePId ?? 1,
                  id: watchingListData.movieId ?? 1,
                  movieThumbnailUrl:
                      '$kImageBaseUrl${watchingListData.mobileBanner}',
                  // movieName: watchingListData.name ?? '',
                )));
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Stack(
          children: [
            ImageHelper(
                image: '$kImageBaseUrl${watchingListData.mobileBanner}',
                imageType: ImageType.network,
                imageShape: ImageShape.roundedCorner,
                boxFit: BoxFit.fill,
                height: 50.w,
                width: MediaQuery.of(context).size.width),
            Positioned(
              left: 8.0,
              top: 8.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PriceTag(currentValue: watchingListData.price),
                  AutoSizeText(watchingListData.name ?? '',
                      style: TextStyle(
                          fontSize: 11.5.sp, fontWeight: FontWeight.w600))
                ],
              ),
            ),
            Positioned(
              right: 8.0,
              top: 8.0,
              child: AutoSizeText('$currentIndexCount/$totalSlides',
                  style: TextStyle(fontWeight: FontWeight.w600)),
            )
          ],
        ),
        onTap: () => _navToDetailPage(context),
      );
}
