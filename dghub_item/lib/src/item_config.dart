import 'package:flutter/material.dart';

class ItemConfig {
  String? label;
  String? subLabel;
  String? overlayLabel;
  List<Color> overlayBackgroundColors;
  String? buttonLabel;
  String? ratingLabel;
  Function()? onTap;
  Function()? onTapButton;
  String? photoUrl;
  String? videoUrl;
  Widget? customHolder;
  double? width;
  double? height;
  BorderRadius? radius;
  List<Color> colors;
  List<Color> borderColors;
  double borderSize;
  List<Color> overLayColors;
  double labelSize;
  double subLabelSize;
  double buttonLabelSize;

  ItemConfig(
      {this.label,
      this.subLabel,
      this.overlayLabel,
      this.buttonLabel,
      this.onTap,
      this.photoUrl,
      this.videoUrl,
      this.customHolder,
      this.ratingLabel,
      this.onTapButton,
      this.width,
      this.height,
      this.colors = const [],
      this.borderColors = const [],
      this.overLayColors = const [],
      this.labelSize = 16,
      this.subLabelSize = 14,
      this.buttonLabelSize = 14,
      this.borderSize = 0,
      this.overlayBackgroundColors = const [Colors.white],
      this.radius});
}
