import 'package:flutter/material.dart';

class DGIconButton extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  final String? badageLabel;
  final bool enabledBadage;
  final Color? badageColor;
  final Color? badageLabelColor;
  final double iconSize;
  final Color? iconColor;
  final Color? backgroundColor;
  final double backgroundRadius;
  const DGIconButton(
      {required this.icon,
      required this.iconSize,
      this.iconColor,
      required this.onTap,
      this.badageColor,
      this.badageLabel,
      this.badageLabelColor,
      this.enabledBadage = false,
      this.backgroundColor,
      this.backgroundRadius = 0,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(backgroundRadius)),
          padding: const EdgeInsets.all(5),
          child: Icon(icon, size: iconSize, color: iconColor)),
    );
  }
}
