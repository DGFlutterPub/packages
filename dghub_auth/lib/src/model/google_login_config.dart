import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginConfig {
  String clientId;
  String serverClientId;
  Function(GoogleSignInAccount? data, bool isLogged) result;

  GoogleLoginConfig({
    required this.serverClientId,
    required this.clientId,
    required this.result,
  });
}
