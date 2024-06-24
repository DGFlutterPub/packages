import 'package:dghub_splash/dghub_splash.dart';
import 'package:dghub_splash/src/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';

import '../tools/tools.dart';

class PhotoOnlySplash extends StatefulWidget {
  final DGHubSplashStyle style;
  final DGHubSplashData data;
  final bool devMode;
  const PhotoOnlySplash(
      {this.devMode = false,
      required this.data,
      required this.style,
      super.key});

  @override
  State<PhotoOnlySplash> createState() => _PhotoOnlySplashState();
}

class _PhotoOnlySplashState extends State<PhotoOnlySplash>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    if (animationController.status == AnimationStatus.forward ||
        animationController.status == AnimationStatus.completed) {
      // animationController.reverse();
    } else {
      animationController.forward();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.devMode) {
      if (Tools.isDarkTheme(context)) {
        Tools.statusBarColor(
            Color(int.parse(widget.style.backgroundColorDarkTheme)));
        if (widget.data.isError) {
          Tools.navBarColor(Color(int.parse(widget.style.logoColorDarkTheme)));
        } else {
          Tools.navBarColor(
              Color(int.parse(widget.style.backgroundColorDarkTheme)));
        }
      } else {
        Tools.statusBarColor(Color(int.parse(widget.style.backgroundColor)));
        if (widget.data.isError) {
          Tools.navBarColor(Color(int.parse(widget.style.logoColor)));
        } else {
          Tools.navBarColor(Color(int.parse(widget.style.backgroundColor)));
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  color: Tools.isDarkTheme(context)
                      ? Color(int.parse(widget.style.backgroundColorDarkTheme))
                      : Color(int.parse(widget.style.backgroundColor)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: CircularRevealAnimation(
                      animation: animation,
                      centerAlignment: Alignment.center,
                      child: Image.asset(
                        widget.data.backgroundPhoto ?? '',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        errorBuilder: (c, d, s) {
                          return const SizedBox();
                        },
                      )
                      //                minRadius: 12,
                      //                maxRadius: 200,
                      )),
            ),
            if (widget.data.isError)
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Wrap(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Color(int.parse(widget.style.logoColor)),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                    child: Text(
                                      'Error connecting',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  ),
                                  if (widget.data.onTapAgent != null)
                                    DGIconButton(
                                        iconColor: Colors.white,
                                        icon: Icons.support_agent,
                                        iconSize: 25,
                                        onTap: widget.data.onTapAgent)
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: widget.data.onTryAgain,
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 8, 15, 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5, color: Colors.white),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: const Text(
                                    'Try again',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ],
                  ))
          ],
        ),
      ),
    );
  }
}
