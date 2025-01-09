import 'package:dghub_card/src/designs/dghub_card_animated_border.dart';
import 'package:dghub_card/src/designs/dghub_card_colored_glass.dart';
import 'package:flutter/material.dart';
import 'card_config.dart';
import 'designs/dghub_card_simple.dart';

enum DGHubCardDesigns { simple, blur, animatedBorder, coloredGlass }

class DGHubCard extends StatelessWidget {
  final DGHubCardDesigns design;
  final CardConfig? config;
  final Widget child;
  const DGHubCard(
      {this.config,
      required this.child,
      this.design = DGHubCardDesigns.simple,
      super.key});

  @override
  Widget build(BuildContext context) {
    switch (design) {
      case DGHubCardDesigns.animatedBorder:
        return DGHubAnimatedBorder(config: config, child: child);
      case DGHubCardDesigns.simple:
        return DGHubCardSimple(config: config, child: child);
      case DGHubCardDesigns.coloredGlass:
        return DGHubCardColoredGlass(config: config, child: child);
      default:
        return DGHubCardSimple(config: config, child: child);
    }
  }
}
