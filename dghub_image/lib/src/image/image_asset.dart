import 'package:flutter/material.dart';
import '../loading/loading_shimmer.dart';

class ImageAsset extends StatelessWidget {
  final Function()? onTap;
  final String load;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit fit;
  const ImageAsset(
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
        child: Image.asset(
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
