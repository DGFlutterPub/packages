import 'package:dghub_bottombar/src/model/bottombar_icon.dart';
import 'package:flutter/material.dart';

class BottomBarConfig {
  Color? backgroundColor;
  Color? backgroundColorDarkTheme;
  Color? cardColor;
  Color? cardColorDarkTheme;
  Color? selectedIconColor;
  Color? unSelectedIconColor;
  Color? selectedIconColorDarkTheme;
  Color? unSelectedIconColorDarkTheme;
  Color? selectedLabelColor;
  Color? unSelectedLabelColor;
  Color? selectedLabelColorDarkTheme;
  Color? unSelectedLabelColorDarkTheme;
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
    this.backgroundColor,
    this.backgroundColorDarkTheme,
    this.cardColor,
    this.cardColorDarkTheme,
    this.selectedIconColor,
    this.selectedIconColorDarkTheme,
    this.unSelectedIconColor,
    this.unSelectedIconColorDarkTheme,
    this.selectedLabelColor,
    this.selectedLabelColorDarkTheme,
    this.unSelectedLabelColor,
    this.unSelectedLabelColorDarkTheme,
    required this.items,
    this.profileWidget,
    this.enabledProfile = true,
    this.enabledLine = false,
    required this.result,
  });
}
