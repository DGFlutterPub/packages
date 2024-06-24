import 'package:flutter/material.dart';

class AppBarBackConfig {
  List<Widget> items;
  double? height;
  Function()? backOnTap;
  bool enabledBottomLine;
  PreferredSizeWidget? bottom;
  Color? shadowColor;
  bool forceElevated;
  bool primary;
  bool floating;
  bool pinned;
  bool snap;
  bool stretch;
  Function()? onTap;
  Widget? logo;
  AppBarBackConfig({

    this.logo,
    this.height,
    this.bottom,
    this.onTap,
    this.shadowColor,
    this.forceElevated = false,
    this.floating = false,
    this.pinned = true,
    this.snap = false,
    this.stretch = false,
    this.primary = false,
    required this.items,
    this.enabledBottomLine = false,
  });
}
