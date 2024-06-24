import 'dart:io';

import 'package:dghub_auth/src/model/google_login_config.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginServices {
  static GoogleSignInAccount? data;
  static bool isAuthorized = false;

  static List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
    "https://www.googleapis.com/auth/userinfo.profile"
  ];

  static GoogleSignIn googleSignIn = GoogleSignIn();

  static Future<void> signIn() async {
    try {
      await googleSignIn.signIn();
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  static listening({required GoogleLoginConfig config}) {
    googleSignIn = GoogleSignIn(
        serverClientId: kIsWeb
            ? null
            : Platform.isIOS
                ? config.serverClientId
                : null,
        clientId: config.clientId,
        scopes: scopes);
    googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      // In mobile, being authenticated means being authorized...
      bool isA = account != null;
      // However, in the web...
      if (kIsWeb && account != null) {
        isAuthorized = await googleSignIn.canAccessScopes(scopes);
      }

      data = account;
      isAuthorized = isA;
      if (kDebugMode) {
        print(isA);
        if (data != null) {
          print(data!.email);
        } else {
          print(data);
        }
      }

      config.result(account, isA);
    });

    googleSignIn.signInSilently();
  }

  static logout() {
    try {
      googleSignIn.signOut();
    } catch (e) {}
  }
}
