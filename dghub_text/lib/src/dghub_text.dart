import 'package:flutter/material.dart';

import 'text_config.dart';

class DGHubText extends StatelessWidget {
  final String label;
  final TextConfig? config;
  const DGHubText(this.label, {this.config, super.key});
  static Text singleLine(String label, {TextConfig? config}) => Text(label,
      style: TextStyle(
          fontSize: config?.size,
          color: config?.color,
          fontWeight: config?.weight ?? FontWeight.bold),
      overflow: TextOverflow.ellipsis,
      maxLines: 1);
  static Text bold(String label, {TextConfig? config}) => Text(label,
      style: TextStyle(
          fontSize: config?.size ?? 16,
          color: config?.color,
          fontWeight: config?.weight ?? FontWeight.bold),
      overflow: TextOverflow.ellipsis,
      maxLines: config?.maxLine);
  @override
  Widget build(BuildContext context) {
    return Text(label, style: TextStyle(color: config?.color));
  }
}
