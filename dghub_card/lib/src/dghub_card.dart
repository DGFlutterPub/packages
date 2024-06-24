import 'package:flutter/material.dart';
import 'card_config.dart';
import 'designs/dghub_card_simple.dart';

enum DGHubCardDesigns { simple, blur }

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
      case DGHubCardDesigns.simple:
        return DGHubCardSimple(config: config, child: child);
      default:
        return DGHubCardSimple(config: config, child: child);
    }
  }
}
