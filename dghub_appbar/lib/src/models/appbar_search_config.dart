import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarSearchConfig {
  List<Widget> items;
  double? height;
  Function()? backOnTap;
  Function(String result) searchResult;
  bool enabledBottomLine;
  String? searchLabel;
  PreferredSizeWidget? bottom;
  Color? shadowColor;
  bool forceElevated;
  bool primary;
  bool floating;
  bool pinned;
  bool snap;
  bool stretch;
  Widget? logo;
  Function()? onTap;
  AppBarSearchConfig(
      {this.height,
      this.logo,
      this.bottom,
      this.onTap,
      this.shadowColor,
      this.forceElevated = false,
      this.floating = false,
      this.pinned = false,
      this.snap = false,
      this.stretch = false,
      this.primary = false,
      this.searchLabel,
      required this.items,
      this.enabledBottomLine = false,
      this.backOnTap,
      required this.searchResult});
}
