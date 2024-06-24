import 'package:dghub_horizontal_list_group/src/designs/horizontal_list_group_simple.dart';
import 'package:dghub_horizontal_list_group/src/horizontal_list_group_config.dart';
import 'package:flutter/material.dart';

enum HorizontalListGroupDesigns { simple }

class DGHubHorizontalListGroup extends StatelessWidget {
  final HorizontalListGroupDesigns design;
  final HorizontalListGroupConfig config;
  const DGHubHorizontalListGroup(
      {this.design = HorizontalListGroupDesigns.simple,
      required this.config,
      super.key});

  @override
  Widget build(BuildContext context) {
    switch (design) {
      case HorizontalListGroupDesigns.simple:
        return HorizontalListGroupSimple(
          config: config,
        );
      default:
        return HorizontalListGroupSimple(
          config: config,
        );
    }
  }
}
