import 'package:flutter/material.dart';

class Tools {
  static bool isDarkTheme(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.color == Colors.white;
  }
}
