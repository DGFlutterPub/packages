import 'package:dghub_bottombar/src/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import '../../model/bottombar_config.dart';
import '../../tools/tools.dart';
import '../../widgets/paint/bottom_bar_paint.dart';

class DefaultDesignBottomBar extends StatefulWidget {
  final BottomBarConfig config;
  const DefaultDesignBottomBar({super.key, required this.config});

  @override
  State<DefaultDesignBottomBar> createState() => _DefaultDesignBottomBarState();
}

class _DefaultDesignBottomBarState extends State<DefaultDesignBottomBar>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  AnimatedContainer navigationBar({required ThemeData theme}) {
    return AnimatedContainer(
        height: widget.config.height ?? 70,
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          color: Tools.isDarkTheme(context)
              ? widget.config.backgroundColorDarkTheme
              : widget.config.backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < widget.config.items.length; i++)
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() => currentIndex = i);
                  widget.config.result(i);
                },
                child: iconBtn(index: i, theme: theme),
              ),
          ],
        ));
  }

  SizedBox iconBtn({required int index, required ThemeData theme}) {
    bool isActive = currentIndex == index ? true : false;
    var height = isActive ? 40.0 : 0.0;
    var width = isActive ? 50.0 : 0.0;
    return SizedBox(
      //width: 75.0,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              height: height,
              width: width,
              duration: const Duration(milliseconds: 600),
              child: isActive
                  ? CustomPaint(
                      painter: BottomBarPaint(
                          backgroundColor: Tools.isDarkTheme(context)
                              ? widget.config.backgroundColorDarkTheme ??
                                  theme.colorScheme.background
                              : widget.config.backgroundColor ??
                                  theme.colorScheme.background,
                          frontedColor: Tools.isDarkTheme(context)
                              ? widget.config.selectedIconColorDarkTheme ??
                                  theme.primaryColor
                              : widget.config.selectedIconColor ??
                                  theme.primaryColor),
                    )
                  : const SizedBox(),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: DGIconButton(
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
                      iconSize: 20))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(widget.config.items[index].label,
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
            ),
          ),
        ],
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
