import 'package:dghub_tab/dghub_tab.dart';
import 'package:flutter/material.dart';

class DGHubTabConfig {
  Function(int index, TabController controller) changed;
  List<DGHubTabBarItem> tabs;
  List<Widget> bodys;
  bool pinned;

  DGHubTabConfig(
      {required this.changed,
      required this.tabs,
      this.bodys = const [],
      this.pinned = true});
}
