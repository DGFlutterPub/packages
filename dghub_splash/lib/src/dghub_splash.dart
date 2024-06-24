import 'package:dghub_splash/dghub_splash.dart';
import 'package:dghub_splash/src/splashs/circle_splash.dart';
import 'package:dghub_splash/src/splashs/default_splash.dart';
import 'package:dghub_splash/src/splashs/fill_splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'splashs/photo_only_splash.dart';

class DGHubSplash extends StatefulWidget {
  final DGHubSplashStyle style;
  final DGHubSplashType type;
  final DGHubSplashData data;

  const DGHubSplash(
      {required this.style,
      required this.data,
      this.type = DGHubSplashType.defaultDesign,
      super.key});

  @override
  State<DGHubSplash> createState() => _DGHubSplashState();
}

class _DGHubSplashState extends State<DGHubSplash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: widget.data.seconds), () {
      if (kDebugMode) {
        print('[SPLASH] COMPLETED');
      }

      if (widget.data.onComplete != null) {
        widget.data.onComplete!();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case DGHubSplashType.fill:
        return FillSplash(
          data: widget.data,
          style: widget.style,
        );
      case DGHubSplashType.circle:
        return CircleSplash(
          data: widget.data,
          style: widget.style,
        );
      case DGHubSplashType.photoOnly:
        return PhotoOnlySplash(
          data: widget.data,
          style: widget.style,
        );
      default:
        return DefaultSplash(
          data: widget.data,
          style: widget.style,
        );
    }
  }
}
