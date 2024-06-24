import 'package:dghub_appbar/src/tools/tools.dart';
import 'package:flutter/material.dart';
import '../../models/appbar_config.dart';
import '../../models/appbar_search_config.dart';

class AppBarSimpleSearch extends StatefulWidget {
  final AppBarSearchConfig config;
  const AppBarSimpleSearch({super.key, required this.config});

  @override
  State<AppBarSimpleSearch> createState() => _AppBarSimpleSearchState();
}

class _AppBarSimpleSearchState extends State<AppBarSimpleSearch>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
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
                  if (Tools.isDesktop(context))
                    Spacer(
                      flex: 2,
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
                                      child: Text(widget.config.searchLabel ??
                                          'Search'),
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
                                  ...widget.config.items,
                                
                                ],
                              ))
                        ],
                      )),
                  if (Tools.isDesktop(context))
                    Spacer(
                      flex: 2,
                    )
                ],
              ),
            ),
          ),
        ));
  }
}
