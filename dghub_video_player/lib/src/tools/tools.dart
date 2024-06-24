import 'package:flutter/material.dart';

class Tools {
  static isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static bool isDarkTheme(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.color == Colors.white;
  }
}
