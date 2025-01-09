import 'package:dghub_image/src/dghub_image.dart';
import 'package:flutter/material.dart';

extension ToolExtension on BuildContext {
  bool get isDarkTheme =>
      Theme.of(this).textTheme.bodyLarge!.color == Colors.white;
}
