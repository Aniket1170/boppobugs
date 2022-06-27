import 'package:flutter/material.dart';

import 'animated_play_pause.dart';

class CenterControlButtons extends StatelessWidget {
  const CenterControlButtons({
    Key? key,
    required this.backgroundColor,
    this.iconColor,
    required this.show,
    required this.isPlaying,
    required this.isFinished,
    this.onPressed,
    this.onBackward,
    this.onForward,
  }) : super(key: key);

  final Color backgroundColor;
  final Color? iconColor;
  final bool show;
  final bool isPlaying;
  final bool isFinished;
  final VoidCallback? onPressed;
  final VoidCallback? onBackward;
  final VoidCallback? onForward;

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.transparent,
        child: Center(
          child: AnimatedOpacity(
            opacity: show ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    // Always set the iconSize on the IconButton, not on the Icon itself:
                    // child: IconButton(
                    //   iconSize: 32,
                    //   icon: Icon(Icons.rotate_left, color: iconColor),
                    //   onPressed: onBackward,
                    // ),
                    child: FlatButton(
                      onPressed: onBackward,
                      child: Image.asset(
                        'assets/icons/backwardsec.png',
                        height: 40,
                        width: 40,
                        color: iconColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    // Always set the iconSize on the IconButton, not on the Icon itself:
                    child: IconButton(
                      iconSize: 32,
                      icon: isFinished
                          ? Icon(Icons.replay, color: iconColor)
                          : AnimatedPlayPause(
                              color: iconColor,
                              playing: isPlaying,
                            ),
                      onPressed: onPressed,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    // Always set the iconSize on the IconButton, not on the Icon itself:
                    // child: IconButton(
                    //   iconSize: 32,
                    //   icon: Icon(Icons.rotate_right, color: iconColor),
                    //   onPressed: onForward,
                    // ),
                    child: FlatButton(
                      onPressed: onForward,
                      child: Image.asset(
                        'assets/icons/forwardsec.png',
                        height: 40,
                        width: 40,
                        color: iconColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
