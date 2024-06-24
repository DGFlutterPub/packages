import 'package:dghub_auth/dghub_auth.dart';

class AppleLoginConfig {
  String redirectUrl;
  String clientId;
  Function(AuthorizationCredentialAppleID data) result;

  AppleLoginConfig({
    required this.redirectUrl,
    this.clientId = 'de.lunaone.flutter.signinwithappleexample.service',
    required this.result,
  });
}
