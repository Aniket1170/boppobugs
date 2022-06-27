import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'boppo_player.dart';
import 'helpers/adaptive_controls.dart';
import 'notifiers/player_notifier.dart';

class PlayerWithControls extends StatelessWidget {
  const PlayerWithControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BoppoPlayerController boppoController =
        BoppoPlayerController.of(context);

    double _calculateAspectRatio(BuildContext context) {
      final size = MediaQuery.of(context).size;
      final width = size.width;
      final height = size.height;

      // return width > height ? width / height : height / width;
      return width / height;
    }

    Widget _buildControls(
      BuildContext context,
      BoppoPlayerController boppoPlayerController,
    ) {
      return boppoPlayerController.showControls
          ? boppoPlayerController.customControls ??
              AdaptiveControls(
                  playNext: boppoPlayerController.playNext,
                  hasNextButton: boppoPlayerController.hasNextButton)
          : Container();
    }

    Widget _buildPlayerWithControls(
      BoppoPlayerController boppoPlayerController,
      BuildContext context,
    ) {
      return Stack(
        children: <Widget>[
          if (boppoPlayerController.placeholder != null)
            boppoPlayerController.placeholder!,
          Center(
            child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                    width: boppoPlayerController
                        .videoPlayerController.value.size.width,
                    height: boppoPlayerController
                        .videoPlayerController.value.size.height,
                    child: VideoPlayer(
                        boppoPlayerController.videoPlayerController)),
              ),
            ),
          ),
          if (boppoPlayerController.overlay != null)
            boppoPlayerController.overlay!,
          if (Theme.of(context).platform != TargetPlatform.iOS)
            Consumer<PlayerNotifier>(
              builder: (
                BuildContext context,
                PlayerNotifier notifier,
                Widget? widget,
              ) =>
                  AnimatedOpacity(
                opacity: notifier.hideStuff ? 0.0 : 0.8,
                duration: const Duration(
                  milliseconds: 250,
                ),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black54),
                  child: Container(),
                ),
              ),
            ),
          if (!boppoPlayerController.isFullScreen)
            _buildControls(context, boppoPlayerController)
          else
            SafeArea(
              bottom: false,
              child: _buildControls(context, boppoPlayerController),
            ),
        ],
      );
    }

    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: AspectRatio(
          aspectRatio: _calculateAspectRatio(context),
          child: _buildPlayerWithControls(boppoController, context),
        ),
      ),
    );
  }
}
