import 'package:dghub_splash/dghub_splash.dart';
import 'package:dghub_splash/src/widgets/icon_button.dart';
import 'package:dghub_splash/src/widgets/logo.dart';
import 'package:dghub_splash/src/widgets/shadow_sphere.dart';
import 'package:flutter/material.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../tools/tools.dart';

class CircleSplash extends StatefulWidget {
  final DGHubSplashStyle style;
  final DGHubSplashData data;
  final bool devMode;
  const CircleSplash(
      {this.devMode = false,
      required this.data,
      required this.style,
      super.key});

  @override
  State<CircleSplash> createState() => _CircleSplashState();
}

class _CircleSplashState extends State<CircleSplash>
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

    return SafeArea(
      child: Scaffold(
        body: SafeArea(
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
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Tools.isDarkTheme(context)
                            ? Color(int.parse(widget.style.logoColorDarkTheme))
                            : Color(int.parse(widget.style.logoColor)),
                        BlendMode.modulate,
                      ),
                      child: Lottie.asset(
                        'packages/dghub_splash/assets/circle.json',
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome to',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.data.appname,
                              style: GoogleFonts.satisfy(
                                color: Tools.isDarkTheme(context)
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.5,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  color:
                                      Color(int.parse(widget.style.logoColor)),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Logo(
                                load: widget.data.logo,
                                color: Color(
                                    int.parse(widget.style.backgroundColor)),
                                height: widget.style.logoSize,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const ShadowSphere()
                          ],
                        ),
                      ],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        onTap: widget.data.onTryAgain,
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 8, 15, 8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5,
                                                color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: const Text(
                                            'Try again',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                            ],
                          ))
                    else
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.center,
                              direction: Axis.vertical,
                              children: [
                                Text(
                                  widget.data.site,
                                  style: TextStyle(
                                      color: Tools.isDarkTheme(context)
                                          ? Colors.white.withOpacity(0.5)
                                          : Colors.black.withOpacity(0.5),
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ))
                  ],
                ),
                //                minRadius: 12,
                //                maxRadius: 200,
              )),
        ),
      ),
    );
  }
}
