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

  static statusBarColor(Color? color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarBrightness: color == null
          ? null
          : Tools.isColorDark(color)
              ? Brightness.light
              : Brightness.dark,
    ));
  }

  static navBarColor(Color color) {
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
/*
  static double height(double d) => ScreenUtil().setHeight(d);
  static double width(double d) => ScreenUtil().setHeight(d);

  static SizedBox vspace() => ScreenUtil().setHorizontalSpacing(15);
  static SizedBox hspace() => ScreenUtil().setVerticalSpacing(15);
  static edgeInsetsLTRB({
    required double left,
    required double top,
    required double right,
    required double bottom,
  }) =>
      EdgeInsets.fromLTRB(
          width(left), height(top), width(right), height(bottom));
  static edgeInsetsAll(double a) =>
      EdgeInsets.fromLTRB(width(a), height(a), width(a), height(a));
*/
  static Color hexColor(String c) {
    try {
      var hex = c.toLowerCase().replaceAll('#ff', '0xff');
      return Color(int.parse(hex));
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return Colors.red;
    }
  }
}
