import 'package:flutter/widgets.dart';

class IconButtonConfig {
  IconData? icon;
  String? lottieIcon;
  Function() onTap;
  double size;
  String? badgeLabel;
  IconButtonConfig(
      {this.badgeLabel,
      this.size = 20,
      required this.onTap,
      this.icon,
      this.lottieIcon});
}
