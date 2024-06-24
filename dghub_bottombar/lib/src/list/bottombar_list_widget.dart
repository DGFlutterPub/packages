import 'package:dghub_bottombar/src/model/bottombar_style.dart';
import 'package:flutter/material.dart';

import '../list_item/bottombar_list_item_default.dart';
import '../list_item/bottombar_list_item_location.dart';
import '../list_item/bottombar_list_item_material3.dart';

class DGHubBottomBarListWidget extends StatefulWidget {
  final Function(BottomBarStyle selected) result;
  final BottomBarStyle init;
  const DGHubBottomBarListWidget(
      {required this.init, required this.result, super.key});

  @override
  State<DGHubBottomBarListWidget> createState() =>
      _DGHubBottomBarListWidgetState();
}

class _DGHubBottomBarListWidgetState extends State<DGHubBottomBarListWidget> {
  BottomBarStyle selected = BottomBarStyle();
  @override
  void initState() {
    selected = widget.init;
    widget.result(selected);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(5), children: [
      BottomBarItemDefault(
          onTap: (r) {
            selected = r;
            widget.result(r);
            setState(() {});
          },
          selected: selected),
      BottomBarItemLocation(
          onTap: (r) {
            selected = r;
            widget.result(selected);
            setState(() {});
          },
          selected: selected),
      BottomBarItemMaterial3(
          onTap: (r) {
            selected = r;
            widget.result(r);
            setState(() {});
          },
          selected: selected),
    ]);
  }
}
