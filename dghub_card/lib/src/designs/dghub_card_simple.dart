import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../../tools/tools.dart';
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
        alignment: config?.alignment,
        margin: config?.margin,
        width: config?.width,
        height: config?.height,
        padding: config?.padding ?? const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: config?.border == null
              ? null
              : GradientBoxBorder(
                  width: config?.border ?? 0,
                  gradient: Tools.gradient(config?.borderColors ?? []) ??
                      LinearGradient(
                          colors: [Colors.transparent, Colors.transparent])),
          borderRadius: config?.radius ?? BorderRadius.circular(15),
          gradient: Tools.gradient(config?.colors ?? [theme.cardColor]),
        ),
        child: child,
      ),
    );
  }
}
