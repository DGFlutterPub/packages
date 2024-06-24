import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../loading/loading_shimmer.dart';

class ImageNetwork extends StatelessWidget {
  final Function()? onTap;
  final String load;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit fit;
  final bool enableCacheMode;
  const ImageNetwork(
      {required this.fit,
      required this.load,
      required this.radius,
      required this.height,
      required this.width,
      required this.onTap,
      required this.enableCacheMode,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          imageUrl: load,
          fit: fit,
          width: width,
          height: height,
          progressIndicatorBuilder: (context, widget, i) {
            return LoadingShimmer(
              width: width,
              height: height,
            );
          },
          errorWidget: (context, load, error) {
            return LoadingShimmer(
              width: width,
              height: height,
            );
          },
        ));
  }
}
