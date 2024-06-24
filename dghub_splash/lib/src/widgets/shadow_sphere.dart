import 'package:flutter/material.dart';
import 'dart:math' as math;

class ShadowSphere extends StatelessWidget {
  const ShadowSphere({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..rotateX(math.pi / 2.4),
      origin: const Offset(0, 0),
      child: Container(
        width: 300,
        height: 80,
        decoration: BoxDecoration(
          //  color: Colors.black.withOpacity(0.3),
          shape: BoxShape.circle,

          boxShadow: [
            BoxShadow(blurRadius: 25, color: Colors.grey.withOpacity(0.6))
          ],
        ),
      ),
    );
  }
}
