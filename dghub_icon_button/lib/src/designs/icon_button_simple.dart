import 'package:dghub_icon_button/src/models/icon_button_config.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;

class IconButtonSimple extends StatelessWidget {
  final IconButtonConfig config;
  const IconButtonSimple({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: config.onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: badge.Badge(
            showBadge: config.badgeLabel != null,
            badgeStyle: badge.BadgeStyle(),
            badgeContent: Text(
              config.badgeLabel ?? '',
              style: TextStyle(fontSize: 10),
            ),
            child: Icon(config.icon!, size: config.size)),
      ),
    );
  }
}
