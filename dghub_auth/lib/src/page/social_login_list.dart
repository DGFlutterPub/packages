import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dghub_auth/src/model/guest_login_config.dart';
import 'package:dghub_auth/src/model/result_guest.dart';
import 'package:dghub_auth/src/tools/assets_path.dart';
import 'package:dghub_auth/src/widgets/social_list_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../dghub_auth.dart';

class SocialLoginList extends StatefulWidget {
  final bool enabledGoogleLogin;
  final bool enabledFacebookLogin;
  final bool enabledAppleLogin;
  final bool enabledGuestLogin;
  final GoogleLoginConfig? googleLoginConfig;
  final GuestLoginConfig? guestLoginConfig;
  final FacebookLoginConfig? facebookLoginConfig;
  final AppleLoginConfig? appleLoginConfig;
  const SocialLoginList(
      {required this.googleLoginConfig,
      required this.appleLoginConfig,
      required this.facebookLoginConfig,
      required this.enabledAppleLogin,
      required this.enabledGoogleLogin,
      required this.enabledFacebookLogin,
      required this.enabledGuestLogin,
      required this.guestLoginConfig,
      super.key});

  @override
  State<SocialLoginList> createState() => _SocialLoginListState();
}

class _SocialLoginListState extends State<SocialLoginList> {
  @override
  void initState() {
    if (widget.googleLoginConfig != null) {
      GoogleLoginServices.listening(config: widget.googleLoginConfig!);
    }
    if (widget.facebookLoginConfig != null) {
      // FacebookLoginServices.listening(widget.facebookLoginConfig!);
    }
    if (widget.appleLoginConfig != null) {}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.enabledGoogleLogin)
          SocialListItem(
              onTap: () {
                if (widget.googleLoginConfig != null) {
                  GoogleLoginServices.signIn();
                }
              },
              label: 'Sign in with Google',
              loadAsset: AssetsPath.google),
        if (widget.enabledGoogleLogin)
          const SizedBox(
            height: 20,
          ),
        if (widget.enabledFacebookLogin)
          SocialListItem(
              onTap: () {
                if (widget.facebookLoginConfig != null) {
                  FacebookLoginServices.signIn(widget.facebookLoginConfig!);
                }
              },
              label: 'Sign in with Facebook',
              loadAsset: AssetsPath.facebook),
        if (widget.enabledFacebookLogin)
          const SizedBox(
            height: 20,
          ),
        if (widget.enabledAppleLogin)
          SocialListItem(
              onTap: () {
                if (widget.appleLoginConfig != null) {
                  AppleLoginServices.signIn(widget.appleLoginConfig!);
                }
              },
              label: 'Sign in with Apple',
              loadAsset: AssetsPath.apple),
        if (widget.enabledGuestLogin)
          const SizedBox(
            height: 20,
          ),
        if (widget.enabledGuestLogin)
          SocialListItem(
              onTap: () async {
                if (widget.guestLoginConfig != null) {
                  String? deviceIdentifier;
                  String? name;
                  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                  if (kIsWeb) {
                    final WebBrowserInfo webInfo =
                        await deviceInfo.webBrowserInfo;
                    deviceIdentifier = webInfo.hardwareConcurrency.toString();
                    name = webInfo.appName;
                  } else {
                    if (Platform.isAndroid) {
                      final AndroidDeviceInfo androidInfo =
                          await deviceInfo.androidInfo;
                      deviceIdentifier = androidInfo.id;
                      name = androidInfo.device;
                    } else if (Platform.isIOS) {
                      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
                      deviceIdentifier = iosInfo.identifierForVendor;
                      name = iosInfo.model;
                    } else if (Platform.isLinux) {
                      final LinuxDeviceInfo linuxInfo =
                          await deviceInfo.linuxInfo;
                      deviceIdentifier = linuxInfo.machineId;
                      name = linuxInfo.name;
                    }
                  }
                  if (deviceIdentifier != null && name != null) {
                    widget.guestLoginConfig!.result!(
                        ResultGuest(name: name, identifier: deviceIdentifier));
                  }
                }
              },
              label: 'Sign in with Guest',
              loadAsset: AssetsPath.guest),
      ],
    );
  }
}
