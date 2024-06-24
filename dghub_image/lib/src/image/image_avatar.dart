import 'package:dghub_image/src/tools/enums.dart';
import 'package:flutter/material.dart';

class ImageAvatar extends StatelessWidget {
  final Function()? onTap;
  final DGHubAvatarType type;
  final String load;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit fit;
  const ImageAvatar(
      {required this.fit,
      required this.type,
      required this.radius,
      required this.height,
      required this.width,
      required this.onTap,
      required this.load,
      super.key});

  @override
  Widget build(BuildContext context) {
    Widget textMode(String text) => GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(100),
            ),
            width: width ?? 50,
            height: height ?? 50,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Center(
                  child: Text(text.isEmpty ? 'N' : text[0].toUpperCase(),
                      style:
                          const TextStyle(fontSize: 18, color: Colors.white))),
            ),
          ),
        );

    return textMode(load);
  }
}
