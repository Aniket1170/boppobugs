import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/screens/Details/details_page.dart';
import 'package:boppo_stream/screens/Home/HomePage/model/HomeResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContinueWatchingListItem extends StatelessWidget {
  ContinueWatchingListItem(
      {Key? key, required this.imageUrl, required this.watchingListData})
      : super(key: key);

  final String imageUrl;
  final WatchingListData watchingListData;

  void _navToDetailPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(
                  contentTypeId: watchingListData.contentTypePId ?? 1,
                  id: watchingListData.id ?? 1,
                  movieThumbnailUrl: imageUrl,
                  // movieName: watchingListData.name ?? '',
                )));
  }

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.only(left: 12),
      child: GestureDetector(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: ImageHelper(
                  image: '$imageUrl',
                  imageType: ImageType.network,
                  boxFit: BoxFit.fill,
                  width: 160,
                  height: 200),
              // child: FadeInImage(
              //   image: NetworkImage(imageUrl),
              //   placeholder: AssetImage(kPlaceholder),
              //   fit: BoxFit.fill,
              //   width: 160,
              //   height: 200,
              // ),
              // child: Image.network(
              //   "$imageUrl",
              //   width: 160,
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
        onTap: () => _navToDetailPage(context),
      ));
}
