library dghub_image;

import 'dart:io';

import 'package:dghub_image/dghub_image.dart';
import 'package:dghub_image/src/image/image_asset.dart';
import 'package:dghub_image/src/image/image_avatar.dart';
import 'package:dghub_image/src/image/image_byte.dart';
import 'package:dghub_image/src/tools/tools.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../src/image/image_network.dart';
import 'image/image_file.dart';

String? globalUrl;

class DGHubImage extends StatelessWidget {
  final Function()? onTap;
  final String autoLoad;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit fit;
  final bool enableCacheMode;
  final DGHubAvatarType? avatarType;
  const DGHubImage(
      {this.fit = BoxFit.cover,
      required this.autoLoad,
      this.radius = 0,
      this.height,
      this.width,
      this.onTap,
      this.avatarType,
      this.enableCacheMode = true,
      super.key});

  static network(
          {Function()? onTap,
          required String load,
          double? width,
          double? height,
          double radius = 0,
          BoxFit fit = BoxFit.cover,
          bool enableCacheMode = true}) =>
      ImageNetwork(
        fit: fit,
        load: Tools.getHostUrl(load).toString(),
        radius: radius,
        height: height,
        width: width,
        onTap: onTap,
        enableCacheMode: enableCacheMode,
      );

  static file(
          {Function()? onTap,
          required File load,
          double? width,
          double? height,
          double radius = 0,
          BoxFit fit = BoxFit.cover}) =>
      ImageFile(
          fit: fit,
          load: load,
          radius: radius,
          height: height,
          width: width,
          onTap: onTap);

  static asset(
          {Function()? onTap,
          required String load,
          double? width,
          double? height,
          double radius = 0,
          BoxFit fit = BoxFit.cover}) =>
      ImageAsset(
          fit: fit,
          load: load,
          radius: radius,
          height: height,
          width: width,
          onTap: onTap);

  static byte(
          {Function()? onTap,
          required Uint8List load,
          double? width,
          double? height,
          double radius = 0,
          BoxFit fit = BoxFit.cover}) =>
      ImageByte(
          fit: fit,
          load: load,
          radius: radius,
          height: height,
          width: width,
          onTap: onTap);

  static avatar(
          {Function()? onTap,
          required String load,
          DGHubAvatarType type = DGHubAvatarType.text,
          double? width,
          double? height,
          double radius = 0,
          BoxFit fit = BoxFit.cover}) =>
      ImageAvatar(
          fit: fit,
          load: load,
          type: type,
          radius: radius,
          height: height,
          width: width,
          onTap: onTap);

  @override
  Widget build(BuildContext context) {
    if (autoLoad.contains('http://') || autoLoad.contains('https://')) {
      return ImageNetwork(
        fit: fit,
        load: Tools.getHostUrl(autoLoad).toString(),
        radius: radius,
        height: height,
        width: width,
        onTap: onTap,
        enableCacheMode: enableCacheMode,
      );
    }

    subStr(int a, int b) {
      try {
        return autoLoad.substring(a, b);
      } catch (e) {
        return 'N';
      }
    }

    if (subStr(0, 4) == 'file') {
      return ImageFile(
          fit: fit,
          load: File(autoLoad),
          radius: radius,
          height: height,
          width: width,
          onTap: onTap);
    }
    if (subStr(0, 6) == 'assets') {
      return ImageFile(
          fit: fit,
          load: File(autoLoad),
          radius: radius,
          height: height,
          width: width,
          onTap: onTap);
    }
    return ImageAvatar(
        fit: fit,
        type: avatarType ?? DGHubAvatarType.text,
        radius: radius,
        height: height,
        width: width,
        onTap: onTap,
        load: autoLoad);
  }
}
