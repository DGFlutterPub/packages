import 'package:flutter/material.dart';

class AppBarConfig {
  Widget? backWidget;
  bool isLogged;
  bool hideSignUp;
  String? searchLabel;
  Widget? logo;
  List<Widget> items;
  double? height;
  Widget? profileWidget;
  Function()? centerOnTap;
  Function()? menuOnTap;
  Function()? micOnTap;
  bool enabledBottomLine;
  Function()? onBack;
  PreferredSizeWidget? bottom;
  Color? shadowColor;
  bool forceElevated;
  bool primary;
  bool floating;
  bool pinned;
  bool snap;
  bool stretch;
  final Function()? onTap;
  Function()? onTapLoginButton;
  Function()? onTapSignupButton;
  List<Color>? iconColors;
  AppBarConfig({
    this.backWidget,
    this.isLogged = false,
    this.hideSignUp = false,
    this.onBack,
    this.height,
    this.bottom,
    this.onTap,
    this.shadowColor,
    this.forceElevated = false,
    this.floating = false,
    this.pinned = false,
    this.snap = false,
    this.stretch = false,
    this.primary = false,
    this.logo,
    this.onTapLoginButton,
    this.onTapSignupButton,
    this.searchLabel,
    required this.items,
    this.profileWidget,
    this.centerOnTap,
    this.menuOnTap,
    this.micOnTap,
    this.iconColors,
    this.enabledBottomLine = false,
  });
}
