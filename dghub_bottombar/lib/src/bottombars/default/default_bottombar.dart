import 'package:dghub_bottombar/src/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../dghub_bottombar.dart';
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
          color: theme.cardColor,
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
                child: widget.config.items[i].enabledFill
                    ? Container(
                        height: (widget.config.height ?? 70) - 20,
                        width: (widget.config.height ?? 70) - 20,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            gradient: Tools.gradient(
                                widget.config.selectedIconColors ??
                                    [theme.primaryColor]),
                            borderRadius: BorderRadius.circular(100)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DGIconButton(
                                lottieIcon:
                                    widget.config.items[i].selectedLottieIcon,
                                enabledBadage:
                                    widget.config.items[i].enabledBadage,
                                badageLabel: widget.config.items[i].badageLabel,
                                badageColor: widget.config.items[i].badageColor,
                                iconColors:
                                    Tools.isColorDark(theme.primaryColor)
                                        ? [Colors.white]
                                        : [Colors.black],
                                icon: (currentIndex == i ? true : false)
                                    ? widget.config.items[i].selectedIcon
                                    : widget.config.items[i].unSelectedIcon ??
                                        widget.config.items[i].selectedIcon,
                                iconSize: 20)
                            /*  SizedBox(
                              height: 2,
                            ),
                            Text(
                              widget.config.items[i].label,
                              style: TextStyle(
                                color: Tools.isColorDark(theme.primaryColor)
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            )*/
                          ],
                        ),
                      )
                    : iconBtn(index: i, theme: theme),
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
              child: /* isActive
                  ? CustomPaint(
                      painter: BottomBarPaint(
                          backgroundColor: theme.primaryColor.withOpacity(0.4),
                          frontedColor: theme.primaryColor),
                    )
                  : */
                  const SizedBox(),
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
                      iconColors: isActive
                          ? widget.config.selectedIconColors ??
                              [theme.primaryColor]
                          : widget.config.unSelectedIconColors ?? [Colors.grey],
                      icon: isActive
                          ? widget.config.items[index].selectedIcon
                          : widget.config.items[index].unSelectedIcon ??
                              widget.config.items[index].selectedIcon,
                      iconSize: 20))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(widget.config.items[index].label,
                  style: TextStyle(
                      fontSize: 12,
                      color: isActive
                          ? widget.config.selectedLabelColors?.first ??
                              theme.primaryColor
                          : widget.config.selectedLabelColors?.first ??
                              theme.primaryColor)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: theme.cardColor,
        systemNavigationBarIconBrightness:
            Tools.isDarkTheme(context) ? Brightness.light : Brightness.dark,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.config.onTap,
        child: IgnorePointer(
            ignoring: widget.config.onTap == null ? false : true,
            child: navigationBar(theme: theme)),
      ),
    );
  }
}
