import 'package:dghub_appbar/src/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/appbar_config.dart';

class AppBarSimple extends StatefulWidget {
  final AppBarConfig config;
  const AppBarSimple({super.key, required this.config});

  @override
  State<AppBarSimple> createState() => _AppBarSimpleState();
}

class _AppBarSimpleState extends State<AppBarSimple>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
        collapsedHeight: widget.config.height ??
            kTextTabBarHeight + 40 + MediaQuery.of(context).viewPadding.top,
        //expandedHeight: widget.config.height ?? kTextTabBarHeight + 115,
        // toolbarHeight: widget.config.height ?? kTextTabBarHeight + 100,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness:
              Tools.isDarkTheme(context) ? Brightness.dark : Brightness.light,
          statusBarColor: theme.appBarTheme.backgroundColor,
          statusBarIconBrightness:
              Tools.isDarkTheme(context) ? Brightness.light : Brightness.dark,
        ),
        shadowColor: widget.config.shadowColor,
        forceElevated: widget.config.forceElevated,
        primary: widget.config.primary,
        floating: widget.config.floating,
        pinned: widget.config.pinned,
        snap: widget.config.snap,
        stretch: widget.config.stretch,
        backgroundColor: Colors.transparent,
        elevation: widget.config.enabledBottomLine ? 1 : null,
        automaticallyImplyLeading: false,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding:
              EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          title: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.config.onTap,
            child: IgnorePointer(
              ignoring: widget.config.onTap == null ? false : true,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.appBarTheme.backgroundColor,
                ),
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.only(
                    left: 20, top: 20, right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.config.onBack != null)
                      if (widget.config.backWidget != null)
                        GestureDetector(
                            onTap: widget.config.onBack,
                            child: widget.config.backWidget!)
                      else
                        GestureDetector(
                            onTap: widget.config.onBack,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Icon(Icons.arrow_back_ios_new),
                            )),
                    Expanded(
                        flex: 15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.config.logo ?? const SizedBox(),
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        if (Tools.isDesktop(context))
                          GestureDetector(
                            onTap: widget.config.centerOnTap,
                            child: Container(
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: theme.scaffoldBackgroundColor),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.search)),
                                  Expanded(
                                    child: Text(
                                      widget.config.searchLabel ??
                                          'Find something here',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (Tools.isDesktop(context))
                          SizedBox(
                            width: 35,
                          ),
                        if (widget.config.isLogged) ...widget.config.items,
                        if (widget.config.isLogged &&
                            widget.config.profileWidget != null)
                          widget.config.profileWidget!,
                        if (!widget.config.isLogged)
                          if (!widget.config.hideSignUp)
                            GestureDetector(
                                onTap: widget.config.onTapLoginButton,
                                child: Text(
                                  'Log In',
                                  style: TextStyle(fontSize: 14),
                                )),
                        if (!widget.config.isLogged)
                          SizedBox(
                            width: Tools.isDesktop(context) ? 35 : 15,
                          ),
                        if (!widget.config.isLogged)
                          InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: widget.config.hideSignUp
                                ? widget.config.onTapLoginButton
                                : widget.config.onTapSignupButton,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                              decoration: BoxDecoration(
                                  gradient: Tools.gradient(
                                      widget.config.iconColors ??
                                          [theme.primaryColor]),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                widget.config.hideSignUp ? 'Log In' : 'Sign Up',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Tools.isColorDark(theme.primaryColor)
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
