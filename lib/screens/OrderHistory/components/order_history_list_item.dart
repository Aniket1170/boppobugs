import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:boppo_stream/utils/extensions.dart';

class OrderHistoryListItem extends StatelessWidget {
  final String? movieImage;
  final String? movieUrl;
  final String? movieName;
  final List<String> movieCasts;
  final String? purchaseAmount;
  final String? purchaseDate;
  final int? transactionStatus;
  final String? currency;
  final Function()? onViewDetails;
  final Function()? rePurchase;
  final Function()? onMoviePlay;
  const OrderHistoryListItem({
    Key? key,
    this.movieName,
    this.movieUrl,
    this.movieImage,
    this.movieCasts = const [],
    this.purchaseAmount,
    this.purchaseDate,
    this.transactionStatus,
    this.currency,
    this.onViewDetails,
    this.rePurchase,
    this.onMoviePlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: tileColor,
        padding: const EdgeInsets.only(right: 8.0),
        margin: const EdgeInsets.only(bottom: 8.0),
        height: 32.h,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              child: ImageHelper(
                image: movieImage ??
                    'https://cdn.bollywoodmdb.com/videos/300x400/2020/mimi-mimi-official-trailer.jpg',
                imageType: ImageType.network,
                imageShape: ImageShape.roundedCorner,
                boxFit: BoxFit.fill,
                width: 30.w,
                height: 28.h,
              ),
            ),
            Expanded(
              child: Container(
                  padding:
                      const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        movieName ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.sp),
                      ),
                      const SizedBox(height: 4.0),
                      AutoSizeText(
                        movieCasts.join(', ').toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 5.sp),
                      ),
                      const SizedBox(height: 8),
                      AutoSizeText(
                        // purchaseDate?.convertToReadableDate() ?? '',
                        purchaseDate?.convertToNormalDate() ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 9.sp),
                      ),
                      (transactionStatus != 1)
                          ? Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                              child: AutoSizeText(
                                'Payment failed',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 9.0.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                              child: AutoSizeText(
                                'Purchased sucessfully',
                                style: TextStyle(
                                    fontSize: 9.0.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                      const Spacer(),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       '$rupeeSymbol $purchaseAmount',
                      //       style: const TextStyle(
                      //           fontWeight: FontWeight.w500,
                      //           // color: Color(0xFFFF6969),
                      //           fontSize: 15.0),
                      //     ),
                      //     Text(
                      //       purchaseDate?.convertToReadableDate() ?? '',
                      //       style: const TextStyle(
                      //         // color: Color(0xFF808080),
                      //         fontSize: 15.0,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      (transactionStatus == 1)
                          ? Row(
                              children: [
                                if (transactionStatus == 1)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: InkWell(
                                      onTap: onMoviePlay,
                                      child: Row(
                                        children: [
                                          AutoSizeText('Play',
                                              style: TextStyle(
                                                  fontSize: 8.sp,
                                                  color: Colors.white)),
                                          const SizedBox(width: 4.0),
                                          Icon(Icons.play_circle_outline)
                                        ],
                                      ),
                                    ),
                                  ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: 6.w,
                                    minWidth: 30.w,
                                  ),
                                  child: ElevatedButton(
                                      child: AutoSizeText('View detail',
                                          style: TextStyle(
                                              fontSize: 8.sp,
                                              color: Colors.white)),
                                      onPressed: onViewDetails),
                                ),
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: 6.w,
                                  minWidth: 40.w,
                                ),
                                child: ElevatedButton(
                                    child: AutoSizeText(
                                        'Watch with ${this.currency} $rupeeSymbol',
                                        style: TextStyle(
                                            fontSize: 8.sp,
                                            color: Colors.white)),
                                    onPressed: rePurchase),
                              ),
                            ),
                    ],
                  )),
            )
          ],
        ),
      );
}
