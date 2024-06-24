import 'package:flutter/material.dart';

class DGText extends StatelessWidget {
  final String label;
  final double size;
  final FontWeight weight;
  final Color? color;
  const DGText(
      {this.weight = FontWeight.normal,
      required this.label,
      this.size = 12,
      this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          fontWeight: weight,
          color: color,
          fontSize: size,
          overflow: TextOverflow.ellipsis),
    );
  }
}
