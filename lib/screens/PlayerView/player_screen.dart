import 'package:boppo_stream/BoppoPlayer/boppo_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key, required this.videoList}) : super(key: key);

  final List<String> videoList;

  @override
  State<StatefulWidget> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  BoppoPlayerController? _boppoPlayerController;
  bool fullScreenByDefault = true;
  int _currentVideo = 0;

  Future<bool> _forcePortrait() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return false;
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    _forcePortrait();
    _videoPlayerController.dispose();
    _boppoPlayerController?.dispose();
    super.dispose();
  }
  // @override
  // void didUpdateWidget(covariant ChannelVideoPlayerScreen oldWidget) {
  //   if (!oldWidget.stopVideo) {
  //     _initializeVideoPlayerFuture = _videoPlayerController.pause();
  //     _videoPlayerController.pause();
  //     _videoPlayerController.dispose();
  //     super.didUpdateWidget(oldWidget);
  //   }
  // }

  // @override
  // void didUpdateWidget(PlayerScreen oldWidget) {
  //   if (oldWidget.play != widget.play) {
  //     if (widget.play) {
  //       _videoPlayerController.play();
  //       _videoPlayerController.setLooping(true);
  //     } else {
  //       _controller.pause();
  //     }
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  void didChangeDependencies() {
    _initializePlayer();
    super.didChangeDependencies();
  }

  Future<void> _initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.network(widget.videoList[_currentVideo]);

    print('widget.videoUrl ${widget.videoList}');
    await Future.wait([
      _videoPlayerController.initialize(),
    ]);
    _createBoppoPlayerController();
    setState(() {});
  }

  void _createBoppoPlayerController() {
    final subtitles = [
      Subtitle(
        index: 0,
        start: Duration.zero,
        end: const Duration(seconds: 10),
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Hello',
              style: TextStyle(color: Colors.red, fontSize: 22),
            ),
            TextSpan(
              text: ' from ',
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
            TextSpan(
              text: 'subtitles',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            )
          ],
        ),
      ),
      Subtitle(
        index: 0,
        start: const Duration(seconds: 10),
        end: const Duration(seconds: 20),
        text: 'Whats up? :)',
        // text: const TextSpan(
        //   text: 'Whats up? :)',
        //   style: TextStyle(color: Colors.amber, fontSize: 22, fontStyle: FontStyle.italic),
        // ),
      ),
    ];

    _boppoPlayerController = BoppoPlayerController(
      videoPlayerController: _videoPlayerController,
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
      ],
      hasNextButton: true,
      playNext: () {
        setState(() {
          _currentVideo++;
        });
        if (widget.videoList.length - 1 > _currentVideo) _initializePlayer();
        print('_currentVideo $_currentVideo');
      },
      autoPlay: true,
      looping: false,
      fullScreenByDefault: true,
      allowedScreenSleep: false,
      // aspectRatio: 16 / 9,
      // additionalOptions: (context) {
      //   return <OptionItem>[
      //     OptionItem(
      //       onTap: toggleVideo,
      //       iconData: Icons.live_tv_sharp,
      //       title: 'Toggle Video Src',
      //     ),
      //   ];
      // },
      // subtitle: Subtitles(subtitles),
      // subtitleBuilder: (context, dynamic subtitle) => Container(
      //   padding: const EdgeInsets.all(10.0),
      //   child: subtitle is InlineSpan
      //       ? RichText(
      //           text: subtitle,
      //         )
      //       : Text(
      //           subtitle.toString(),
      //           style: const TextStyle(color: Colors.black),
      //         ),
      // ),

      //Try playing around with some of these other options:

      materialProgressColors: ProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.white,
        bufferedColor: const Color.fromRGBO(200, 200, 200, 0.5),
        backgroundColor: const Color.fromRGBO(200, 200, 200, 0.2),
      ),
      placeholder: Container(
        color: Colors.grey,
      ),
      autoInitialize: true,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: Center(
          child: _boppoPlayerController != null &&
                  _boppoPlayerController!
                      .videoPlayerController.value.isInitialized
              ? BoppoPlayer(controller: _boppoPlayerController!)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 20),
                    Text('Loading'),
                  ],
                ),
        ),
      );
}
