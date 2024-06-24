import 'package:dghub_permission/src/tools.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageItem extends StatelessWidget {
  final String label;
  final String sublabel;
  final String lottie;
  final String? buttonLabel;
  final bool lottieColorRemove;
  final Function() onTap;
  const PageItem(
      {required this.label,
      required this.sublabel,
      required this.lottie,
      required this.onTap,
      this.buttonLabel,
      this.lottieColorRemove = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (lottieColorRemove)
            LottieBuilder.asset(
              lottie,
            )
          else
            ColorFiltered(
                colorFilter: ColorFilter.mode(
                  theme.primaryColor,
                  BlendMode.modulate,
                ),
                child: LottieBuilder.asset(
                  lottie,
                )),
          const SizedBox(
            height: 20,
          ),
          Text(label,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(
            sublabel,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.primaryColor,
              fixedSize: const Size(120, 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Text(
              buttonLabel ?? 'Allow',
              style: TextStyle(
                  fontSize: 12,
                  color: Tools.isColorDark(theme.primaryColor)
                      ? Colors.white
                      : Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
