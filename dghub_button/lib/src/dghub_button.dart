import 'package:dghub_button/dghub_button.dart';
import 'package:dghub_button/src/buttons/blur_button.dart';
import 'package:dghub_button/src/buttons/circle_button.dart';
import 'package:dghub_button/src/buttons/line_button.dart';
import 'package:dghub_button/src/buttons/simple_button.dart';
import 'package:flutter/material.dart';

class DGHubButton extends StatelessWidget {
  final DGHubButtonDesigns design;
  final ButtonConfig config;
  const DGHubButton(
      {required this.config,
      this.design = DGHubButtonDesigns.simple,
      super.key});

  @override
  Widget build(BuildContext context) {
    return switch (design) {
      DGHubButtonDesigns.simple => SimpleButton(
          config: config,
        ),
      DGHubButtonDesigns.circle => CircleButton(
          config: config,
        ),
      DGHubButtonDesigns.blur => BlurButton(config: config),
      DGHubButtonDesigns.line => LineButton(config: config)
    };
  }
}
