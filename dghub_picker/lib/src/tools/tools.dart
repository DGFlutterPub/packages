import 'package:flutter/material.dart';

class Tools {
  static bool isDarkTheme(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark;
  }

  static String getSize(double size) {
    String hrSize = "";

    double b = size;
    double k = size / 1024.0;
    double m = ((size / 1024.0) / 1024.0);
    double g = (((size / 1024.0) / 1024.0) / 1024.0);
    double t = ((((size / 1024.0) / 1024.0) / 1024.0) / 1024.0);

    if (t > 1) {
      hrSize = "${t.toStringAsFixed(2)} TB";
    } else if (g > 1) {
      hrSize = "${g.toStringAsFixed(2)} GB";
    } else if (m > 1) {
      hrSize = "${m.toStringAsFixed(2)} MB";
    } else if (k > 1) {
      hrSize = "${k.toStringAsFixed(2)} KB";
    } else {
      hrSize = "${b.toStringAsFixed(2)} Bytes";
    }
    return hrSize;
  }
}
