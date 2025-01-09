import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardConfig {
  Function()? onTap;
  double? width;
  double? height;
  EdgeInsets? padding;
  EdgeInsets? margin;
  BorderRadius? radius;
  double? border;
  List<Color> colors;
  List<Color> borderColors;
  Alignment alignment;
  CardConfig(
      {this.padding,
      this.margin,
      this.radius,
      this.width,
      this.height,
      this.alignment = Alignment.topLeft,
      this.border,
      this.colors = const [],
      this.borderColors = const [],
      this.onTap});
}
