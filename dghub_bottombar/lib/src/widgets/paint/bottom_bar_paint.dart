import 'package:flutter/cupertino.dart';

class BottomBarPaint extends CustomPainter {
  final Color backgroundColor;
  final Color frontedColor;
  BottomBarPaint({required this.backgroundColor, required this.frontedColor});

  @override
  void paint(Canvas canvas, Size size) {
    var dotPoint = Offset(size.width / 2, 2);

    var paint_1 = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    var paint_2 = Paint()
      ..color = frontedColor
      ..style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(7.5, 0, 12, 5);
    path.quadraticBezierTo(size.width / 2, size.height / 2, size.width - 12, 5);
    path.quadraticBezierTo(size.width - 7.5, 0, size.width, 0);
    path.close();
    canvas.drawPath(path, paint_1);
    canvas.drawCircle(dotPoint, 6, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}