import 'package:dghub_appbar/src/tools/tools.dart';
import 'package:flutter/material.dart';

import 'appbars/simple/appbar_simple_search.dart';
import 'models/appbar_search_config.dart';

enum AppBarSearchDesigns { simple }

class DGHubAppBarSearch extends StatefulWidget {
  final AppBarSearchDesigns design;
  final AppBarSearchConfig config;
  const DGHubAppBarSearch(
      {this.design = AppBarSearchDesigns.simple,
      required this.config,
      super.key});

  @override
  State<DGHubAppBarSearch> createState() => _DGHubAppBarSearchState();
}

class _DGHubAppBarSearchState extends State<DGHubAppBarSearch> {
  @override
  Widget build(BuildContext context) {
    Tools.statusBarColor(Theme.of(context).colorScheme.surface);
    switch (widget.design) {
      case AppBarSearchDesigns.simple:
        return AppBarSimpleSearch(
          config: widget.config,
        );

      default:
        return AppBarSimpleSearch(
          config: widget.config,
        );
    }
  }
}
