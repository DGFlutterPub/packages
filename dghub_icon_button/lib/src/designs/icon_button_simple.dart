import 'package:dghub_icon_button/src/models/icon_button_config.dart';
import 'package:dghub_icon_button/src/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;

class IconButtonSimple extends StatelessWidget {
  final IconButtonConfig config;
  const IconButtonSimple({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) => Tools.gradient(
                      config.colors.isEmpty
                          ? [theme.primaryColor]
                          : config.colors)
                  .createShader(bounds),
              child: config.isLoading
                  ? SizedBox(
                      width: config.size,
                      height: config.size,
                      child: CircularProgressIndicator(
                        color: config.colors.isEmpty
                            ? theme.iconTheme.color
                            : config.colors.first,
                      ),
                    )
                  : Icon(
                      config.icon!,
                      size: config.size,
                    ),
            )),
      ),
    );
  }
}
