import 'package:dghub_image_slider/dghub_image_slider.dart';
import 'package:dghub_image_slider/src/tools/tools.dart';
import 'package:flutter/material.dart';

class ImageSliderFade extends StatelessWidget {
  final ImageSliderConfig? config;
  const ImageSliderFade({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    if (Tools.isDesktop(context)) {
      return _MobileSlide();
    }
    return _DesktopSlide();
  }
}

class _MobileSlide extends StatelessWidget {
  const _MobileSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _DesktopSlide extends StatelessWidget {
  const _DesktopSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
