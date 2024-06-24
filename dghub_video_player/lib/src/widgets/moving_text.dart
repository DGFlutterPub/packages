import 'package:flutter/material.dart';

class MovingText extends StatefulWidget {
  final double width;
  final double height;
  final double xPosition;
  final double yPosition;
  final int ballRad;
  final double xVector;
  final double yVector;
  final double xSpeed;
  final double ySpeed;
  final String label;
  final Color labelColor;
  final double labelSize;
  const MovingText({
    Key? key,
    this.width = 300,
    this.height = 500,
    this.xPosition = 100,
    this.yPosition = 200,
    this.ballRad = 1,
    this.xVector = 1,
    this.yVector = 1,
    this.xSpeed = 1.2,
    this.ySpeed = 1.2,
    required this.label,
    this.labelColor = Colors.white,
    this.labelSize = 12,
  }) : super(key: key);

  @override
  State<MovingText> createState() => _MovingTextState();
}

class _MovingTextState extends State<MovingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late double xPos;
  late double yPos;
  late double xVec;
  late double yVec;

  @override
  void initState() {
    super.initState();

    xPos = widget.xPosition;
    yPos = widget.yPosition;
    xVec = widget.xVector;
    yVec = widget.yVector;

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1));
    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          if (xPos >= (widget.width - widget.ballRad) ||
              xPos <= widget.ballRad) {
            xVec *= -1;
          }
          if (yPos >= (widget.height - widget.ballRad) ||
              yPos <= widget.ballRad) {
            yVec *= -1;
          }

          xPos += widget.xSpeed * xVec;
          yPos += widget.ySpeed * yVec;
        });
        _animationController.value = 0;
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return IgnorePointer(
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: CustomPaint(
              painter: CText(
                  labelColor: widget.labelColor,
                  labelSize: widget.labelSize,
                  label: widget.label,
                  animationValue: _animationController.value,
                  xVector: xVec,
                  yVector: yVec,
                  xPosition: xPos,
                  yPosition: yPos,
                  ballRad: widget.ballRad,
                  xSpeed: widget.xSpeed,
                  ySpeed: widget.ySpeed),
            ),
          ),
        );
      },
    );
  }
}

class CText extends CustomPainter {
  final double animationValue;
  final double xPosition;
  final double yPosition;
  final double xVector;
  final double yVector;
  final int ballRad;
  final double xSpeed;
  final double ySpeed;
  final String label;
  final Color labelColor;
  final double labelSize;
  CText({
    required this.animationValue,
    required this.xPosition,
    required this.yPosition,
    required this.xVector,
    required this.yVector,
    required this.ballRad,
    required this.xSpeed,
    required this.ySpeed,
    required this.label,
    required this.labelColor,
    required this.labelSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      color: labelColor,
      fontSize: labelSize,
    );
    final textSpan = TextSpan(
      text: label,
      style: textStyle,
    );
    final paint = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    paint.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    paint.paint(
        canvas,
        Offset(
          xPosition + animationValue * xSpeed * xVector,
          yPosition + animationValue * ySpeed * yVector,
        ));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
