import 'package:flutter/widgets.dart';

class ContainerConfig {
  Widget child;
  double radius;
  double padding;
  Color? color;
  ContainerConfig(
      {required this.child, this.color, this.padding = 15, this.radius = 15});
}
