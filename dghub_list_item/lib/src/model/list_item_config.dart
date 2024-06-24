import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListItemConfig {
  IconData icon;
  String label;
  String? headerLabel;
  Function()? onTap;
  bool enabledArrow;
  ListItemConfig(
      {required this.label,
      this.headerLabel,
      required this.icon,
      this.onTap,
      this.enabledArrow = true});
}
