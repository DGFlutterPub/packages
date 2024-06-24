import 'dart:io';

import 'package:dghub_video_player/src/model/player_config.dart';
import 'package:dghub_video_player/src/widgets/loading.dart';
import 'package:dghub_video_player/src/widgets/moving_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:screen_protector/screen_protector.dart';
import 'package:subtitle_wrapper_package/subtitle_wrapper_package.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'widgets/video_control_widget.dart';

class DGHubVideoPlayer extends StatefulWidget {
  final VideoPlayerConfig config;
  final bool isFullScreen;
  final VideoPlayerController? controller;
  const DGHubVideoPlayer(
      {this.isFullScreen = false,
      this.controller,
      required this.config,
      super.key});

  @override
  State<DGHubVideoPlayer> createState() => _DGHubVideoPlayerState();
}

class _DGHubVideoPlayerState extends State<DGHubVideoPlayer> {
  VideoPlayerController? controller;
  SubtitleController subtitleController = SubtitleController();
  BoxFit fit = BoxFit.fill;
  bool isControlVisable = false;
  bool enabledSubtitleButton = false;
  bool showSubtitle = true;

  subStr(int a, int b) {
    try {
      return widget.config.autoLoad.substring(a, b);
    } catch (e) {
      return 'N';
    }
  }

  protect() async {
    if (widget.config.enabledProtectMode) {
      if (!kIsWeb) {
        if (Platform.isIOS) {
          await ScreenProtector.preventScreenshotOn();
          final isRecording = await ScreenProtector.isRecording();
          if (isRecording) {
            exit(0);
          }
        }
        if (Platform.isAndroid) {
          await ScreenProtector.protectDataLeakageOn();
          await ScreenProtector.preventScreenshotOn();
        }
      }
    } else {
      protectDisable();
    }
  }

  protectDisable() async {
    if (!kIsWeb) {
      if (Platform.isIOS) {
        await ScreenProtector.preventScreenshotOff();
      }
      if (Platform.isAndroid) {
        await ScreenProtector.protectDataLeakageOff();
        await ScreenProtector.preventScreenshotOff();
      }
    }
  }

  initPlay() async {
    protect();
    VideoPlayerOptions videoPlayerOption =
        VideoPlayerOptions(allowBackgroundPlayback: true, mixWithOthers: true);

    if (widget.config.autoLoad.contains('http://') ||
        widget.config.autoLoad.contains('https://')) {
      print('Video play with url');
      controller = VideoPlayerController.networkUrl(
          Uri.parse(
            widget.config.autoLoad,
          ),
          videoPlayerOptions: videoPlayerOption,
          httpHeaders: widget.config.httpHeaders);
    } else if (await File(widget.config.autoLoad).exists()) {
      print('Video play with file');
      controller = VideoPlayerController.file(File(widget.config.autoLoad),
          videoPlayerOptions: videoPlayerOption,
          httpHeaders: widget.config.httpHeaders);
    } else if (subStr(0, 6) == 'assets') {
      controller = VideoPlayerController.asset(
        widget.config.autoLoad,
        videoPlayerOptions: videoPlayerOption,
      );
    } else {
      controller = VideoPlayerController.networkUrl(
          Uri.parse(
            widget.config.autoLoad,
          ),
          videoPlayerOptions: videoPlayerOption,
          httpHeaders: widget.config.httpHeaders);
    }

    if (controller != null) {
      controller!.initialize().then((value) {
        if (widget.config.enabledVolume) {
          controller!.setVolume(1);
        } else {
          controller!.setVolume(0);
        }
        if (widget.config.subtitles.isNotEmpty) {
          enabledSubtitleButton = true;
        } else {
          enabledSubtitleButton = false;
        }
        controller!.play();
        setState(() {});
      });
    }
  }

  @override
  void initState() {
    WakelockPlus.enable();
    if (widget.isFullScreen) {
      controller = widget.controller;
    } else {
      initPlay();
    }

    if (widget.config.subtitles.isNotEmpty) {
      subtitleController = SubtitleController(
        subtitleUrl: widget.config.subtitles[0].url,
        subtitleType: SubtitleType.webvtt,
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    if (!widget.isFullScreen && controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return widget.config.loadingWidget ??
          Container(
              alignment: Alignment.center,
              color: Colors.black,
              width: widget.config.width,
              height: widget.config.height,
              child: const Loading());
    }
    var width = widget.isFullScreen
        ? MediaQuery.sizeOf(context).width
        : widget.config.width;
    var height = widget.isFullScreen
        ? MediaQuery.sizeOf(context).height
        : widget.config.height;
    return Container(
      color: Colors.black,
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SubtitleWrapper(
            videoPlayerController: controller!,
            subtitleStyle: SubtitleStyle(
                position: SubtitlePosition(bottom: 15),
                fontSize: showSubtitle ? widget.config.subtitleFontSize : 0,
                hasBorder: true,
                textColor: Colors.white,
                borderStyle:
                    SubtitleBorderStyle(strokeWidth: 5, color: Colors.black)),
            subtitleController: subtitleController,
            videoChild: ClipRect(
              child: SizedBox(
                width: width,
                height: height,
                child: FittedBox(
                  fit: fit,
                  child: SizedBox(
                    width: controller!.value.size.width,
                    height: controller!.value.size.height,
                    child: VideoPlayer(controller!),
                  ),
                ),
              ),
            ),
          ),
          /*IgnorePointer(
            child: SubtitleView(
              text: subtitle,
              subtitleStyle: SubtitleStyle(
                fontSize: 12,
              ),
            ),
          ),*/
          if (widget.config.movingText != null)
            MovingText(
              labelColor: widget.config.movingTextColor,
              ballRad: 1,
              width: width,
              height: height,
              label: widget.config.movingText!,
              labelSize: 14,
            ),
          if (widget.config.watermark != null) widget.config.watermark!,
          VideoControlWidget(
            isFullScreen: widget.isFullScreen,
            config: widget.config,
            subtitleController: subtitleController,
            controller: controller!,
            onSubtitle: (s) {
              showSubtitle = s;
              setState(() {});
            },
            onFit: (f) {
              fit = f;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
