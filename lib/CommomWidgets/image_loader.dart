import 'package:flutter/cupertino.dart';

class ImageLoader extends StatelessWidget {
  final String imageVal;
  final double? height;
  final double? width;
  final BoxFit? fit;
  const ImageLoader(
      {Key? key, required this.imageVal, this.height, this.width, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Image.network(
        "$imageVal",
        width: width,
        height: height,
        fit: fit ?? BoxFit.fill,
        loadingBuilder: (BuildContext ctx, Widget child,
                ImageChunkEvent? loadingProgress) =>
            loadingProgress == null
                ? child
                : Container(
                    width: width,
                    height: height,
                    child: Center(
                      // child: CircularProgressIndicator(
                      //   valueColor:
                      //       AlwaysStoppedAnimation<Color>(Colors.green),
                      // ),
                      child: CupertinoActivityIndicator(
                        animating: true,
                        radius: 30,
                      ),
                    ),
                  ),
      );
}
