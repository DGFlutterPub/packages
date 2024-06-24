import 'package:dghub_image/src/dghub_image.dart';

class Tools {
  static String? getHostUrl(String? url) {
    if (url == null) {
      return null;
    }
    if (url.contains('http://') || url.contains('https://')) {
      return url;
    } else if (globalUrl == null) {
      return url;
    } else {
      return globalUrl! + url;
    }
  }
}
