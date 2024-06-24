import 'package:dghub_tab/src/model/tab_config.dart';
import 'package:flutter/material.dart';

import '../dghub_tab.dart';
import 'tabs/default_tab.dart';

enum TabDesigns { simple }

class DGHubTab extends StatelessWidget {
  final DGHubTabConfig config;
  final TabDesigns design;
  const DGHubTab(
      {this.design = TabDesigns.simple, required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    switch (design) {
      case TabDesigns.simple:
        return DefaultTab(config: config);
      default:
        return DefaultTab(config: config);
    }
  }
}
