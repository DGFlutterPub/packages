import 'package:dghub_button/dghub_button.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../tools/tools.dart';

class CircleButton extends StatefulWidget {
  final ButtonConfig config;
  const CircleButton({required this.config, super.key});

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  void didUpdateWidget(covariant CircleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: widget.config.margin,
      width: widget.config.width,
      height: widget.config.height,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.config.isError
                ? Colors.red
                : widget.config.colors?.first ?? theme.primaryColor,
            shape: const CircleBorder(),
            elevation: widget.config.elevation,
            padding: widget.config.padding, // foreground
          ),
          onPressed: widget.config.isLoading ? null : widget.config.onTap,
          child: widget.config.isLoading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballSpinFadeLoader,

                    /// Required, The loading type of the widget
                    colors: Tools.isColorDark(
                            widget.config.colors?.first ?? theme.primaryColor)
                        ? [Colors.white]
                        : [Colors.black],

                    /// Optional, The color collections
                    strokeWidth: 2,

                    /// Optional, The stroke of the line, only applicable to widget which contains line
                    /// Optional, the stroke backgroundColor
                  ))
              : widget.config.icon == null
                  ? Text(
                      widget.config.isError
                          ? widget.config.errorLabel ?? 'Try again'
                          : widget.config.label ?? '',
                      style: TextStyle(
                          color: Tools.isColorDark(
                                  widget.config.colors?.first ??
                                      theme.primaryColor)
                              ? Colors.white
                              : Colors.black,
                          fontSize: widget.config.labelSize),
                      maxLines: 1,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (widget.config.icon != null) widget.config.icon!,
                        if (widget.config.label != null)
                          const SizedBox(
                            height: 5,
                          ),
                        if (widget.config.label != null)
                          Text(
                            widget.config.isError
                                ? widget.config.errorLabel ?? 'Try again'
                                : widget.config.label!,
                            style: TextStyle(
                                color: Tools.isColorDark(
                                        widget.config.colors?.first ??
                                            theme.primaryColor)
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: widget.config.labelSize),
                            maxLines: 1,
                          )
                      ],
                    )),
    );
  }
}
