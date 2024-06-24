import 'package:dghub_video_player/src/model/player_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../dghub_video_player.dart';

class DGHubFullScreenVideoPlayer extends StatefulWidget {
  final VideoPlayerConfig config;
  final VideoPlayerController controller;
  const DGHubFullScreenVideoPlayer(
      {required this.config, required this.controller, super.key});

  @override
  State<DGHubFullScreenVideoPlayer> createState() =>
      _DGHubFullScreenVideoPlayerState();
}

class _DGHubFullScreenVideoPlayerState
    extends State<DGHubFullScreenVideoPlayer> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DGHubVideoPlayer(
        isFullScreen: true,
        config: widget.config,
        controller: widget.controller,
      ),
    );
  }
}
