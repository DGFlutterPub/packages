import 'dart:async';

import 'package:dghub_video_player/dghub_video_player.dart';
import 'package:dghub_video_player/src/dghub_full_screen_video_player.dart';
import 'package:dghub_video_player/src/model/player_config.dart';
import 'package:dghub_video_player/src/tools/tools.dart';
import 'package:dghub_video_player/src/widgets/dg_icon_button.dart';
import 'package:dghub_video_player/src/widgets/dg_text.dart';
import 'package:dghub_video_player/src/widgets/loading.dart';
import 'package:dghub_video_player/src/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subtitle_wrapper_package/subtitle_wrapper_package.dart';
import 'package:video_player/video_player.dart';

class VideoControlWidget extends StatefulWidget {
  final VideoPlayerController controller;
  final SubtitleController subtitleController;
  final VideoPlayerConfig config;
  final Function(bool) onSubtitle;
  final Function(BoxFit) onFit;
  final bool isFullScreen;
  const VideoControlWidget(
      {required this.controller,
      required this.subtitleController,
      required this.config,
      required this.onFit,
      required this.onSubtitle,
      required this.isFullScreen,
      super.key});

  @override
  State<VideoControlWidget> createState() => _VideoControlWidgetState();
}

class _VideoControlWidgetState extends State<VideoControlWidget> {
  BoxFit fit = BoxFit.cover;
  double progressValue = 0;
  double fontSize = 13;
  bool showSubtitle = true;
  bool showControl = false;
  bool showSubtitleChanger = false;
  bool isPortrait = false;

  late Timer timer;
  @override
  void initState() {
    /*timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (widget.controller.value.isPlaying && showControl) {
        setState(() {
          showControl = false;
        });
      }
    });*/

    super.initState();
  }

  @override
  void dispose() {
    // timer.cancel();
    super.dispose();
  }

  void pushFullScreenVideo() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => DGHubFullScreenVideoPlayer(
                config: widget.config, controller: widget.controller)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    getVideoPosition() {
      var duration = Duration(
          milliseconds:
              widget.controller.value.position.inMilliseconds.round());
      return [duration.inMinutes, duration.inSeconds]
          .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
          .join(':');
    }

    getVideoTotalPosition() {
      var duration = Duration(
          milliseconds:
              widget.controller.value.duration.inMilliseconds.round());
      return [duration.inMinutes, duration.inSeconds]
          .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
          .join(':');
    }

    int maxBuffering = 0;
    for (DurationRange range in widget.controller.value.buffered) {
      final int end = range.end.inMilliseconds;
      if (end > maxBuffering) {
        maxBuffering = end;
      }
    }

    return ValueListenableBuilder<VideoPlayerValue>(
        valueListenable: widget.controller,
        builder: (_, videoPlayerValue, __) {
          return Stack(
            children: [
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    showControl = true;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    child:
                        videoPlayerValue.isBuffering ? const Loading() : null,
                  )),
              if (showControl)
                GestureDetector(
                  onTap: () {
                    showControl = false;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black.withOpacity(0.5)
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (widget.config.onBack != null)
                                  DGIconButton(
                                      icon: Icons.arrow_back,
                                      onTap: () {
                                        widget.config.onBack!();
                                      }),
                                if (widget.config.title != null)
                                  Expanded(
                                    child: DGText(
                                      label: widget.config.title!,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  )
                                else
                                  const Spacer(),
                                DGIconButton(
                                    icon: Icons.screen_rotation_rounded,
                                    onTap: () {
                                      if (Tools.isPortrait(context)) {
                                        SystemChrome.setPreferredOrientations([
                                          DeviceOrientation.landscapeLeft,
                                          DeviceOrientation.landscapeRight,
                                        ]);
                                      } else {
                                        SystemChrome.setPreferredOrientations([
                                          DeviceOrientation.portraitDown,
                                          DeviceOrientation.portraitUp,
                                        ]);
                                      }
                                    }),
                                DGIconButton(
                                    icon: Icons.more_horiz,
                                    onTap: () {
                                      widget.config.onBack!();
                                    }),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(child: Container()),
                              if (videoPlayerValue.isBuffering)
                                const Loading()
                              else if (videoPlayerValue.isPlaying)
                                DGIconButton(
                                    padding: EdgeInsets.all(30),
                                    icon: Icons.pause_rounded,
                                    onTap: () {
                                      widget.controller.pause();
                                      setState(() {});
                                    })
                              else
                                DGIconButton(
                                    padding: EdgeInsets.all(30),
                                    icon: Icons.play_arrow_outlined,
                                    onTap: () {
                                      widget.controller.play();
                                      setState(() {});
                                    }),
                              Expanded(child: Container()),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Wrap(
                            children: [
                              if (!widget.config.isLiveMode)
                                Container(
                                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  height: 10,
                                  child: VideoProgressBar(widget.controller,
                                      barHeight: 8,
                                      handleHeight: 8,
                                      drawShadow: true),
                                ),
                              /* Slider(
                                activeColor: Colors.white,
                                inactiveColor: Colors.grey.withOpacity(0.5),
                                onChangeStart: (_) => widget.controller.pause(),
                                onChangeEnd: (_) => widget.controller.play(),
                                onChanged: (value) {
                                  widget.controller.seekTo(
                                      Duration(milliseconds: value.toInt()));
                                },
                                value: videoPlayerValue.position.inMilliseconds
                                    .toDouble(),
                                min: 0,
                                max: videoPlayerValue.duration.inMilliseconds
                                    .toDouble(),
                              ),*/

                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (widget.config.isLiveMode)
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        width: 10,
                                        height: 10,
                                      ),
                                    if (widget.config.isLiveMode)
                                      SizedBox(
                                        width: 5,
                                      ),
                                    Expanded(
                                      child: DGText(
                                        label: widget.config.isLiveMode
                                            ? 'LIVE'
                                            : '${getVideoPosition()} / ${getVideoTotalPosition()}',
                                        color: Colors.white,
                                        size: 10,
                                      ),
                                    ),
                                    if (widget.config.enabledSubtitleButton)
                                      if (widget.config.subtitles.isNotEmpty)
                                        GestureDetector(
                                          onLongPress: () {
                                            showSubtitleChanger = true;
                                            setState(() {});
                                          },
                                          child: DGIconButton(
                                              color: showSubtitle
                                                  ? Colors.white
                                                  : Colors.white
                                                      .withOpacity(0.5),
                                              icon: showSubtitle
                                                  ? Icons.subtitles_outlined
                                                  : Icons
                                                      .subtitles_off_outlined,
                                              onTap: () {
                                                showSubtitle = !showSubtitle;
                                                widget.onSubtitle(showSubtitle);
                                              }),
                                        ),
                                    if (widget.config.enabledFitButton)
                                      DGIconButton(
                                          icon: Icons.fit_screen_outlined,
                                          onTap: () {
                                            switch (fit) {
                                              case BoxFit.contain:
                                                fit = BoxFit.fill;

                                              case BoxFit.fill:
                                                fit = BoxFit.cover;

                                              case BoxFit.cover:
                                                fit = BoxFit.contain;

                                                break;
                                              default:
                                            }
                                            widget.onFit(fit);
                                            setState(() {});
                                          }),
                                    if (widget.config.enabledFullScreenButton)
                                      DGIconButton(
                                          icon: widget.isFullScreen
                                              ? Icons.fullscreen_exit
                                              : Icons.fullscreen,
                                          onTap: () {
                                            if (widget.isFullScreen) {
                                              Navigator.pop(context);
                                            } else {
                                              pushFullScreenVideo();
                                            }
                                          }),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (showSubtitleChanger)
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: theme.cardColor,
                    height: widget.config.height,
                    width: 200,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "Subtitle settings",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () async {
                                    showSubtitleChanger = false;
                                    setState(() {});
                                  },
                                  child: const Icon(Icons.close, size: 20))
                            ],
                          ),
                          /*    const SizedBox(
                          height: 20,
                        ),
                     Slider(
                            divisions: 10,
                            min: 30,
                            max: 100,
                            activeColor: Colors.white,
                            value: fontSize * 0.01,
                            onChanged: (d) {
                              fontSize = d;
                              ss(() {});
                            }),
                        const Text(
                          "Font size",
                          maxLines: 1,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),*/
                          const SizedBox(
                            height: 15,
                          ),
                          if (widget.config.subtitles.isEmpty)
                            Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                width: double.infinity,
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5, color: Colors.grey)),
                                child: const Text(
                                  'Subtitle not found',
                                  style: TextStyle(fontSize: 12),
                                ))
                          else
                            ...widget.config.subtitles.map((e) =>
                                GestureDetector(
                                  onTap: () async {
                                    widget.subtitleController
                                        .updateSubtitleUrl(url: e.url);
                                    showSubtitleChanger = false;
                                    setState(() {});
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.5, color: Colors.grey)),
                                      child: Text(
                                        e.label,
                                        style: const TextStyle(fontSize: 12),
                                      )),
                                ))
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        });
  }
}
