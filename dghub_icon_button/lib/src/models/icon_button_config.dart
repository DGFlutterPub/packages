import 'package:flutter/widgets.dart';

class IconButtonConfig {
  IconData? icon;
  List<Color> colors;
  String? lottieIcon;
  Function() onTap;
  double size;
  String? badgeLabel;
  bool isLoading;
  IconButtonConfig(
      {this.badgeLabel,
      this.size = 25,
      required this.onTap,
      this.colors = const [],
      this.icon,
      this.isLoading = false,
      this.lottieIcon});
}
