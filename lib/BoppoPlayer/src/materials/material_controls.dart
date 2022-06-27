// import 'dart:async';
// import 'dart:math';
//
// import 'package:boppo_stream/BoppoPlayer/src/helpers/utils.dart';
// import 'package:boppo_stream/BoppoPlayer/src/notifiers/player_notifier.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:video_player/video_player.dart';
//
// import '../../boppo_player.dart';
// import '../center_control_buttons.dart';
// import 'material_progress_bar.dart';
// import 'widgets/options_dialog.dart';
// import 'widgets/playback_speed_dialog.dart';
//
// class MaterialControls extends StatefulWidget {
//   const MaterialControls({
//     this.showPlayButton = true,
//     this.hasNextButton = false,
//     this.playNext,
//     Key? key,
//   }) : super(key: key);
//
//   final bool showPlayButton;
//   final bool hasNextButton;
//   final Function()? playNext;
//
//   @override
//   State<StatefulWidget> createState() => _MaterialControlsState();
// }
//
// class _MaterialControlsState extends State<MaterialControls>
//     with SingleTickerProviderStateMixin {
//   late PlayerNotifier notifier;
//   late VideoPlayerValue _latestValue;
//   double? _latestVolume;
//   Timer? _hideTimer;
//   Timer? _initTimer;
//   late var _subtitlesPosition = Duration.zero;
//   bool _subtitleOn = false;
//   bool _lockControls = false;
//   Timer? _showAfterExpandCollapseTimer;
//   bool _dragging = false;
//   bool _displayTapped = false;
//
//   final barHeight = 48.0 * 1.5;
//
//   late VideoPlayerController controller;
//   BoppoPlayerController? _boppoPlayerController;
//
//   // We know that _boppoPlayerController is set in didChangeDependencies
//   BoppoPlayerController get boppoPlayerController => _boppoPlayerController!;
//
//   @override
//   void initState() {
//     super.initState();
//     notifier = Provider.of<PlayerNotifier>(context, listen: false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_latestValue.hasError) {
//       return boppoPlayerController.errorBuilder?.call(
//             context,
//             boppoPlayerController.videoPlayerController.value.errorDescription!,
//           ) ??
//           const Center(
//             child: Icon(
//               Icons.error,
//               color: Colors.white,
//               size: 42,
//             ),
//           );
//     }
//
//     return MouseRegion(
//       onHover: (_) {
//         _cancelAndRestartTimer();
//       },
//       child: GestureDetector(
//         onTap: () => _cancelAndRestartTimer(),
//         child: AbsorbPointer(
//           absorbing: notifier.hideStuff,
//           child: Stack(
//             children: [
//               if (_latestValue.isBuffering)
//                 const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               else
//                 _buildHitArea(),
//               _buildActionBar(),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   if (_subtitleOn)
//                     Transform.translate(
//                       offset: Offset(0.0, notifier.hideStuff ? barHeight : 0.0),
//                       child: Center(
//                         child: _buildSubtitles(
//                             context, boppoPlayerController.subtitle!),
//                       ),
//                     ),
//                   _buildBottomBar(context),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _dispose();
//     super.dispose();
//   }
//
//   void _dispose() {
//     controller.removeListener(_updateState);
//     _hideTimer?.cancel();
//     _initTimer?.cancel();
//     _showAfterExpandCollapseTimer?.cancel();
//   }
//
//   @override
//   void didChangeDependencies() {
//     final _oldController = _boppoPlayerController;
//     _boppoPlayerController = BoppoPlayerController.of(context);
//     controller = boppoPlayerController.videoPlayerController;
//
//     if (_oldController != boppoPlayerController) {
//       _dispose();
//       _initialize();
//     }
//
//     super.didChangeDependencies();
//   }
//
//   Widget _buildActionBar() => SafeArea(
//         child: AnimatedOpacity(
//           opacity: notifier.hideStuff ? 0.0 : 1.0,
//           duration: const Duration(milliseconds: 250),
//           child: Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Row(
//               children: [
//                 _buildCloseIcon(),
//                 const Spacer(),
//                 // _buildSubtitleToggle(),
//                 if (_lockControls) _buildLockIcon(),
//                 // if (boppoPlayerController.showOptions) _buildOptionsButton(),
//               ],
//             ),
//           ),
//         ),
//       );
//
//   GestureDetector _buildCloseIcon() => GestureDetector(
//         onTap: _onClose,
//         child: Container(
//           height: barHeight,
//           decoration:
//               const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
//           padding: const EdgeInsets.only(left: 4.0, right: 4.0),
//           child: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//             // color: _subtitleOn ? Colors.white : Colors.grey[700],
//           ),
//         ),
//       );
//
//   Widget _buildOptionsButton() {
//     final options = <OptionItem>[
//       OptionItem(
//         onTap: () async {
//           Navigator.pop(context);
//           _onSpeedButtonTap();
//         },
//         iconData: Icons.speed,
//         title:
//             boppoPlayerController.optionsTranslation?.playbackSpeedButtonText ??
//                 'Playback speed',
//       )
//     ];
//
//     if (boppoPlayerController.subtitle != null &&
//         boppoPlayerController.subtitle!.isNotEmpty) {
//       options.add(
//         OptionItem(
//           onTap: () {
//             _onSubtitleTap();
//             Navigator.pop(context);
//           },
//           iconData: _subtitleOn
//               ? Icons.closed_caption
//               : Icons.closed_caption_off_outlined,
//           title:
//               boppoPlayerController.optionsTranslation?.subtitlesButtonText ??
//                   'Subtitles',
//         ),
//       );
//     }
//
//     if (boppoPlayerController.additionalOptions != null &&
//         boppoPlayerController.additionalOptions!(context).isNotEmpty) {
//       options.addAll(boppoPlayerController.additionalOptions!(context));
//     }
//
//     return AnimatedOpacity(
//       opacity: notifier.hideStuff ? 0.0 : 1.0,
//       duration: const Duration(milliseconds: 250),
//       child: IconButton(
//         onPressed: () async {
//           _hideTimer?.cancel();
//
//           if (boppoPlayerController.optionsBuilder != null) {
//             await boppoPlayerController.optionsBuilder!(context, options);
//           } else {
//             await showModalBottomSheet<OptionItem>(
//               context: context,
//               isScrollControlled: true,
//               useRootNavigator: boppoPlayerController.useRootNavigator,
//               builder: (context) => OptionsDialog(
//                 options: options,
//                 cancelButtonText:
//                     boppoPlayerController.optionsTranslation?.cancelButtonText,
//               ),
//             );
//           }
//
//           if (_latestValue.isPlaying) {
//             _startHideTimer();
//           }
//         },
//         icon: const Icon(
//           Icons.more_vert,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSubtitles(BuildContext context, Subtitles subtitles) {
//     if (!_subtitleOn) {
//       return Container();
//     }
//     final currentSubtitle = subtitles.getByPosition(_subtitlesPosition);
//     if (currentSubtitle.isEmpty) {
//       return Container();
//     }
//
//     if (boppoPlayerController.subtitleBuilder != null) {
//       return boppoPlayerController.subtitleBuilder!(
//         context,
//         currentSubtitle.first!.text,
//       );
//     }
//
//     return Container(
//       padding: (this._lockControls)
//           ? const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 12.0)
//           : const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
//       decoration: BoxDecoration(
//         color: const Color(0x96000000),
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Text(
//         currentSubtitle.first!.text.toString(),
//         style: const TextStyle(
//           fontSize: 18,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
//
//   Widget _buildBottomBar(BuildContext context) => Visibility(
//         visible: !_lockControls,
//         child: AnimatedOpacity(
//           opacity: notifier.hideStuff ? 0.0 : 1.0,
//           duration: const Duration(milliseconds: 300),
//           child: Container(
//             height:
//                 barHeight + (boppoPlayerController.isFullScreen ? 40.0 : 25),
//             padding: EdgeInsets.only(
//               left: 20,
//               right: 20,
//               bottom: !boppoPlayerController.isFullScreen ? 10.0 : 0,
//             ),
//             child: SafeArea(
//               bottom: boppoPlayerController.isFullScreen,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   if (!boppoPlayerController.isLive) _buildProgressBar(),
//                   // SizedBox(
//                   //   height: boppoPlayerController.isFullScreen ? 10.0 : 0,
//                   // ),
//                   Flexible(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         if (boppoPlayerController.isLive)
//                           const Expanded(child: Text('LIVE')),
//                         // else
//                         // _buildPosition(iconColor),
//                         if (boppoPlayerController.allowMuting)
//                           _buildMuteButton(controller),
//                         _buildSpeedButton(),
//                         if (!_lockControls) _buildLockIcon(),
//                         if (widget.hasNextButton) _buildNextButton(),
//                         _buildSubtitleToggle(),
//                         // const Spacer(),
//                         // if (boppoPlayerController.allowFullScreen)
//                         //   _buildExpandButton(),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: boppoPlayerController.isFullScreen ? 15.0 : 0,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//
//   bool _isMuted = false;
//   GestureDetector _buildMuteButton(
//     VideoPlayerController controller,
//   ) {
//     return GestureDetector(
//       onTap: () {
//         _cancelAndRestartTimer();
//
//         if (_latestValue.volume == 0) {
//           controller.setVolume(_latestVolume ?? 0.5);
//           setState(() => _isMuted = false);
//         } else {
//           _latestVolume = controller.value.volume;
//           controller.setVolume(0.0);
//           setState(() => _isMuted = true);
//         }
//       },
//       child: AnimatedOpacity(
//         opacity: notifier.hideStuff ? 0.0 : 1.0,
//         duration: const Duration(milliseconds: 300),
//         child: ClipRect(
//           child: Container(
//             height: barHeight,
//             padding: const EdgeInsets.only(left: 6.0, right: 6.0),
//             child: Row(
//               children: [
//                 Icon(
//                   _latestValue.volume > 0 ? Icons.volume_up : Icons.volume_off,
//                   color: Colors.white,
//                 ),
//                 if (boppoPlayerController.isFullScreen)
//                   const SizedBox(width: 5),
//                 if (boppoPlayerController.isFullScreen)
//                   Text(
//                     _isMuted ? 'Muted' : 'Volume',
//                     style:
//                         TextStyle(color: _isMuted ? Colors.grey : Colors.white),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   GestureDetector _buildExpandButton() {
//     return GestureDetector(
//       onTap: _onExpandCollapse,
//       child: AnimatedOpacity(
//         opacity: notifier.hideStuff ? 0.0 : 1.0,
//         duration: const Duration(milliseconds: 300),
//         child: Container(
//           height: barHeight + (boppoPlayerController.isFullScreen ? 15.0 : 0),
//           margin: const EdgeInsets.only(right: 12.0),
//           padding: const EdgeInsets.only(
//             left: 8.0,
//             right: 8.0,
//           ),
//           child: Center(
//             child: Icon(
//               boppoPlayerController.isFullScreen
//                   ? Icons.fullscreen_exit
//                   : Icons.fullscreen,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHitArea() {
//     final bool isFinished = _latestValue.position >= _latestValue.duration;
//     final bool showPlayButton =
//         widget.showPlayButton && !_dragging && !notifier.hideStuff;
//
//     return Visibility(
//       visible: !_lockControls,
//       child: GestureDetector(
//         onTap: () {
//           if (_latestValue.isPlaying) {
//             if (_displayTapped) {
//               setState(() {
//                 notifier.hideStuff = true;
//               });
//             } else {
//               _cancelAndRestartTimer();
//             }
//           } else {
//             _playPause();
//
//             setState(() {
//               notifier.hideStuff = true;
//             });
//           }
//         },
//         child: CenterControlButtons(
//           backgroundColor: Colors.black54,
//           iconColor: Colors.white,
//           isFinished: isFinished,
//           isPlaying: controller.value.isPlaying,
//           show: showPlayButton,
//           onPressed: _playPause,
//           onForward: _onForward,
//           onBackward: _onBackward,
//         ),
//       ),
//     );
//   }
//
//   double? chosenSpeed;
//   Future<void> _onSpeedButtonTap() async {
//     _hideTimer?.cancel();
//
//     chosenSpeed = await showModalBottomSheet<double>(
//       context: context,
//       isScrollControlled: true,
//       useRootNavigator: boppoPlayerController.useRootNavigator,
//       builder: (context) => PlaybackSpeedDialog(
//         speeds: boppoPlayerController.playbackSpeeds,
//         selected: _latestValue.playbackSpeed,
//       ),
//     );
//
//     if (chosenSpeed != null) {
//       controller.setPlaybackSpeed(chosenSpeed ?? 1.0);
//     }
//
//     if (_latestValue.isPlaying) {
//       _startHideTimer();
//     }
//     setState(() {}); // to update view with speed
//   }
//
//   Widget _buildPosition(Color? iconColor) {
//     final position = _latestValue.position;
//     final duration = _latestValue.duration;
//
//     return RichText(
//       text: TextSpan(
//         text: '${formatDuration(position)} ',
//         children: <InlineSpan>[
//           TextSpan(
//             text: '/ ${formatDuration(duration)}',
//             style: TextStyle(
//               fontSize: 14.0,
//               color: Colors.white.withOpacity(.75),
//               fontWeight: FontWeight.normal,
//             ),
//           )
//         ],
//         style: const TextStyle(
//           fontSize: 14.0,
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSubtitleToggle() {
//     //if don't have subtitle hiden button
//     if (boppoPlayerController.subtitle?.isEmpty ?? true) {
//       return Container();
//     }
//     return GestureDetector(
//       onTap: _onSubtitleTap,
//       child: Container(
//         height: barHeight,
//         color: Colors.transparent,
//         padding: const EdgeInsets.only(
//           left: 8.0,
//           right: 8.0,
//         ),
//         child: Row(
//           children: [
//             Icon(
//               _subtitleOn
//                   ? Icons.closed_caption
//                   : Icons.closed_caption_off_outlined,
//               color: _subtitleOn ? Colors.white : Colors.grey[700],
//             ),
//             if (boppoPlayerController.isFullScreen) const SizedBox(width: 5),
//             if (boppoPlayerController.isFullScreen)
//               Text(
//                 'Subtitle',
//                 style: TextStyle(color: Colors.white),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNextButton() => GestureDetector(
//         onTap: widget.playNext,
//         child: Container(
//           height: barHeight,
//           color: Colors.transparent,
//           padding: const EdgeInsets.only(
//             left: 8.0,
//             right: 8.0,
//           ),
//           child: Row(
//             children: [
//               Icon(
//                 Icons.skip_next,
//                 color: Colors.white,
//               ),
//               if (boppoPlayerController.isFullScreen) const SizedBox(width: 5),
//               if (boppoPlayerController.isFullScreen)
//                 Text(
//                   'Next',
//                   style: TextStyle(color: Colors.white),
//                 ),
//             ],
//           ),
//         ),
//       );
//
//   Widget _buildSpeedButton() => InkWell(
//         onTap: () async {
//           _onSpeedButtonTap();
//         },
//         child: Padding(
//           padding: const EdgeInsets.only(left: 6.0, right: 6.0),
//           child: Row(
//             children: [
//               Icon(
//                 Icons.speed,
//                 color: Colors.white,
//               ),
//               if (boppoPlayerController.isFullScreen) const SizedBox(width: 5),
//               if (boppoPlayerController.isFullScreen)
//                 Text(
//                   boppoPlayerController
//                           .optionsTranslation?.playbackSpeedButtonText ??
//                       'Speed (${chosenSpeed ?? 1.0}x)',
//                   style: TextStyle(color: Colors.white),
//                 ),
//             ],
//           ),
//         ),
//       );
//
//   Widget _buildLockIcon() => GestureDetector(
//         onTap: _onLockTap,
//         child: Container(
//           height: barHeight,
//           color: Colors.transparent,
//           padding: const EdgeInsets.only(
//             left: 12.0,
//             right: 12.0,
//           ),
//           child: Row(
//             children: [
//               Icon(
//                 (!_lockControls) ? Icons.lock_open : Icons.lock_rounded,
//                 color: Colors.white,
//                 // color: _subtitleOn ? Colors.white : Colors.grey[700],
//               ),
//               if (boppoPlayerController.isFullScreen && !_lockControls)
//                 const SizedBox(width: 5),
//               if (boppoPlayerController.isFullScreen && !_lockControls)
//                 Text(
//                   'Lock',
//                   style: TextStyle(color: Colors.white),
//                 ),
//             ],
//           ),
//         ),
//       );
//
//   void _onSubtitleTap() {
//     setState(() {
//       _subtitleOn = !_subtitleOn;
//     });
//   }
//
//   void _onLockTap() {
//     _cancelAndRestartTimer();
//     if (_lockControls) {
//       setState(() {
//         notifier.hideStuff = true;
//         _displayTapped = true;
//         _lockControls = !_lockControls;
//       });
//     } else {
//       setState(() {
//         notifier.hideStuff = false;
//         _displayTapped = true;
//         _lockControls = !_lockControls;
//       });
//     }
//   }
//
//   void _onClose() {
//     controller.pause();
//     Navigator.pop(context);
//     // Navigator.pop(context); // patch to close video
//   }
//
//   void _cancelAndRestartTimer() {
//     _hideTimer?.cancel();
//     _startHideTimer();
//
//     setState(() {
//       notifier.hideStuff = false;
//       _displayTapped = true;
//     });
//   }
//
//   Future<void> _initialize() async {
//     _subtitleOn = boppoPlayerController.subtitle?.isNotEmpty ?? false;
//     controller.addListener(_updateState);
//
//     _updateState();
//
//     if (controller.value.isPlaying || boppoPlayerController.autoPlay) {
//       _startHideTimer();
//     }
//
//     if (boppoPlayerController.showControlsOnInitialize) {
//       _initTimer = Timer(const Duration(milliseconds: 200), () {
//         setState(() {
//           notifier.hideStuff = false;
//         });
//       });
//     }
//   }
//
//   void _onExpandCollapse() {
//     setState(() {
//       notifier.hideStuff = true;
//
//       boppoPlayerController.toggleFullScreen();
//       _showAfterExpandCollapseTimer =
//           Timer(const Duration(milliseconds: 300), () {
//         setState(() {
//           _cancelAndRestartTimer();
//         });
//       });
//     });
//   }
//
//   void _playPause() {
//     final isFinished = _latestValue.position >= _latestValue.duration;
//
//     setState(() {
//       if (controller.value.isPlaying) {
//         notifier.hideStuff = false;
//         _hideTimer?.cancel();
//         controller.pause();
//       } else {
//         _cancelAndRestartTimer();
//
//         if (!controller.value.isInitialized) {
//           controller.initialize().then((_) {
//             controller.play();
//           });
//         } else {
//           if (isFinished) {
//             controller.seekTo(Duration.zero);
//           }
//           controller.play();
//         }
//       }
//     });
//   }
//
//   void _onForward() {
//     // final isFinished = _latestValue.position >= _latestValue.duration;
//     _cancelAndRestartTimer();
//     final end = _latestValue.duration.inMilliseconds;
//     final skip =
//         (_latestValue.position + const Duration(seconds: 10)).inMilliseconds;
//     controller.seekTo(Duration(milliseconds: min(skip, end)));
//     setState(() {});
//   }
//
//   void _onBackward() {
//     // final isFinished = _latestValue.position >= _latestValue.duration;
//
//     _cancelAndRestartTimer();
//     final beginning = const Duration().inMilliseconds;
//     final skip =
//         (_latestValue.position - const Duration(seconds: 10)).inMilliseconds;
//     controller.seekTo(Duration(milliseconds: max(skip, beginning)));
//     setState(() {});
//   }
//
//   void _startHideTimer() {
//     _hideTimer = Timer(const Duration(seconds: 3), () {
//       setState(() {
//         notifier.hideStuff = true;
//       });
//     });
//   }
//
//   void _updateState() {
//     if (!mounted) return;
//     setState(() {
//       _latestValue = controller.value;
//       _subtitlesPosition = controller.value.position;
//     });
//   }
//
//   Widget _buildProgressBar() => Flexible(
//         flex: 2,
//         child: ListTile(
//             tileColor: Colors.transparent,
//             contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
//             title: MaterialVideoProgressBar(
//               controller,
//               height: 30,
//               onDragStart: () {
//                 setState(() {
//                   _dragging = true;
//                 });
//
//                 _hideTimer?.cancel();
//               },
//               onDragEnd: () {
//                 setState(() {
//                   _dragging = false;
//                 });
//
//                 _startHideTimer();
//               },
//               colors: boppoPlayerController.materialProgressColors ??
//                   ProgressColors(
//                     playedColor: Theme.of(context).colorScheme.secondary,
//                     handleColor: Theme.of(context).colorScheme.secondary,
//                     // bufferedColor: Theme.of(context).backgroundColor.withOpacity(0.5),
//                     bufferedColor: Colors.grey,
//                     backgroundColor:
//                         Theme.of(context).disabledColor.withOpacity(.5),
//                   ),
//             ),
//             trailing:
//                 _buildPosition(Theme.of(context).textTheme.button!.color)),
//       );
// }
import 'dart:async';
import 'dart:math';

import 'package:boppo_stream/BoppoPlayer/src/helpers/utils.dart';
import 'package:boppo_stream/BoppoPlayer/src/notifiers/player_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../boppo_player.dart';
import '../center_control_buttons.dart';
import 'material_progress_bar.dart';
import 'widgets/options_dialog.dart';
import 'widgets/playback_speed_dialog.dart';

class MaterialControls extends StatefulWidget {
  const MaterialControls({
    this.showPlayButton = true,
    this.hasNextButton = false,
    this.playNext,
    Key? key,
  }) : super(key: key);

  final bool showPlayButton;
  final bool hasNextButton;
  final Function()? playNext;

  @override
  State<StatefulWidget> createState() => _MaterialControlsState();
}

class _MaterialControlsState extends State<MaterialControls>
    with SingleTickerProviderStateMixin {
  late PlayerNotifier notifier;
  late VideoPlayerValue _latestValue;
  double? _latestVolume;
  Timer? _hideTimer;
  Timer? _initTimer;
  late var _subtitlesPosition = Duration.zero;
  bool _subtitleOn = true;
  bool _lockControls = false;
  Timer? _showAfterExpandCollapseTimer;
  bool _dragging = false;
  bool _displayTapped = false;

  final barHeight = 48.0 * 1.5;

  late VideoPlayerController controller;
  BoppoPlayerController? _boppoPlayerController;

  // We know that _boppoPlayerController is set in didChangeDependencies
  BoppoPlayerController get boppoPlayerController => _boppoPlayerController!;

  @override
  void initState() {
    super.initState();
    notifier = Provider.of<PlayerNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    if (_latestValue.hasError) {
      return boppoPlayerController.errorBuilder?.call(
            context,
            boppoPlayerController.videoPlayerController.value.errorDescription!,
          ) ??
          const Center(
            child: Icon(
              Icons.error,
              color: Colors.white,
              size: 42,
            ),
          );
    }

    return MouseRegion(
      onHover: (_) {
        _cancelAndRestartTimer();
      },
      child: GestureDetector(
        onTap: () => _cancelAndRestartTimer(),
        child: AbsorbPointer(
          absorbing: notifier.hideStuff,
          child: Stack(
            children: [
              if (_latestValue.isBuffering)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
                _buildHitArea(),
              _buildActionBar(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  if (_subtitleOn)
                    Transform.translate(
                      offset: Offset(0.0, notifier.hideStuff ? barHeight : 0.0),
                      child: Center(
                        child: _buildSubtitles(
                            context, boppoPlayerController.subtitle!),
                      ),
                    ),
                  _buildBottomBar(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _dispose() {
    controller.removeListener(_updateState);
    _hideTimer?.cancel();
    _initTimer?.cancel();
    _showAfterExpandCollapseTimer?.cancel();
  }

  @override
  void didChangeDependencies() {
    final _oldController = _boppoPlayerController;
    _boppoPlayerController = BoppoPlayerController.of(context);
    controller = boppoPlayerController.videoPlayerController;

    if (_oldController != boppoPlayerController) {
      _dispose();
      _initialize();
    }

    super.didChangeDependencies();
  }

  Widget _buildActionBar() => SafeArea(
        child: AnimatedOpacity(
          opacity: notifier.hideStuff ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 250),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                _buildCloseIcon(),
                const Spacer(),
                // _buildSubtitleToggle(),
                if (_lockControls) _buildLockIcon(),
                // if (boppoPlayerController.showOptions) _buildOptionsButton(),
              ],
            ),
          ),
        ),
      );

  GestureDetector _buildCloseIcon() => GestureDetector(
        onTap: _onClose,
        child: Container(
          height: barHeight,
          decoration:
              const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            // color: _subtitleOn ? Colors.white : Colors.grey[700],
          ),
        ),
      );

  Widget _buildOptionsButton() {
    final options = <OptionItem>[
      OptionItem(
        onTap: () async {
          Navigator.pop(context);
          _onSpeedButtonTap();
        },
        iconData: Icons.speed,
        title:
            boppoPlayerController.optionsTranslation?.playbackSpeedButtonText ??
                'Playback speed',
      )
    ];

    if (boppoPlayerController.subtitle != null &&
        boppoPlayerController.subtitle!.isNotEmpty) {
      options.add(
        OptionItem(
          onTap: () {
            _onSubtitleTap();
            Navigator.pop(context);
          },
          iconData: _subtitleOn
              ? Icons.closed_caption
              : Icons.closed_caption_off_outlined,
          title:
              boppoPlayerController.optionsTranslation?.subtitlesButtonText ??
                  'Subtitles',
        ),
      );
    }

    if (boppoPlayerController.additionalOptions != null &&
        boppoPlayerController.additionalOptions!(context).isNotEmpty) {
      options.addAll(boppoPlayerController.additionalOptions!(context));
    }

    return AnimatedOpacity(
      opacity: notifier.hideStuff ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 250),
      child: IconButton(
        onPressed: () async {
          _hideTimer?.cancel();

          if (boppoPlayerController.optionsBuilder != null) {
            await boppoPlayerController.optionsBuilder!(context, options);
          } else {
            await showModalBottomSheet<OptionItem>(
              context: context,
              isScrollControlled: true,
              useRootNavigator: boppoPlayerController.useRootNavigator,
              builder: (context) => OptionsDialog(
                options: options,
                cancelButtonText:
                    boppoPlayerController.optionsTranslation?.cancelButtonText,
              ),
            );
          }

          if (_latestValue.isPlaying) {
            _startHideTimer();
          }
        },
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSubtitles(BuildContext context, Subtitles subtitles) {
    if (_subtitleOn) {
      return Container();
    }
    final currentSubtitle = subtitles.getByPosition(_subtitlesPosition);
    // if (currentSubtitle.isEmpty) {
    //   return Container();
    // }

    if (boppoPlayerController.subtitleBuilder != null) {
      return boppoPlayerController.subtitleBuilder!(
        context,
        currentSubtitle.first!.text,
      );
    }

    return Container(
      padding: (this._lockControls)
          ? const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 12.0)
          : const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
      decoration: BoxDecoration(
        color: const Color(0x96000000),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        currentSubtitle.first!.text.toString(),
        style: const TextStyle(
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) => Visibility(
        visible: !_lockControls,
        child: AnimatedOpacity(
          opacity: notifier.hideStuff ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: Container(
            height:
                barHeight + (boppoPlayerController.isFullScreen ? 40.0 : 25),
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: !boppoPlayerController.isFullScreen ? 10.0 : 0,
            ),
            child: SafeArea(
              bottom: boppoPlayerController.isFullScreen,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (!boppoPlayerController.isLive) _buildProgressBar(),
                  // SizedBox(
                  //   height: boppoPlayerController.isFullScreen ? 10.0 : 0,
                  // ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        if (boppoPlayerController.isLive)
                          const Expanded(child: Text('LIVE')),
                        // else
                        // _buildPosition(iconColor),
                        if (boppoPlayerController.allowMuting)
                          _buildMuteButton(controller),
                        _buildSpeedButton(),
                        if (!_lockControls) _buildLockIcon(),
                        _buildSubtitleToggle(),
                        if (widget.hasNextButton) _buildNextButton(),

                        // const Spacer(),
                        // if (boppoPlayerController.allowFullScreen)
                        //   _buildExpandButton(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: boppoPlayerController.isFullScreen ? 15.0 : 0,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  bool _isMuted = false;
  GestureDetector _buildMuteButton(
    VideoPlayerController controller,
  ) {
    return GestureDetector(
      onTap: () {
        _cancelAndRestartTimer();

        if (_latestValue.volume == 0) {
          controller.setVolume(_latestVolume ?? 0.5);
          setState(() => _isMuted = false);
        } else {
          _latestVolume = controller.value.volume;
          controller.setVolume(0.0);
          setState(() => _isMuted = true);
        }
      },
      child: AnimatedOpacity(
        opacity: notifier.hideStuff ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: ClipRect(
          child: Container(
            height: barHeight,
            padding: const EdgeInsets.only(left: 6.0, right: 6.0),
            child: Row(
              children: [
                Icon(
                  _latestValue.volume > 0 ? Icons.volume_up : Icons.volume_off,
                  color: Colors.white,
                ),
                if (boppoPlayerController.isFullScreen)
                  const SizedBox(width: 5),
                if (boppoPlayerController.isFullScreen)
                  Text(
                    _isMuted ? 'Muted' : 'Volume',
                    style:
                        TextStyle(color: _isMuted ? Colors.grey : Colors.white),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _buildExpandButton() {
    return GestureDetector(
      onTap: _onExpandCollapse,
      child: AnimatedOpacity(
        opacity: notifier.hideStuff ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: Container(
          height: barHeight + (boppoPlayerController.isFullScreen ? 15.0 : 0),
          margin: const EdgeInsets.only(right: 12.0),
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
          ),
          child: Center(
            child: Icon(
              boppoPlayerController.isFullScreen
                  ? Icons.fullscreen_exit
                  : Icons.fullscreen,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHitArea() {
    final bool isFinished = _latestValue.position >= _latestValue.duration;
    final bool showPlayButton =
        widget.showPlayButton && !_dragging && !notifier.hideStuff;

    return Visibility(
      visible: !_lockControls,
      child: GestureDetector(
        onTap: () {
          if (_latestValue.isPlaying) {
            if (_displayTapped) {
              setState(() {
                notifier.hideStuff = true;
              });
            } else {
              _cancelAndRestartTimer();
            }
          } else {
            _playPause();

            setState(() {
              notifier.hideStuff = true;
            });
          }
        },
        child: CenterControlButtons(
          backgroundColor: Colors.black54,
          iconColor: Colors.white,
          isFinished: isFinished,
          isPlaying: controller.value.isPlaying,
          show: showPlayButton,
          onPressed: _playPause,
          onForward: _onForward,
          onBackward: _onBackward,
        ),
      ),
    );
  }

  double? chosenSpeed;
  Future<void> _onSpeedButtonTap() async {
    _hideTimer?.cancel();

    chosenSpeed = await showModalBottomSheet<double>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: boppoPlayerController.useRootNavigator,
      builder: (context) => PlaybackSpeedDialog(
        speeds: boppoPlayerController.playbackSpeeds,
        selected: _latestValue.playbackSpeed,
      ),
    );

    if (chosenSpeed != null) {
      controller.setPlaybackSpeed(chosenSpeed ?? 1.0);
    }

    if (_latestValue.isPlaying) {
      _startHideTimer();
    }
    setState(() {}); // to update view with speed
  }

  Widget _buildPosition(Color? iconColor) {
    final position = _latestValue.position;
    final duration = _latestValue.duration;

    return RichText(
      text: TextSpan(
        text: '${formatDuration(position)} ',
        children: <InlineSpan>[
          TextSpan(
            text: '/ ${formatDuration(duration)}',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white.withOpacity(.75),
              fontWeight: FontWeight.normal,
            ),
          )
        ],
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSubtitleToggle() {
    //if don't have subtitle hiden button
    if (boppoPlayerController.subtitle?.isEmpty ?? false) {
      return Container();
    }
    return GestureDetector(
      onTap: _onSubtitleTap,
      child: Container(
        height: barHeight,
        color: Colors.transparent,
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
        ),
        child: Row(
          children: [
            Icon(
              _subtitleOn
                  ? Icons.closed_caption
                  : Icons.closed_caption_off_outlined,
              color: _subtitleOn ? Colors.white : Colors.grey[700],
            ),
            if (boppoPlayerController.isFullScreen) const SizedBox(width: 5),
            if (boppoPlayerController.isFullScreen)
              Text(
                'Subtitle',
                style: TextStyle(color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() => GestureDetector(
        onTap: widget.playNext,
        child: Container(
          height: barHeight,
          color: Colors.transparent,
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
          ),
          child: Row(
            children: [
              Icon(
                Icons.skip_next,
                color: Colors.white,
              ),
              if (boppoPlayerController.isFullScreen) const SizedBox(width: 5),
              if (boppoPlayerController.isFullScreen)
                Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
            ],
          ),
        ),
      );

  Widget _buildSpeedButton() => InkWell(
        onTap: () async {
          _onSpeedButtonTap();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 6.0, right: 6.0),
          child: Row(
            children: [
              Icon(
                Icons.speed,
                color: Colors.white,
              ),
              if (boppoPlayerController.isFullScreen) const SizedBox(width: 5),
              if (boppoPlayerController.isFullScreen)
                Text(
                  boppoPlayerController
                          .optionsTranslation?.playbackSpeedButtonText ??
                      'Speed (${chosenSpeed ?? 1.0}x)',
                  style: TextStyle(color: Colors.white),
                ),
            ],
          ),
        ),
      );

  Widget _buildLockIcon() => GestureDetector(
        onTap: _onLockTap,
        child: Container(
          height: barHeight,
          color: Colors.transparent,
          padding: const EdgeInsets.only(
            left: 12.0,
            right: 12.0,
          ),
          child: Row(
            children: [
              Icon(
                (!_lockControls) ? Icons.lock_open : Icons.lock_rounded,
                color: Colors.white,
                // color: _subtitleOn ? Colors.white : Colors.grey[700],
              ),
              if (boppoPlayerController.isFullScreen && !_lockControls)
                const SizedBox(width: 5),
              if (boppoPlayerController.isFullScreen && !_lockControls)
                Text(
                  'Lock',
                  style: TextStyle(color: Colors.white),
                ),
            ],
          ),
        ),
      );

  void _onSubtitleTap() {
    setState(() {
      _subtitleOn = _subtitleOn;
    });
  }

  void _nextEoisode() {
    setState(() {});
  }

  void _onLockTap() {
    _cancelAndRestartTimer();
    if (_lockControls) {
      setState(() {
        notifier.hideStuff = true;
        _displayTapped = true;
        _lockControls = !_lockControls;
      });
    } else {
      setState(() {
        notifier.hideStuff = false;
        _displayTapped = true;
        _lockControls = !_lockControls;
      });
    }
  }

  void _onClose() {
    controller.pause();
    Navigator.pop(context);
    // Navigator.pop(context); // patch to close video
  }

  void _cancelAndRestartTimer() {
    _hideTimer?.cancel();
    _startHideTimer();

    setState(() {
      notifier.hideStuff = false;
      _displayTapped = true;
    });
  }

  Future<void> _initialize() async {
    _subtitleOn = boppoPlayerController.subtitle?.isNotEmpty ?? false;
    controller.addListener(_updateState);

    _updateState();

    if (controller.value.isPlaying || boppoPlayerController.autoPlay) {
      _startHideTimer();
    }

    if (boppoPlayerController.showControlsOnInitialize) {
      _initTimer = Timer(const Duration(milliseconds: 200), () {
        setState(() {
          notifier.hideStuff = false;
        });
      });
    }
  }

  void _onExpandCollapse() {
    setState(() {
      notifier.hideStuff = true;

      boppoPlayerController.toggleFullScreen();
      _showAfterExpandCollapseTimer =
          Timer(const Duration(milliseconds: 300), () {
        setState(() {
          _cancelAndRestartTimer();
        });
      });
    });
  }

  void _playPause() {
    final isFinished = _latestValue.position >= _latestValue.duration;

    setState(() {
      if (controller.value.isPlaying) {
        notifier.hideStuff = false;
        _hideTimer?.cancel();
        controller.pause();
      } else {
        _cancelAndRestartTimer();

        if (!controller.value.isInitialized) {
          controller.initialize().then((_) {
            controller.play();
          });
        } else {
          if (isFinished) {
            controller.seekTo(Duration.zero);
          }
          controller.play();
        }
      }
    });
  }

  void _onForward() {
    // final isFinished = _latestValue.position >= _latestValue.duration;
    _cancelAndRestartTimer();
    final end = _latestValue.duration.inMilliseconds;
    final skip =
        (_latestValue.position + const Duration(seconds: 10)).inMilliseconds;
    controller.seekTo(Duration(milliseconds: min(skip, end)));
    setState(() {});
  }

  void _onBackward() {
    // final isFinished = _latestValue.position >= _latestValue.duration;

    _cancelAndRestartTimer();
    final beginning = const Duration().inMilliseconds;
    final skip =
        (_latestValue.position - const Duration(seconds: 10)).inMilliseconds;
    controller.seekTo(Duration(milliseconds: max(skip, beginning)));
    setState(() {});
  }

  void _startHideTimer() {
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        notifier.hideStuff = true;
      });
    });
  }

  void _updateState() {
    if (!mounted) return;
    setState(() {
      _latestValue = controller.value;
      _subtitlesPosition = controller.value.position;
    });
  }

  Widget _buildProgressBar() => Flexible(
        flex: 2,
        child: ListTile(
            leading: _buildPosition(Theme.of(context).textTheme.button!.color),
            tileColor: Colors.transparent,
            contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
            title: MaterialVideoProgressBar(
              controller,
              height: 30,
              onDragStart: () {
                setState(() {
                  _dragging = true;
                });

                _hideTimer?.cancel();
              },
              onDragEnd: () {
                setState(() {
                  _dragging = false;
                });

                _startHideTimer();
              },
              colors: boppoPlayerController.materialProgressColors ??
                  ProgressColors(
                    playedColor: Theme.of(context).colorScheme.secondary,
                    handleColor: Theme.of(context).colorScheme.secondary,
                    // bufferedColor: Theme.of(context).backgroundColor.withOpacity(0.5),
                    bufferedColor: Colors.grey,
                    backgroundColor:
                        Theme.of(context).disabledColor.withOpacity(.5),
                  ),
            ),
            trailing:
                _buildPosition(Theme.of(context).textTheme.button!.color)),
      );
}
