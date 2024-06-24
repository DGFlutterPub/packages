import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:lottie/lottie.dart';

class DGIconButton extends StatelessWidget {
  final IconData? icon;
  final String? lottieIcon;
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
      this.badageColor,
      this.badageLabel,
      this.badageLabelColor,
      this.enabledBadage = false,
      this.backgroundColor,
      this.backgroundRadius = 0,
      required this.lottieIcon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(backgroundRadius)),
      padding: const EdgeInsets.all(5),
      child: badges.Badge(
        badgeStyle: badges.BadgeStyle(badgeColor: badageColor ?? Colors.blue),
        //  position: badges.BadgePosition.topEnd(top: -10, end: -12),
        showBadge: enabledBadage,
        badgeContent: Text(
          badageLabel ?? '0',
          style: TextStyle(color: badageColor ?? Colors.white, fontSize: 10),
        ),
        child: lottieIcon != null
            ? LottieBuilder.asset(
                width: iconSize, height: iconSize, lottieIcon!)
            : Icon(icon, size: iconSize, color: iconColor),
      ),
    );
  }
}
