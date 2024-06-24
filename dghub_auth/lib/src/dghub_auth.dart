import 'package:dghub_auth/dghub_auth.dart';
import 'package:dghub_auth/src/model/guest_login_config.dart';
import 'package:dghub_auth/src/page/email_login_page.dart';
import 'package:dghub_auth/src/page/social_login_list.dart';
import 'package:dghub_button/dghub_button.dart';
import 'package:flutter/material.dart';

import 'page/phone_login_page.dart';

class DGHubAuth extends StatelessWidget {
  final bool enabledAdminLogin;
  final bool enabledGoogleLogin;
  final bool enabledFacebookLogin;
  final bool enabledAppleLogin;
  final bool enabledPhoneLogin;
  final bool enabledEmailLogin;
  final bool enabledGuestLogin;
  final GuestLoginConfig? guestLoginConfig;
  final Widget? logo;
  final EmailLoginConfig? emailLoginConfig;
  final PhoneLoginConfig? phoneLoginConfig;
  final GoogleLoginConfig? googleLoginConfig;
  final FacebookLoginConfig? facebookLoginConfig;
  final AppleLoginConfig? appleLoginConfig;
  final AuthLanguageData languageData;
  const DGHubAuth(
      {this.logo,
      this.enabledAdminLogin = false,
      required this.languageData,
      this.emailLoginConfig,
      this.phoneLoginConfig,
      this.googleLoginConfig,
      this.facebookLoginConfig,
      this.appleLoginConfig,
      this.guestLoginConfig,
      this.enabledAppleLogin = true,
      this.enabledEmailLogin = true,
      this.enabledFacebookLogin = true,
      this.enabledGoogleLogin = true,
      this.enabledPhoneLogin = true,
      this.enabledGuestLogin = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (enabledAdminLogin && emailLoginConfig != null) {
      return EmailLoginPage(
          enabledAdminLogin: enabledAdminLogin,
          languageData: languageData,
          config: emailLoginConfig!);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.cardColor,
        ),
        body: SafeArea(
          child: Container(
            color: theme.cardColor,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (logo != null) logo!,
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          languageData.pleaseSignIn,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          languageData.pleaseRegisterOrLoginYourAccount,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          textAlign: TextAlign.center,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    SocialLoginList(
                      guestLoginConfig: guestLoginConfig,
                      enabledGuestLogin: enabledGuestLogin,
                      enabledAppleLogin: enabledAppleLogin,
                      enabledFacebookLogin: enabledFacebookLogin,
                      enabledGoogleLogin: enabledGoogleLogin,
                      googleLoginConfig: googleLoginConfig,
                      facebookLoginConfig: facebookLoginConfig,
                      appleLoginConfig: appleLoginConfig,
                    ),
                    if (enabledPhoneLogin)
                      const SizedBox(
                        height: 20,
                      ),
                    if (enabledPhoneLogin)
                      Row(
                        children: [
                          const Expanded(
                              child: Divider(
                            thickness: 0.3,
                            color: Colors.black,
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(languageData.or,
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey)),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(
                              child: Divider(
                            thickness: 0.3,
                            color: Colors.black,
                          )),
                        ],
                      ),
                    if (enabledPhoneLogin)
                      const SizedBox(
                        height: 20,
                      ),
                    if (enabledPhoneLogin)
                      DGHubButton(
                          config: ButtonConfig(
                              padding: const EdgeInsets.all(10),
                              label: languageData.signInWithPhoneNumber,
                              width: double.infinity,
                              color: theme.primaryColor,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PhoneLoginPage(
                                            languageData: languageData,
                                            config: phoneLoginConfig ??
                                                PhoneLoginConfig(),
                                          )),
                                );
                              })),
                    if (enabledEmailLogin)
                      const SizedBox(
                        height: 30,
                      ),
                    if (enabledEmailLogin)
                      Text(
                        languageData.loginEmailAccount,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    if (enabledEmailLogin)
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmailLoginPage(
                                      languageData: languageData,
                                      config: emailLoginConfig ??
                                          EmailLoginConfig(),
                                    )),
                          );
                        },
                        child: Text(
                          languageData.loginHere,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: theme.primaryColor),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
