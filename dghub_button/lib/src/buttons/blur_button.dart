import 'package:dghub_button/dghub_button.dart';
import 'package:dghub_button/src/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class BlurButton extends StatelessWidget {
  final ButtonConfig config;
  const BlurButton({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: config.onTap,
      child: Wrap(
        direction: Axis.vertical,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: theme.cardColor),
                gradient: Tools.gradient(
                    config.colors ?? [theme.cardColor.withOpacity(0.5)]),
                borderRadius: BorderRadius.circular(20)),
            child: Container(
              margin: EdgeInsets.all(3),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  /* Positioned.fill(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                                child: const SizedBox(),
                              ),
                            ),*/
                  if (config.isLoading)
                    SizedBox(
                        width: 20,
                        height: 20,
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballPulse,

                          /// Required, The loading type of the widget
                          colors: Tools.isColorDark(theme.cardColor)
                              ? [Colors.white]
                              : [Colors.black],

                          /// Optional, The color collections
                          strokeWidth: 2,

                          /// Optional, The stroke of the line, only applicable to widget which contains line
                          /// Optional, the stroke backgroundColor
                        ))
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(config.label.toString().toUpperCase(),
                            style: TextStyle()),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward,
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
