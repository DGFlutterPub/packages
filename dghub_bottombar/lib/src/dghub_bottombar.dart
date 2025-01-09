import 'package:dghub_bottombar/src/bottombars/location/location_bottombar.dart';
import 'package:dghub_bottombar/src/bottombars/material3/material3_bottombar.dart';
import 'package:dghub_bottombar/src/model/bottombar_config.dart';
import 'package:dghub_bottombar/src/tools/enums.dart';
import 'package:dghub_bottombar/src/tools/tools.dart';
import 'package:flutter/material.dart';

import 'bottombars/default/default_bottombar.dart';

class DGHubBottomBar extends StatefulWidget {
  final DGHubBottomBarType type;
  final BottomBarConfig config;
  const DGHubBottomBar(
      {this.type = DGHubBottomBarType.defaultDesign,
      required this.config,
      super.key});

  @override
  State<DGHubBottomBar> createState() => _DGHubBottomBarState();
}

class _DGHubBottomBarState extends State<DGHubBottomBar> {
  @override
  void initState() {
    if (widget.config.backgroundColors != null) {
      Tools.navBarColor(
          color: widget.config.backgroundColors?.first ?? Colors.amber);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case DGHubBottomBarType.material3:
        return Material3BottomBar(
          config: widget.config,
        );
      case DGHubBottomBarType.locationDesign:
        return LocationDesignBottomBar(
          config: widget.config,
        );
      default:
        return DefaultDesignBottomBar(
          config: widget.config,
        );
    }
  }
}
