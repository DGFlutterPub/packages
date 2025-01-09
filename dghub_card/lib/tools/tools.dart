import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tools {
  static isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static bool isDarkTheme(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.color == Colors.white;
  }

  static statusBarColor(Color? color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: color == null
          ? null
          : Tools.isColorDark(color)
              ? Brightness.light
              : Brightness.dark,
    ));
  }

  static bool isColorDark(Color co) {
    return ThemeData.estimateBrightnessForColor(co) == Brightness.dark;
  }

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 480;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 480;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static Color hexColor(String c) {
    return Color(int.parse(c));
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
