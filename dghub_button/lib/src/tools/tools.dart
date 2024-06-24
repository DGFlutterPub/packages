import 'package:flutter/material.dart';

class Tools {
  static bool isColorDark(Color co) {
    return ThemeData.estimateBrightnessForColor(co) == Brightness.dark;
  }
}
