import 'package:dghub_bottombar/src/model/bottombar_config.dart';
import 'package:flutter/material.dart';
import '../../tools/tools.dart';
import '../../widgets/icon_button.dart';

class LocationDesignBottomBar extends StatefulWidget {
  final BottomBarConfig config;
  const LocationDesignBottomBar({super.key, required this.config});

  @override
  State<LocationDesignBottomBar> createState() =>
      _LocationDesignBottomBarState();
}

class _LocationDesignBottomBarState extends State<LocationDesignBottomBar>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  AnimatedContainer navigationBar({required ThemeData theme}) {
    return AnimatedContainer(
        height: widget.config.height ?? 90,
        duration: const Duration(milliseconds: 400),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < widget.config.items.length; i++)
              iconBtn(index: i, theme: theme),
          ],
        ));
  }

  iconBtn({required int index, required ThemeData theme}) {
    bool isActive = currentIndex == index ? true : false;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          setState(() => currentIndex = index);
          widget.config.result(index);
        },
        child: Container(
          color: isActive
              ? Tools.isDarkTheme(context)
                  ? widget.config.backgroundColorDarkTheme
                  : widget.config.backgroundColor
              : Tools.isDarkTheme(context)
                  ? widget.config.backgroundColorDarkTheme == null
                      ? theme.primaryColor
                      : widget.config.backgroundColorDarkTheme!.withOpacity(0.5)
                  : widget.config.backgroundColor == null
                      ? theme.primaryColor
                      : widget.config.backgroundColor!.withOpacity(0.5),
          //width: 75.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              DGIconButton(
                  lottieIcon: widget.config.items[index].selectedLottieIcon,
                  enabledBadage: widget.config.items[index].enabledBadage,
                  badageLabel: widget.config.items[index].badageLabel,
                  badageColor: widget.config.items[index].badageColor,
                  iconColor: isActive
                      ? Tools.isDarkTheme(context)
                          ? widget.config.selectedIconColorDarkTheme ??
                              theme.primaryColor
                          : widget.config.selectedIconColor ??
                              theme.primaryColor
                      : Tools.isDarkTheme(context)
                          ? widget.config.unSelectedIconColorDarkTheme
                          : widget.config.unSelectedIconColor,
                  icon: widget.config.items[index].selectedIcon,
                  iconSize: 20),
              Text(widget.config.items[index].label,
                  style: TextStyle(
                      fontSize: 12,
                      color: isActive
                          ? Tools.isDarkTheme(context)
                              ? widget.config.selectedLabelColorDarkTheme ??
                                  theme.primaryColor
                              : widget.config.selectedLabelColor ??
                                  theme.primaryColor
                          : Tools.isDarkTheme(context)
                              ? widget.config.unSelectedLabelColorDarkTheme
                              : widget.config.unSelectedLabelColor)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.config.onTap,
      child: IgnorePointer(
          ignoring: widget.config.onTap == null ? false : true,
          child: navigationBar(theme: theme)),
    );
  }
}
