import 'package:dghub_video_player/dghub_video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerConfig {
  final String autoLoad;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Map<String, String> httpHeaders;
  final double width;
  final double height;
  final bool enabledCacheMode;
  final bool enabledControl;
  final bool enabledFullScreenButton;
  final bool enabledRotateButton;
  final bool enabledFitButton;
  final bool enabledSubtitleButton;
  final BoxFit fit;
  final bool enabledMuteButton;
  final bool enabledVolume;
  final bool enabledProtectMode;
  final bool enabledAutoPlay;
  final bool enabledLooping;
  final String? title;
  final List<SubtitleModel> subtitles;
  final double subtitleFontSize;
  final bool isLiveMode;
  final Widget? watermark;
  final String? movingText;
  final double movingTextSize;
  final double movingTextSpeed;
  final Color movingTextColor;
  final Function()? onBack;
  const VideoPlayerConfig(
      {this.loadingWidget,
      this.errorWidget,
      this.httpHeaders = const <String, String>{},
      required this.autoLoad,
      required this.height,
      required this.width,
      this.enabledCacheMode = false,
      this.enabledControl = true,
      this.enabledFullScreenButton = false,
      this.enabledFitButton = true,
      this.enabledRotateButton = true,
      this.enabledMuteButton = true,
      this.enabledVolume = true,
      this.fit = BoxFit.cover,
      this.enabledProtectMode = false,
      this.enabledAutoPlay = true,
      this.enabledLooping = true,
      this.isLiveMode = false,
      this.title,
      this.subtitles = const [],
      this.onBack,
      this.watermark,
      this.movingText,
      this.movingTextSize = 10,
      this.movingTextSpeed = 2,
      this.movingTextColor = Colors.white,
      this.enabledSubtitleButton = true,
      this.subtitleFontSize = 14});
}
