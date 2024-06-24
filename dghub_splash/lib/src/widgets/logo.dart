import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  final double height;
  final String? load;
  final Color? color;
  const Logo({this.color, required this.height, this.load, super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    //..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: ColorFiltered(
        colorFilter: widget.color == null
            ? const ColorFilter.mode(Colors.white, BlendMode.srcATop)
            : ColorFilter.mode(widget.color!, BlendMode.modulate),
        child: Image.asset(
          widget.load ?? 'packages/dghub_splash/assets/logo.png',
          height: widget.height,
        ),
      ),
    );
  }
}
