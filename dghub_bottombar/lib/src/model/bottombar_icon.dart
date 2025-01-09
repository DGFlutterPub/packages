import 'package:flutter/material.dart';

class DGHubBottomBarIcon {
  String label;
  Function() onTap;
  String? badageLabel;
  bool enabledBadage;
  Color? badageColor;
  String? selectedLottieIcon;
  IconData? selectedIcon;
  IconData? unSelectedIcon;
  List<Color>? selectedIconColors;
  List<Color>? unSelectedIconColors;
  List<Color>? selectedLabelColors;
  List<Color>? unSelectedLabelColors;
  bool enabledFill;

  DGHubBottomBarIcon(
      {required this.label,
      this.selectedIcon,
      this.unSelectedIcon,
      this.unSelectedIconColors,
      this.selectedIconColors,
      this.unSelectedLabelColors,
      this.selectedLabelColors,
      required this.onTap,
      this.badageLabel,
      this.badageColor,
      this.selectedLottieIcon,
      this.enabledFill = false,
      this.enabledBadage = false});
}
