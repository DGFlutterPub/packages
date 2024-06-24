import 'package:dghub_item/src/designs/item_center.dart';
import 'package:dghub_item/src/designs/item_product.dart';
import 'package:dghub_item/src/designs/item_simple.dart';
import 'package:dghub_item/src/item_config.dart';
import 'package:flutter/material.dart';

enum ItemDesigns { simple, product, center }

class DGHubItem extends StatelessWidget {
  final ItemDesigns design;
  final ItemConfig config;
  const DGHubItem(
      {this.design = ItemDesigns.simple, required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    switch (design) {
      case ItemDesigns.simple:
        return ItemSimple(
          config: config,
        );
      case ItemDesigns.center:
        return ItemCenter(
          config: config,
        );
      case ItemDesigns.product:
        return ItemProduct(config: config);
      default:
        return ItemSimple(
          config: config,
        );
    }
  }
}
