import 'package:dghub_icon_button/src/tools/tools.dart';
import 'package:flutter/material.dart';

import '../../dghub_icon_button.dart';
import 'icon_button_simple.dart';

class IconButtonBlur extends StatelessWidget {
  final IconButtonConfig config;
  const IconButtonBlur({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color:
                  Tools.isDarkTheme(context) ? Colors.white : theme.cardColor),
          borderRadius: BorderRadius.circular(100),
          color: theme.cardColor.withOpacity(0.5)),
      padding: EdgeInsets.all(0),
      child: IconButtonSimple(
          config: IconButtonConfig(
        colors: Tools.isDarkTheme(context) ? [Colors.white] : [theme.cardColor],
        icon: config.icon,
        size: config.size,
        onTap: config.onTap,
      )),
    );
  }
}
