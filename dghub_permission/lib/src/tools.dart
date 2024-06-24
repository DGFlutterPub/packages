import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class Tools {
  static bool isColorDark(Color co) {
    return ThemeData.estimateBrightnessForColor(co) == Brightness.dark;
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
}
