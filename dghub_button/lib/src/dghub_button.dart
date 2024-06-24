import 'package:dghub_button/dghub_button.dart';
import 'package:dghub_button/src/buttons/circle_button.dart';
import 'package:dghub_button/src/buttons/default_button.dart';
import 'package:flutter/material.dart';

class DGHubButton extends StatelessWidget {
  final DGHubButtonType type;
  final ButtonConfig config;
  const DGHubButton(
      {required this.config,
      this.type = DGHubButtonType.defaultDesign,
      super.key});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case DGHubButtonType.circle:
        return CircleButton(
          config: config,
        );

      default:
        return DefaultButton(
          config: config,
        );
    }
  }
}
