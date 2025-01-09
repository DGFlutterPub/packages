import 'package:dghub_icon_button/src/models/icon_button_config.dart';
import 'package:dghub_icon_button/src/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;

class IconButtonOpacity extends StatelessWidget {
  final IconButtonConfig config;
  const IconButtonOpacity({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: config.onTap,
      child: Container(
        child: badge.Badge(
            showBadge: config.badgeLabel != null,
            badgeStyle: badge.BadgeStyle(),
            badgeContent: Text(
              config.badgeLabel ?? '',
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: config.colors.isEmpty
                      ? theme.primaryColor.withOpacity(0.3)
                      : config.colors.first.withOpacity(0.3)),
              padding: EdgeInsets.all(8),
              child: config.isLoading
                  ? ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) => Tools.gradient(
                              config.colors.isEmpty
                                  ? [theme.primaryColor]
                                  : config.colors)
                          .createShader(bounds),
                      child: SizedBox(
                        width: config.size - 5,
                        height: config.size - 5,
                        child: CircularProgressIndicator(
                          color: config.colors.isEmpty
                              ? theme.iconTheme.color
                              : config.colors.first,
                        ),
                      ),
                    )
                  : Icon(
                      config.icon!,
                      size: config.size - 5,
                    ),
            )),
      ),
    );
  }
}
