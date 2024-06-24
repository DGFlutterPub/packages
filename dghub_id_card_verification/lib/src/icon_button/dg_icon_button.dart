import 'package:dghub_id_card_verification/src/tools.dart';
import 'package:flutter/material.dart';

class DGIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  final EdgeInsets padding;
  final Color? color;
  const DGIconButton(
      {required this.icon,
      required this.onTap,
      this.color,
      this.padding = const EdgeInsets.all(8),
      super.key});

  @override
  Widget build(BuildContext context) {
    final defaultColor =
        Tools.isDarkTheme(context) ? Colors.white : Colors.black;
    return InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
            padding: padding, child: Icon(icon, color: color ?? defaultColor)));
  }
}
