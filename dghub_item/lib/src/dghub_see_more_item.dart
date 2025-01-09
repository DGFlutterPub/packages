import 'package:dghub_item/src/designs/item_category.dart';
import 'package:dghub_item/src/designs/item_center.dart';
import 'package:dghub_item/src/designs/item_combo.dart';
import 'package:dghub_item/src/designs/item_product.dart';
import 'package:dghub_item/src/designs/item_simple.dart';
import 'package:dghub_item/src/item_config.dart';
import 'package:flutter/material.dart';

import 'designs/item_actor.dart';
import 'designs/see_more/see_more_item_simple.dart';
import 'see_more_item_config.dart';

enum SeeMoreItemDesigns { simple, product, center, category, actor, combo }

class DGHubSeeMoreItem extends StatelessWidget {
  final SeeMoreItemDesigns design;
  final SeeMoreItemConfig config;
  const DGHubSeeMoreItem(
      {this.design = SeeMoreItemDesigns.simple,
      required this.config,
      super.key});

  @override
  Widget build(BuildContext context) {
    return switch (design) {
      SeeMoreItemDesigns.simple => SeeMoreItemSimple(config: config),
      SeeMoreItemDesigns.center => SeeMoreItemSimple(config: config),
      SeeMoreItemDesigns.product => SeeMoreItemSimple(config: config),
      SeeMoreItemDesigns.category => SeeMoreItemSimple(config: config),
      SeeMoreItemDesigns.actor => SeeMoreItemSimple(config: config),
      SeeMoreItemDesigns.combo => SeeMoreItemSimple(config: config),
    };
  }
}
