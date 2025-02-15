import 'package:dghub_list_item/src/designs/list_item_colored.dart';
import 'package:dghub_list_item/src/designs/list_item_simple.dart';
import 'package:dghub_list_item/src/model/list_item_config.dart';
import 'package:flutter/material.dart';

enum ListItemDesigns { simple, colored }

class DGHubListItem extends StatelessWidget {
  final ListItemDesigns design;
  final ListItemConfig config;
  const DGHubListItem(
      {required this.config, this.design = ListItemDesigns.simple, super.key});

  @override
  Widget build(BuildContext context) {
    return switch (design) {
      ListItemDesigns.colored => ListItemColored(config: config),
      ListItemDesigns.simple => ListItemSimple(config: config),
    };
  }
}
