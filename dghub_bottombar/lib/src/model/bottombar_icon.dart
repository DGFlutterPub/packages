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
  Color? selectedIconColor;
  Color? unSelectedIconColor;
  Color? selectedLabelColor;
  Color? unSelectedLabelColor;

  DGHubBottomBarIcon(
      {required this.label,
      this.selectedIcon,
      this.unSelectedIcon,
      this.unSelectedIconColor,
      this.selectedIconColor,
      this.unSelectedLabelColor,
      this.selectedLabelColor,
      required this.onTap,
      this.badageLabel,
      this.badageColor,
      this.selectedLottieIcon,
      this.enabledBadage = false});
}
