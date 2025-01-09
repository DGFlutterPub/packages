import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListItemConfig {
  IconData icon;
  bool enableIcon;
  Color? iconColor;
  String label;
  String? headerLabel;
  Widget? rightWidget;
  Function()? onTap;
  bool enabledArrow;
  ListItemConfig(
      {required this.label,
      this.headerLabel,
      this.enableIcon = true,
      required this.icon,
      this.rightWidget,
      this.onTap,
      this.iconColor,
      this.enabledArrow = true});
}
