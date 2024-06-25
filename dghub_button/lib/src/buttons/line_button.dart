import 'package:dghub_button/dghub_button.dart';
import 'package:dghub_button/src/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LineButton extends StatefulWidget {
  final ButtonConfig config;
  const LineButton({required this.config, super.key});

  @override
  State<LineButton> createState() => _LineButtonState();
}

class _LineButtonState extends State<LineButton> {
  @override
  void didUpdateWidget(covariant LineButton oldWidget) {
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
          backgroundColor: widget.config.color ?? theme.cardColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Tools.isColorDark(widget.config.color ?? theme.cardColor)
                  ? Colors.white
                  : Colors.black, //color
            ),
            borderRadius:
                BorderRadius.circular(widget.config.radius), // <-- Radius
          ),
          elevation: widget.config.elevation,
          padding: widget.config.padding, // foreground
        ),
        onPressed: widget.config.isLoading ? null : widget.config.onTap,
        child: widget.config.isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballPulse,

                  /// Required, The loading type of the widget
                  colors:
                      Tools.isColorDark(widget.config.color ?? theme.cardColor)
                          ? [Colors.white]
                          : [Colors.black],

                  /// Optional, The color collections
                  strokeWidth: 2,

                  /// Optional, The stroke of the line, only applicable to widget which contains line
                  /// Optional, the stroke backgroundColor
                ))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (widget.config.icon != null) widget.config.icon!,
                  if (widget.config.icon != null)
                    const SizedBox(
                      width: 5,
                    ),
                  Text(
                    widget.config.isError
                        ? widget.config.errorLabel ?? 'Try again'
                        : widget.config.label ?? '',
                    style: TextStyle(
                        color: Tools.isColorDark(
                                widget.config.color ?? theme.cardColor)
                            ? Colors.white
                            : Colors.black,
                        fontSize: widget.config.labelSize),
                    maxLines: 1,
                  ),
                ],
              ),
      ),
    );
  }
}
