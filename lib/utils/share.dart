import 'package:flutter_share/flutter_share.dart';

class Share {
  static final Share _instance = Share._internal();

  factory Share() => _instance;

  static Share get instance => _instance;

  Share._internal();

  Future<void> share({String? title, String? text, String? linkUrl}) async {
    await FlutterShare.share(
        title: title ?? 'Boppo Stream',
        text: text ?? 'Here is what I found ',
        linkUrl: linkUrl ??
            'https://www.bollywoodmdb.com/bollywood-news-adda/makers-of-kartik-aaryans-shehzada-pay-8-crores-to-goldmines-telefilms-to-not-screen-ala-vaikunthapurramuloo-in-hindi',
        chooserTitle: 'Share using');
  }
}
