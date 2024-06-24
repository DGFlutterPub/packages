import 'package:flutter/material.dart';

class MouseScaleAnimation extends StatefulWidget {
  final Widget child;
  final double width;
  final double height;
  const MouseScaleAnimation(
      {required this.width,
      required this.height,
      required this.child,
      super.key});

  @override
  State<MouseScaleAnimation> createState() => _MouseScaleAnimationState();
}

class _MouseScaleAnimationState extends State<MouseScaleAnimation> {
  bool isHover = false;
  Offset mousPos = const Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
          mousPos = const Offset(0, 0);
        });
      },
      onHover: (event) {
        setState(() {
          mousPos += event.delta;
          mousPos *= 0.12;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
          mousPos = const Offset(0, 0);
        });
      },
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeOutCubic,
                width: widget.width,
                height: isHover
                    ? (widget.height / 2) + widget.height
                    : widget.height,
                child: widget.child),
          ],
        ),
      ),
    );
  }
}
