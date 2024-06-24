import 'package:dghub_icon_button/src/designs/icon_button_simple.dart';
import 'package:dghub_icon_button/src/models/icon_button_config.dart';
import 'package:flutter/material.dart';

enum IconButtonDesigns { simple }

class DGHubIconButton extends StatelessWidget {
  final IconButtonDesigns design;
  final IconButtonConfig config;
  const DGHubIconButton(
      {required this.config,
      this.design = IconButtonDesigns.simple,
      super.key});

  @override
  Widget build(BuildContext context) {
    return switch (design) {
      IconButtonDesigns.simple => IconButtonSimple(
          config: config,
        )
    };
  }
}
