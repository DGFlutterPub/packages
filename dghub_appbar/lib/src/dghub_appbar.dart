import 'package:dghub_appbar/src/tools/tools.dart';
import 'package:flutter/material.dart';

import 'appbars/simple/appbar_simple.dart';
import 'models/appbar_config.dart';

enum AppBarDesigns { simple }

class DGHubAppBar extends StatefulWidget {
  final AppBarDesigns design;
  final AppBarConfig config;
  const DGHubAppBar(
      {this.design = AppBarDesigns.simple, required this.config, super.key});

  @override
  State<DGHubAppBar> createState() => _DGHubAppBarState();
}

class _DGHubAppBarState extends State<DGHubAppBar> {
  @override
  Widget build(BuildContext context) {
    Tools.statusBarColor(Theme.of(context).colorScheme.surface);
    switch (widget.design) {
      case AppBarDesigns.simple:
        return AppBarSimple(
          config: widget.config,
        );

      default:
        return AppBarSimple(
          config: widget.config,
        );
    }
  }
}
