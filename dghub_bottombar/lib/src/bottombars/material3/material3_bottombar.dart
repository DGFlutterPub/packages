import 'package:dghub_bottombar/src/model/bottombar_config.dart';
import 'package:dghub_bottombar/src/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import '../../tools/tools.dart';

class Material3BottomBar extends StatefulWidget {
  final BottomBarConfig config;
  const Material3BottomBar({super.key, required this.config});

  @override
  State<Material3BottomBar> createState() => _Material3BottomBarState();
}

class _Material3BottomBarState extends State<Material3BottomBar>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.config.onTap,
      child: IgnorePointer(
          ignoring: widget.config.onTap == null ? false : true,
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
                (Set<WidgetState> states) => IconThemeData(
                  color: states.contains(WidgetState.selected)
                      ? Tools.isDarkTheme(context)
                          ? widget.config.selectedIconColorDarkTheme
                          : widget.config.selectedIconColor
                      : Tools.isDarkTheme(context)
                          ? widget.config.unSelectedIconColorDarkTheme
                          : widget.config.unSelectedIconColor,
                ),
              ),
              labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                (Set<WidgetState> states) =>
                    states.contains(WidgetState.selected)
                        ? TextStyle(
                            color: Tools.isDarkTheme(context)
                                ? widget.config.selectedLabelColorDarkTheme
                                : widget.config.selectedLabelColor)
                        : TextStyle(
                            color: Tools.isDarkTheme(context)
                                ? widget.config.unSelectedLabelColorDarkTheme
                                : widget.config.unSelectedLabelColor),
              ),
            ),
            child: NavigationBar(
                indicatorColor: Tools.isDarkTheme(context)
                    ? widget.config.cardColorDarkTheme
                    : widget.config.cardColor,
                //  height: widget.config.height ?? 70,
                elevation: 0,
                backgroundColor: Tools.isDarkTheme(context)
                    ? widget.config.backgroundColorDarkTheme
                    : widget.config.backgroundColor,
                destinations: widget.config.items
                    .map((data) => NavigationDestination(
                        label: data.label,
                        icon: DGIconButton(
                            badageColor: data.badageColor,
                            badageLabel: data.badageLabel,
                            enabledBadage: data.enabledBadage,
                            icon: data.unSelectedIcon,
                            lottieIcon: data.selectedLottieIcon,
                            iconSize: 20),
                        selectedIcon: Icon(data.selectedIcon)))
                    .toList(),
                selectedIndex: currentIndex,
                onDestinationSelected: (index) {
                  currentIndex = index;
                  setState(() {});
                  widget.config.result(index);
                }),
          )),
    );
  }
}
