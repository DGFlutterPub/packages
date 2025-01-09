import 'package:permission_handler/permission_handler.dart';

class PermissionModel {
  Permission permission;
  String label;
  String subLabel;
  bool isGranted;
  PermissionModel(
      {this.isGranted = false,
      required this.permission,
      required this.label,
      required this.subLabel});
}
