import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dghub_permission/dghub_permission.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var permissionProvider = ChangeNotifierProvider((n) => PermissionNotifier());

class PermissionNotifier extends ChangeNotifier {
  List<PermissionModel> granteds = [];
  bool isGranteds = true;

  init(List<PermissionModel> permissions) async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();

    for (var p in Permission.values) {
      for (var s in permissions) {
        if (p.hashCode == s.permission.hashCode) {
          if (!kIsWeb) {
            if (s.permission.hashCode == 174015) {
              if (Platform.isAndroid) {
                AndroidDeviceInfo android = await plugin.androidInfo;
                if (android.version.sdkInt > 32) {
                  s.permission = Permission.photos;
                } else {
                  s.permission = Permission.storage;
                }
              } else {
                s.permission = Permission.storage;
              }
            }
            s.isGranted = await s.permission.isGranted;
            granteds.add(s);
          }
        }
      }
    }
    checkGranteds();
  }

  bool checkGranteds() {
    for (var element in granteds) {
      if (element.isGranted == false) {
        isGranteds = false;
        notifyListeners();
        return false;
      }
    }

    isGranteds = true;
    notifyListeners();
    return true;
  }

  Future<bool> require(PermissionModel p) async {
    if (await p.permission.isDenied) {
      var s = await p.permission.request();

      if (await p.permission.isPermanentlyDenied) {
        await openAppSettings();
        if (await p.permission.isPermanentlyDenied) {
          granteds[granteds.indexWhere((e) => e.label == p.label)].isGranted =
              false;
          notifyListeners();
          return false;
        } else {
          granteds[granteds.indexWhere((e) => e.label == p.label)].isGranted =
              true;
          notifyListeners();
          return true;
        }
      } else if (s.isGranted) {
        granteds[granteds.indexWhere((e) => e.label == p.label)].isGranted =
            true;
        notifyListeners();
        return true;
      } else {
        granteds[granteds.indexWhere((e) => e.label == p.label)].isGranted =
            false;
        notifyListeners();
        return false;
      }
    }
    return false;
  }
}
