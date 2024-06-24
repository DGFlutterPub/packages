import 'package:dghub_auth/src/model/facebook_login_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookLoginServices {
  static Map<String, dynamic>? data;
  static AccessToken? token;

  static listening(FacebookLoginConfig config) async {
    try {
      final accessToken = await FacebookAuth.instance.accessToken;

      if (accessToken != null) {
        if (kDebugMode) {
          print(accessToken.toJson());
        }
        final userData = await FacebookAuth.instance.getUserData();
        token = accessToken;

        data = userData;
        if (data != null && token != null) {
          config.result(data!, token!.token, true);
        }
      } else {
        signIn(config);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static signIn(FacebookLoginConfig config) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        token = result.accessToken;

        final userData = await FacebookAuth.instance.getUserData();
        data = userData;
        if (data != null && token != null) {
          config.result(data!, token!.token, true);
        }
      } else {
        if (kDebugMode) {
          print(result.status);
          print(result.message);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static logout() async {
    try {
      await FacebookAuth.instance.logOut();
    } catch (e) {}

    token = null;
    data = null;
  }
}
