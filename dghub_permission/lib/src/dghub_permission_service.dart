import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dghub_permission/dghub_permission.dart';
import 'package:flutter/foundation.dart';

class DGHubPermissionService {
  static Future<bool> isAllowedAll(
      {bool storage = true,
      bool location = false,
      bool microphone = false,
      bool photo = false,
      bool contact = false,
      bool camera = false,
      bool video = false,
      bool alertWindow = false}) async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    List<bool> list = [];

    if (storage) {
      bool storagePermission = false;
      if (!kIsWeb) {
        if (Platform.isAndroid) {
          AndroidDeviceInfo android = await plugin.androidInfo;
          if (android.version.sdkInt > 32) {
            storagePermission = await Permission.photos.isGranted;
          } else {
            storagePermission = await Permission.storage.isGranted;
          }
        } else {
          storagePermission = await Permission.storage.isGranted;
        }
      }

      list.add(storagePermission);
    }
    if (location) {
      list.add(await Permission.location.isGranted);
    }
    if (microphone) {
      list.add(await Permission.microphone.isGranted);
    }
    if (photo) {
      list.add(await Permission.phone.isGranted);
    }
    if (contact) {
      list.add(await Permission.contacts.isGranted);
    }
    if (camera) {
      list.add(await Permission.camera.isGranted);
    }
    if (video) {
      list.add(await Permission.videos.isGranted);
    }
    if (alertWindow) {
      list.add(await Permission.systemAlertWindow.isGranted);
    }
    for (var element in list) {
      if (element == false) {
        return false;
      }
    }
    return true;
  }
}
