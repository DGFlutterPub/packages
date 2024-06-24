import 'package:flutter/material.dart';

class TabIndicator extends Decoration {
  final double radius;

  final Color color;

  final double indicatorHeight;

  const TabIndicator({
    this.radius = 8,
    this.indicatorHeight = 4,
    this.color = Colors.blue,
  });

  @override
  Painter createBoxPainter([VoidCallback? onChanged]) {
    return Painter(
      this,
      onChanged,
      radius,
      color,
      indicatorHeight,
    );
  }
}

class Painter extends BoxPainter {
  final TabIndicator decoration;
  final double radius;
  final Color color;
  final double indicatorHeight;

  Painter(
    this.decoration,
    VoidCallback? onChanged,
    this.radius,
    this.color,
    this.indicatorHeight,
  ) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Paint paint = Paint();
    double xAxisPos = offset.dx + configuration.size!.width / 2;
    double yAxisPos =
        offset.dy + configuration.size!.height - indicatorHeight / 2;
    paint.color = color;

    RRect fullRect = RRect.fromRectAndCorners(
      Rect.fromCenter(
        center: Offset(xAxisPos, yAxisPos),
        width: configuration.size!.width / 3,
        height: indicatorHeight,
      ),
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
    );

    canvas.drawRRect(fullRect, paint);
  }
}
