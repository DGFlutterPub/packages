import 'package:dghub_auth/dghub_auth.dart';
import 'package:flutter/foundation.dart';

class AppleLoginServices {
  static signIn(AppleLoginConfig config) async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      webAuthenticationOptions: WebAuthenticationOptions(
          clientId: config.clientId,
          redirectUri: Uri.parse(config.redirectUrl)),
      nonce: 'example-nonce',
      state: 'example-state',
    );
    config.result(credential);
    if (kDebugMode) {
      print(credential);
    }
  }
}
