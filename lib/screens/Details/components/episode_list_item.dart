import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/Details/model/detail_movie_response.dart';
import 'package:flutter/material.dart';

class EpisodeListItem extends StatelessWidget {
  EpisodeListItem(
      {Key? key,
      required this.imageUrl,
      required this.seriesEpisodeName,
      required this.watchingListData,
      this.onTap})
      : super(key: key);

  final String imageUrl;
  final String seriesEpisodeName;
  final EpisodeListData watchingListData;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: 32.w,
          padding: const EdgeInsets.only(right: 12.0),
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
                    width: 32.w,
                    height: 24.h,
                  ),
                  Positioned(
                    top: 0.0,
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                        alignment: Alignment.center,
                        child: Icon(Icons.play_circle_outline)),
                  )
                ],
              ),
              SizedBox(height: 1.h),
              AutoSizeText(
                seriesEpisodeName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 6.sp),
              ),
            ],
          ),
        ),
      );
}
