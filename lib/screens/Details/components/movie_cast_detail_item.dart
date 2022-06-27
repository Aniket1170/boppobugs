import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:flutter/material.dart';

class MovieCastDetailItem extends StatelessWidget {
  const MovieCastDetailItem(
      {Key? key,
      required this.header,
      this.items,
      this.singleValue,
      this.showSeeAll = false,
      this.onSeeAllClick})
      : super(key: key);

  final String header;
  final List<String>? items;
  final String? singleValue;
  final bool showSeeAll;
  final Function()? onSeeAllClick;

  @override
  Widget build(BuildContext context) => (items != null && items!.isNotEmpty)
      ? Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    header,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                  if (showSeeAll)
                    TextButton(
                      child: Row(
                        children: [
                          AutoSizeText(
                            'See all',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 10.sp),
                          ),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                      onPressed: onSeeAllClick,
                    )
                ],
              ),
              const SizedBox(height: 5),
              if (items != null)
                AutoSizeText(
                  items!.join(', ').toString(),
                  style: TextStyle(
                    fontSize: 10.sp,
                  ),
                ),
            ],
          ),
        )
      : (singleValue != null)
          ? Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AutoSizeText(
                    header,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                  const SizedBox(height: 5),
                  if (singleValue != null)
                    AutoSizeText(
                      singleValue!,
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                    ),
                ],
              ),
            )
          : Container();
}
