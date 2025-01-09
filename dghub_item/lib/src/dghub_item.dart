import 'package:dghub_item/src/designs/item_category.dart';
import 'package:dghub_item/src/designs/item_center.dart';
import 'package:dghub_item/src/designs/item_combo.dart';
import 'package:dghub_item/src/designs/item_product.dart';
import 'package:dghub_item/src/designs/item_simple.dart';
import 'package:dghub_item/src/item_config.dart';
import 'package:flutter/material.dart';

import 'designs/item_actor.dart';

enum ItemDesigns { simple, product, center, category, actor, combo }

class DGHubItem extends StatelessWidget {
  final ItemDesigns design;
  final ItemConfig config;
  const DGHubItem(
      {this.design = ItemDesigns.simple, required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    return switch (design) {
      ItemDesigns.simple => ItemSimple(config: config),
      ItemDesigns.center => ItemCenter(config: config),
      ItemDesigns.product => ItemProduct(config: config),
      ItemDesigns.category => ItemCategory(config: config),
      ItemDesigns.actor => ItemActor(config: config),
      ItemDesigns.combo => ItemCombo(config: config),
    };
  }
}
