import 'package:flutter/material.dart';

class HorizontalListGroupConfig {
  String? headerLabel;
  double? headerLabelSize;
  EdgeInsets headerPadding;
  EdgeInsets listPadding;
  Widget Function(BuildContext, int) itemBuilder;
  Function()? seeMoreOnTap;
  Widget? seeMoreWidget;
  int itemCount;
  double height;
  HorizontalListGroupConfig(
      {this.headerLabel,
      required this.itemBuilder,
      required this.itemCount,
      this.headerLabelSize = 24,
      required this.height,
      this.seeMoreOnTap,
      this.seeMoreWidget,
      this.listPadding = const EdgeInsets.only(left: 20, right: 20),
      this.headerPadding = const EdgeInsets.all(15)});
}
