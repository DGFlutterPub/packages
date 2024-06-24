import 'package:flutter/material.dart';

class ProgressColors {
  ProgressColors({
    Color playedColor = Colors.white,
    Color bufferedColor = const Color.fromRGBO(30, 30, 200, 0.2),
    Color handleColor = Colors.white,
    Color backgroundColor = const Color.fromRGBO(200, 200, 200, 0.5),
  })  : playedPaint = Paint()..color = playedColor,
        bufferedPaint = Paint()..color = bufferedColor,
        handlePaint = Paint()..color = handleColor,
        backgroundPaint = Paint()..color = backgroundColor;

  final Paint playedPaint;
  final Paint bufferedPaint;
  final Paint handlePaint;
  final Paint backgroundPaint;
}
