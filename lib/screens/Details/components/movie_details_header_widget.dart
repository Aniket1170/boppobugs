import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/vertical_text_button.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/CommomWidgets/read_more.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:flutter/material.dart';

class MovieDetailsHeaderWidget extends StatelessWidget {
  const MovieDetailsHeaderWidget(
      {Key? key,
      required this.movieThumbnailUrl,
      required this.movieName,
      required this.movieDescription,
      required this.isAddedToWatchLater,
      this.onWatchLaterClick,
      this.onShareClick,
      this.onWatchTrailerClick})
      : super(key: key);

  final String movieThumbnailUrl;
  final String movieName;
  final String? movieDescription;
  final bool isAddedToWatchLater;
  final Function()? onWatchLaterClick;
  final Function()? onShareClick;
  final Function()? onWatchTrailerClick;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withAlpha(30),
                      blurRadius: 40.0,
                      spreadRadius: 16.0,
                      offset: Offset(
                        0.0,
                        5.0,
                      ),
                    ),
                  ]),
              child: ImageHelper(
                  image: '${this.movieThumbnailUrl}',
                  imageType: ImageType.network,
                  imageShape: ImageShape.roundedCorner,
                  boxFit: BoxFit.fill,
                  height: 55.w,
                  width: 30.w),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AutoSizeText(
                      '${this.movieName}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        VerticalTextButton(
                          label: (this.isAddedToWatchLater == true)
                              ? 'Favourite'
                              : 'Favourite',
                          icon: (this.isAddedToWatchLater == true)
                              ? Icons.bookmark_outlined
                              : Icons.bookmark_border,
                          isSelected: this.isAddedToWatchLater,
                          onTap: this.onWatchLaterClick,
                        ),
                        const SizedBox(width: 15),
                        VerticalTextButton(
                          icon: Icons.share_outlined,
                          label: 'Share',
                          onTap: this.onShareClick,
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
                    if (this.movieDescription != null)
                      const SizedBox(height: 20),
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
                    //   _movieDescription ?? '',
                    //   style: TextStyle(fontSize: 8.sp),
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
