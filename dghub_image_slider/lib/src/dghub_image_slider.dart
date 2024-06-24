import 'package:dghub_image_slider/dghub_image_slider.dart';
import 'package:dghub_image_slider/src/designs/image_slider_simple.dart';
import 'package:flutter/material.dart';

enum ImageSliderDesigns { simple }

class DGHubImageSlider extends StatelessWidget {
  final ImageSliderDesigns design;
  final ImageSliderConfig config;
  const DGHubImageSlider(
      {required this.config,
      this.design = ImageSliderDesigns.simple,
      super.key});

  @override
  Widget build(BuildContext context) {
    switch (design) {
      case ImageSliderDesigns.simple:
        return ImageSliderSimple(
          config: config,
        );
      default:
        return ImageSliderSimple(
          config: config,
        );
    }
  }
}
