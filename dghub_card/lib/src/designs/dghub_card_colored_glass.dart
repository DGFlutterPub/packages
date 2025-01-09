import 'package:flutter/material.dart';

import '../../dghub_card.dart';

class DGHubCardColoredGlass extends StatelessWidget {
  final Widget child;
  final CardConfig? config;
  const DGHubCardColoredGlass(
      {required this.child, required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: config?.onTap,
      child: Container(
        padding: config?.padding ?? const EdgeInsets.all(15),
        alignment: Alignment.center,
        width: config?.width,
        height: config?.height,
        decoration: BoxDecoration(
          border: Border.all(
              width: 0.5,
              color: config?.colors.first.withOpacity(0.3) ??
                  theme.primaryColor.withOpacity(0.3)),
          borderRadius: config?.radius ?? BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            config?.colors.first.withOpacity(0.3) ??
                theme.primaryColor.withOpacity(0.3),
            Colors.transparent
          ]),
        ),
        child: child,
      ),
    );
  }
}
