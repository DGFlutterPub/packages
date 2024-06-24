import 'package:flutter/material.dart';

class ItemConfig {
  String? label;
  String? subLabel;
  String? overlayLabel;
  String? buttonLabel;
  String? ratingLabel;
  Function()? onTap;
  Function()? onTapButton;
  Widget? photo;
  Widget? video;
  double width;
  double height;
  BorderRadius? radius;
  Color? backgroundColor;
  double labelSize;
  double subLabelSize;
  double buttonLabelSize;
  ItemConfig(
      {this.label,
      this.subLabel,
      this.overlayLabel,
      this.buttonLabel,
      this.onTap,
      this.photo,
      this.video,
      this.ratingLabel,
      this.onTapButton,
      required this.width,
      required this.height,
      this.backgroundColor,
      this.labelSize = 16,
      this.subLabelSize = 14,
      this.buttonLabelSize = 14,
      this.radius});
}
