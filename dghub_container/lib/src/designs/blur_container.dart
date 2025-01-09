import 'dart:ui';

import '../container_config.dart';
import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  final ContainerConfig config;
  const BlurContainer({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(config.radius),
              child: Padding(
                padding: EdgeInsets.all(config.padding),
                child: config.child,
              ))),
    );
  }
}
