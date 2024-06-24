import 'package:flutter/material.dart';

class ImageSliderConfig {
  final bool? autoPlay;
  final int itemCount;
  final double height;
  final Widget Function(BuildContext context, int index) itemBuilder;
  ImageSliderConfig(
      {required this.itemCount,
      this.height = 250,
      required this.itemBuilder,
      this.autoPlay = false});
}
