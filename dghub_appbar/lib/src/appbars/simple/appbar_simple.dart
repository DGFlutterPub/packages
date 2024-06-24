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
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: theme.appBarTheme.backgroundColor,
            statusBarIconBrightness: Tools.isDarkTheme(context)
                ? Brightness.light
                : Brightness.dark),
        collapsedHeight: kTextTabBarHeight + 40,
        //expandedHeight: widget.config.height ?? kTextTabBarHeight + 115,
        // toolbarHeight: widget.config.height ?? kTextTabBarHeight + 100,

        shadowColor: widget.config.shadowColor,
        forceElevated: widget.config.forceElevated,
        primary: widget.config.primary,
        floating: widget.config.floating,
        pinned: widget.config.pinned,
        snap: widget.config.snap,
        stretch: widget.config.stretch,
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: widget.config.enabledBottomLine ? 1 : null,
        automaticallyImplyLeading: false,
        flexibleSpace: GestureDetector(
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
                  if (widget.config.backWidget != null)
                    widget.config.backWidget!,
                  if (Tools.isDesktop(context))
                    Spacer(
                      flex: 1,
                    ),
                  widget.config.logo ?? const SizedBox(),
                  Expanded(
                      flex: 15,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          if (Tools.isDesktop(context))
                            Expanded(
                              flex: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: theme.canvasColor),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.search)),
                                    Expanded(child: SizedBox()),
                                    Container(
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.fromLTRB(25, 10, 25, 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: theme.primaryColor),
                                      child: Text(
                                        widget.config.searchLabel ?? 'Search',
                                        style: TextStyle(
                                            color: Tools.isColorDark(
                                                    theme.primaryColor)
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (widget.config.isLogged)
                                    ...widget.config.items,
                                  if (widget.config.isLogged &&
                                      widget.config.profileWidget != null)
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                          color: theme.cardColor,
                                          width: 45,
                                          height: 45,
                                          child: widget.config.profileWidget!),
                                    ),
                                  if (!widget.config.isLogged)
                                    if (!widget.config.hideSignUp)
                                      GestureDetector(
                                          onTap: widget.config.onTapLoginButton,
                                          child: Text('Log In')),
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
                                        padding:
                                            EdgeInsets.fromLTRB(25, 10, 25, 10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.3,
                                                color:
                                                    Tools.isDarkTheme(context)
                                                        ? Colors.white
                                                        : Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Text(widget.config.hideSignUp
                                            ? 'Log In'
                                            : 'Sign Up'),
                                      ),
                                    )
                                ],
                              ))
                        ],
                      )),
                  if (Tools.isDesktop(context))
                    Spacer(
                      flex: 1,
                    )
                ],
              ),
            ),
          ),
        ));
  }
}
