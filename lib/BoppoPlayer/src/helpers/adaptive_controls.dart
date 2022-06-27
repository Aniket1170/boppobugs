import 'package:flutter/material.dart';

import '../../boppo_player.dart';

class AdaptiveControls extends StatelessWidget {
  final Function()? playNext;
  final bool hasNextButton;
  const AdaptiveControls({Key? key, this.playNext, this.hasNextButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
        return MaterialControls(
          playNext: playNext,
          hasNextButton: hasNextButton,
        );

      // case TargetPlatform.fuchsia:
      // return const MaterialControls();

      // case TargetPlatform.macOS:
      // case TargetPlatform.windows:
      // case TargetPlatform.linux:
      //   return const MaterialDesktopControls();

      // case TargetPlatform.iOS:
      //   return const CupertinoControls(
      //     backgroundColor: Color.fromRGBO(41, 41, 41, 0.7),
      //     iconColor: Color.fromARGB(255, 200, 200, 200),
      //   );
      default:
        return const MaterialControls();
    }
  }
}