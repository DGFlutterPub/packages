import 'package:flutter/material.dart';

class SeeMoreItemConfig {
  String? label;
  Function()? onTap;
  double width;
  double height;
  BorderRadius? radius;
  SeeMoreItemConfig(
      {this.radius,
      this.label,
      required this.height,
      this.onTap,
      required this.width});
}
