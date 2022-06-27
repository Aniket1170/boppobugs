import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/PlayerView/player_screen.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:boppo_stream/utils/validation_alert.dart';
import 'package:flutter/material.dart';

import '../model/detail_movie_response.dart';
import 'episode_list_item.dart';

class EpisodeListWidget extends StatelessWidget {
  const EpisodeListWidget(
      {Key? key,
      required this.episodeList,
      required this.isPurchased,
      required this.onWatchPurchase})
      : super(key: key);

  final List<EpisodeListData> episodeList;
  final bool isPurchased;
  final Function()? onWatchPurchase;

  @override
  Widget build(BuildContext context) => Container(
        height: 32.h,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: this.episodeList.length,
          itemBuilder: (context, index) => EpisodeListItem(
              onTap: () => _onWatchEpisode(context, index),
              seriesEpisodeName: this.episodeList[index].name ?? '',
              watchingListData: this.episodeList[index],
              imageUrl: '$kImageBaseUrl${this.episodeList[index].thumbnail}'),
        ),
      );

  void _onWatchEpisode(BuildContext context, int index) {
    if (isPurchased) {
      if (this.episodeList != null && this.episodeList.isNotEmpty) {
        final movieUrl = this.episodeList[index].episodeUrl;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PlayerScreen(videoList: ['$kImageBaseUrl$movieUrl'])));
      }
    } else {
      showValidationAlert(
        context,
        errorMessage: 'Season not purchased',
        errorDescription: 'Please purchase season to continue streaming',
        buttonMessage: 'Not now',
        showPurchaseButton: true,
        onClose: () {
          Navigator.pop(context);
        },
        onPurchased: () {
          Navigator.pop(context);
          if (onWatchPurchase != null) onWatchPurchase!();
        },
      );
    }
  }
}
