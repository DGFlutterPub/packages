import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardConfig {
  Function()? onTap;
  double? width;
  double? height;
  EdgeInsets? padding;
  Color? color;
  BorderRadius? border;
  CardConfig(
      {this.padding,
      this.color,
      this.border,
      this.width,
      this.height,
      this.onTap});
}
