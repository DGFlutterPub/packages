import 'package:dghub_icon_button/src/designs/icon_button_blur.dart';
import 'package:dghub_icon_button/src/designs/icon_button_opacity.dart';
import 'package:dghub_icon_button/src/designs/icon_button_simple.dart';
import 'package:dghub_icon_button/src/models/icon_button_config.dart';
import 'package:flutter/material.dart';

enum IconButtonDesigns { simple, blur, opacity }

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
      IconButtonDesigns.opacity => IconButtonOpacity(config: config),
      IconButtonDesigns.simple => IconButtonSimple(
          config: config,
        ),
      IconButtonDesigns.blur => IconButtonBlur(config: config)
    };
  }
}
