import 'package:dghub_button/dghub_button.dart';
import 'package:dghub_button/src/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shimmer_animation/shimmer_animation.dart' as shimmer;

class SimpleButton extends StatefulWidget {
  final ButtonConfig config;
  const SimpleButton({required this.config, super.key});

  @override
  State<SimpleButton> createState() => _SimpleButtonState();
}

class _SimpleButtonState extends State<SimpleButton> {
  @override
  void didUpdateWidget(covariant SimpleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: widget.config.margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.config.radius),
        child: shimmer.Shimmer(
          enabled: widget.config.shimmer,
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(widget.config.radius),
            onTap: widget.config.isLoading || !widget.config.enabled
                ? null
                : widget.config.onTap,
            child: Container(
              alignment: Alignment.center,
              padding: widget.config.padding,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.config.radius),
                  border: widget.config.lineMode
                      ? GradientBoxBorder(
                          width: 3,
                          gradient: Tools.gradient(widget.config.colors ??
                                  [theme.primaryColor]) ??
                              LinearGradient(colors: [
                                Colors.transparent,
                                Colors.transparent
                              ]))
                      : null,
                  gradient: widget.config.lineMode
                      ? null
                      : Tools.gradient(
                          widget.config.colors ?? [theme.primaryColor])),
              width: widget.config.width,
              height: widget.config.height,
              child: widget.config.isLoading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballPulse,

                        /// Required, The loading type of the widget
                        colors: Tools.isColorDark(widget.config.colors?.first ??
                                theme.primaryColor)
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
                              ? widget.config.errorLabel ??
                                  'Try again'.toUpperCase()
                              : widget.config.label?.toUpperCase() ?? '',
                          style: TextStyle(
                              color: widget.config.enabled
                                  ? Tools.isColorDark(
                                          widget.config.colors?.first ??
                                              theme.primaryColor)
                                      ? Colors.white
                                      : Colors.black
                                  : Colors.grey,
                              fontSize: widget.config.labelSize),
                          maxLines: 1,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
