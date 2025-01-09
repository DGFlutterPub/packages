import 'container_config.dart';
import 'designs/blur_container.dart';
import 'package:flutter/material.dart';

enum ContainerDesign { blur, simple }

class DGHubContainer extends StatelessWidget {
  final ContainerDesign design;
  final ContainerConfig config;
  const DGHubContainer(
      {this.design = ContainerDesign.blur, required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    return switch (design) {
      ContainerDesign.blur || _ => BlurContainer(config: config),
    };
  }
}
