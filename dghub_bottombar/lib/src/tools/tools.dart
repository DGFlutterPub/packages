import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tools {
  static isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static bool isDarkTheme(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.color == Colors.white;
  }

  static navBarColor({required Color color}) {
    if (!kIsWeb) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: color,
        systemNavigationBarIconBrightness:
            isColorDark(color) ? Brightness.light : Brightness.dark,
      ));
    }
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
}
