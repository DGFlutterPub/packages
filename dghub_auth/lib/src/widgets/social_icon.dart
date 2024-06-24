import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final Function()? onTap;
  final String loadAsset;
  final Color? backgroundColor;
  final EdgeInsets margin;
  const SocialIcon(
      {this.backgroundColor,
      this.onTap,
      required this.loadAsset,
      this.margin = const EdgeInsets.all(0),
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: margin,
          padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          // decoration: BoxDecoration(
          //   border: Border.all(width: 0.5, color: Colors.grey),
          //     borderRadius: BorderRadius.circular(10),
          //     color: backgroundColor ?? Theme.of(context).cardColor),
          child: Image.asset(
            loadAsset,
            height: 20,
          ),
        ));
  }
}
