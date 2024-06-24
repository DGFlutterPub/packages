import 'package:flutter/material.dart';

import '../card_config.dart';

class DGHubCardSimple extends StatelessWidget {
  final CardConfig? config;
  final Widget child;
  const DGHubCardSimple({this.config, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: config?.onTap,
      child: Container(
        width: config?.width,
        height: config?.height,
        padding: config?.padding ?? const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: config?.border ?? BorderRadius.circular(15),
            color: config?.color ?? theme.cardColor),
        child: child,
      ),
    );
  }
}
