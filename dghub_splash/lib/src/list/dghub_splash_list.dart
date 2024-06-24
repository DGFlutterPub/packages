import 'package:dghub_splash/dghub_splash.dart';
import 'package:dghub_splash/src/list_item/default_splash_list_item.dart';
import 'package:flutter/material.dart';

import '../list_item/circle_splash_list_item.dart';
import '../list_item/fill_splash_list_item.dart';

class DGHubSplashList extends StatefulWidget {
  final DGHubSplashStyle? init;
  final Function(DGHubSplashStyle data) result;
  const DGHubSplashList({this.init, required this.result, super.key});

  @override
  State<DGHubSplashList> createState() => _DGHubSplashListState();
}

class _DGHubSplashListState extends State<DGHubSplashList> {
  DGHubSplashStyle init = DGHubSplashStyle();

  @override
  void initState() {
    if (widget.init != null) {
      init = widget.init!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DefaultSplashListItem(
          selected: init,
          onTap: (r) {
            init = r;
            widget.result(r);
            setState(() {});
          },
        ),
        CircleSplashListItem(
          selected: init,
          onTap: (r) {
            init = r;
            widget.result(r);
            setState(() {});
          },
        ),
        FillSplashListItem(
          selected: init,
          onTap: (r) {
            init = r;
            widget.result(r);
            setState(() {});
          },
        ),
      ],
    );
  }
}
