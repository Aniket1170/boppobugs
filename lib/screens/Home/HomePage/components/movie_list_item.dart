import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/CommomWidgets/price_tag.dart';
import 'package:boppo_stream/CommomWidgets/purchased_tag.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/Details/details_page.dart';
import 'package:boppo_stream/screens/Home/HomePage/model/HomeResponse.dart';
import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  MovieListItem(
      {Key? key,
      required this.showPriceTag,
      required this.imageUrl,
      required this.watchingListData})
      : super(key: key);

  final bool showPriceTag;
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
      padding: const EdgeInsets.only(right: 12.0),
      width: 30.w,
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ImageHelper(
                  image: '$imageUrl',
                  imageType: ImageType.network,
                  imageShape: ImageShape.roundedCorner,
                  boxFit: BoxFit.fill,
                  width: 30.w,
                  height: 22.h,
                ),
                if (showPriceTag)
                  Positioned(
                    left: 4.0,
                    top: 4.0,
                    child: (watchingListData.isPurchased != null &&
                            watchingListData.isPurchased! == 1)
                        ? PurchasedTag()
                        : PriceTag(currentValue: watchingListData.inr),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            AutoSizeText(
              watchingListData.name ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 9.sp),
            )
          ],
        ),
        onTap: () => _navToDetailPage(context),
      ));
}
