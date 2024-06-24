import 'package:flutter/material.dart';

class DGHubTabBarItem {
  IconData icon;
  String label;
  String? image;
  Function()? onTap;
  DGHubTabBarItem(
      {required this.icon, required this.label, this.image, this.onTap});
}
