import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: LoadingAnimationWidget.hexagonDots(
          color: const Color.fromRGBO(255, 255, 255, 1),
          size: 20,
        ),
      ),
    );
  }
}
