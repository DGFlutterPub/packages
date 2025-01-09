import 'package:dghub_card/src/card_config.dart';
import 'package:dghub_card/tools/animated_loading_border_widget.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../../tools/tools.dart';

class DGHubAnimatedBorder extends StatefulWidget {
  final Widget child;
  final CardConfig? config;
  const DGHubAnimatedBorder({
    required this.child,
    required this.config,
    super.key,
  });

  @override
  _DGHubAnimatedBorderState createState() => _DGHubAnimatedBorderState();
}

class _DGHubAnimatedBorderState extends State<DGHubAnimatedBorder>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: widget.config?.onTap,
      child: Padding(
        padding: widget.config?.margin ?? EdgeInsets.all(0),
        child: AnimatedLoadingBorder(
          cornerRadius: 15,
          borderWidth: 3,
          borderColor: Tools.isDarkTheme(context) ? Colors.white : Colors.black,
          child: Container(
            alignment: widget.config?.alignment,
            height: widget.config?.height,
            width: widget.config?.width,
            decoration: BoxDecoration(
                border: widget.config?.border == null
                    ? null
                    : GradientBoxBorder(
                        width: widget.config?.border ?? 0,
                        gradient:
                            Tools.gradient(widget.config?.borderColors ?? []) ??
                                LinearGradient(colors: [
                                  Colors.transparent,
                                  Colors.transparent
                                ])),
                gradient: widget.config?.colors == null ||
                        widget.config!.colors.isEmpty
                    ? LinearGradient(colors: [theme.cardColor, theme.cardColor])
                    : widget.config?.colors.length == 1
                        ? LinearGradient(colors: [
                            widget.config!.colors.first,
                            widget.config!.colors.first
                          ])
                        : LinearGradient(colors: widget.config!.colors),
                borderRadius:
                    widget.config?.radius ?? BorderRadius.circular(15)),
            padding: widget.config?.padding ?? EdgeInsets.all(15),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
