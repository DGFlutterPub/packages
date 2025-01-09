import 'package:flutter/material.dart';

class Tools {
  static bool isColorDark(Color co) {
    return ThemeData.estimateBrightnessForColor(co) == Brightness.dark;
  }

  static LinearGradient? gradient(List<Color> colors,
      {AlignmentGeometry begin = Alignment.centerLeft,
      AlignmentGeometry end = Alignment.centerRight}) {
    if (colors.isEmpty) return null;
    if (colors.length == 1) {
      return LinearGradient(
          begin: begin, end: end, colors: [colors[0], colors[0]]);
    }
    return LinearGradient(begin: begin, end: end, colors: colors);
  }
}
