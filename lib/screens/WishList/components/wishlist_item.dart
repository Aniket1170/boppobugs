import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/read_more.dart';
import 'package:boppo_stream/CommomWidgets/vertical_text_button.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';

class WishListItem extends StatelessWidget {
  final String movieImage;
  final String movieName;
  final String? movieDescription;
  final List<String> casts;
  final Function()? onWatchListClick;
  final Function()? onShareClick;
  final Function()? onWatchTrailerClick;
  const WishListItem({
    Key? key,
    required this.movieImage,
    required this.movieName,
    required this.movieDescription,
    required this.casts,
    required this.onWatchListClick,
    required this.onShareClick,
    required this.onWatchTrailerClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: tileColor,
        padding: const EdgeInsets.only(top: 4.0),
        margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
        height: 25.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 4.0, 8.0),
                child: ImageHelper(
                  image: '$kImageBaseUrl$movieImage',
                  imageType: ImageType.network,
                  imageShape: ImageShape.roundedCorner,
                  boxFit: BoxFit.fill,
                  height: 25.h,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      movieName,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14.sp),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        VerticalTextButton(
                          icon: Icons.share,
                          label: 'Share',
                          onTap: this.onShareClick,
                        ),
                        const SizedBox(width: 15),
                        VerticalTextButton(
                          label: 'Remove',
                          icon: Icons.bookmark_outlined,
                          isSelected: true,
                          onTap: this.onWatchListClick,
                        ),
                        const SizedBox(width: 15),
                        VerticalTextButton(
                          icon: Icons.play_arrow_outlined,
                          showBorder: true,
                          label: 'Trailer',
                          onTap: this.onWatchTrailerClick,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (this.movieDescription != null)
                      ReadMoreText(
                        '${this.movieDescription}',
                        colorClickableText: Colors.white,
                        trimMode: TrimMode.Line,
                        trimLines: 3,
                        trimCollapsedText: '... see more',
                        trimExpandedText: '... see less ',
                        style: TextStyle(fontSize: 10.sp),
                      )

                    // AutoSizeText(
                    //   casts.join(', ').toString(),
                    //   style: TextStyle(fontSize: 8.sp),
                    // ),
                    // const Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
