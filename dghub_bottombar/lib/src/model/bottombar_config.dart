import 'package:dghub_bottombar/src/model/bottombar_icon.dart';
import 'package:flutter/material.dart';

class BottomBarConfig {
  List<Color>? backgroundColors;
  List<Color>? cardColors;
  List<Color>? selectedIconColors;
  List<Color>? unSelectedIconColors;
  List<Color>? selectedLabelColors;
  List<Color>? unSelectedLabelColors;
  List<DGHubBottomBarIcon> items;
  double? height;
  Widget? profileWidget;
  bool enabledProfile;
  bool enabledLine;
  Function()? onTap;
  Function(int index) result;
  BottomBarConfig({
    this.height,
    this.onTap,
    this.backgroundColors,
    this.cardColors,
    this.selectedIconColors,
    this.unSelectedIconColors,
    this.selectedLabelColors,
    this.unSelectedLabelColors,
    required this.items,
    this.profileWidget,
    this.enabledProfile = true,
    this.enabledLine = false,
    required this.result,
  });
}
