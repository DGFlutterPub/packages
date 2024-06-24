import 'dart:io';

import 'package:flutter/material.dart';
import '../loading/loading_shimmer.dart';

class ImageFile extends StatelessWidget {
  final Function()? onTap;
  final File load;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit fit;
  const ImageFile(
      {required this.fit,
      required this.load,
      required this.radius,
      required this.height,
      required this.width,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.file(
          load,
          fit: fit,
          width: width,
          height: height,
          errorBuilder: (context, url, error) {
            return LoadingShimmer(
              width: width,
              height: height,
            );
          },
        ));
  }
}
