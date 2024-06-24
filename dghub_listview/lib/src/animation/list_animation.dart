import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListAnimation extends StatelessWidget {
  final Widget child;
  final bool enabledAnimation;
  const ListAnimation(
      {this.enabledAnimation = true, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    if (enabledAnimation) {
      return AnimationLimiter(child: child);
    }
    return child;
  }
}

class ListAnimationItem extends StatelessWidget {
  final bool enabledAnimation;
  final Widget child;
  final int index;
  const ListAnimationItem(
      {this.enabledAnimation = true,
      required this.child,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (enabledAnimation) {
      return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 600),
          child: SlideAnimation(
              verticalOffset: 50.0, child: FadeInAnimation(child: child)));
    }
    return child;
  }
}
