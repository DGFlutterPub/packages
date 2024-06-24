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
    const defaultColor = Colors.white;
    return InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
            padding: padding,
            child: Icon(
              icon,
              color: color ?? defaultColor,
              size: 25,
            )));
  }
}
