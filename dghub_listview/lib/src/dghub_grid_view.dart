import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'animation/list_animation.dart';

class DGHubGridView extends StatelessWidget {
  final bool enabledAnimation;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final int gridCount;
  final double horizontalSpacing;
  final double verticalSpacing;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final Function()? onRefresh;
  final Function()? onPaginate;
  final int paginateCount;
  const DGHubGridView(
      {this.enabledAnimation = false,
      required this.horizontalSpacing,
      required this.verticalSpacing,
      required this.gridCount,
      this.scrollDirection = Axis.vertical,
      this.reverse = false,
      this.controller,
      this.primary,
      this.physics,
      this.shrinkWrap = true,
      this.padding,
      required this.itemBuilder,
      required this.itemCount,
      this.addAutomaticKeepAlives = true,
      this.addRepaintBoundaries = true,
      this.addSemanticIndexes = true,
      this.cacheExtent,
      this.dragStartBehavior = DragStartBehavior.start,
      this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
      this.restorationId,
      this.clipBehavior = Clip.hardEdge,
      this.onRefresh,
      this.onPaginate,
      this.paginateCount = 19,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (onRefresh == null) {
        return CGList(
            paginateCount: paginateCount,
            onPaginate: onPaginate,
            horizontalSpacing: horizontalSpacing,
            verticalSpacing: verticalSpacing,
            gridCount: gridCount,
            scrollDirection: scrollDirection,
            reverse: reverse,
            controller: controller,
            primary: primary,
            physics: physics,
            shrinkWrap: shrinkWrap,
            padding: padding,
            itemBuilder: itemBuilder,
            itemCount: itemCount,
            addAutomaticKeepAlives: addAutomaticKeepAlives,
            addRepaintBoundaries: addRepaintBoundaries,
            addSemanticIndexes: addSemanticIndexes,
            cacheExtent: cacheExtent,
            dragStartBehavior: dragStartBehavior,
            keyboardDismissBehavior: keyboardDismissBehavior,
            restorationId: restorationId,
            clipBehavior: clipBehavior);
      }
      return RefreshIndicator(
          onRefresh: () => onRefresh!(),
          child: CGList(
              paginateCount: paginateCount,
              onPaginate: onPaginate,
              horizontalSpacing: horizontalSpacing,
              verticalSpacing: verticalSpacing,
              gridCount: gridCount,
              scrollDirection: scrollDirection,
              reverse: reverse,
              controller: controller,
              primary: primary,
              physics: physics,
              shrinkWrap: shrinkWrap,
              padding: padding,
              itemBuilder: itemBuilder,
              itemCount: itemCount,
              addAutomaticKeepAlives: addAutomaticKeepAlives,
              addRepaintBoundaries: addRepaintBoundaries,
              addSemanticIndexes: addSemanticIndexes,
              cacheExtent: cacheExtent,
              dragStartBehavior: dragStartBehavior,
              keyboardDismissBehavior: keyboardDismissBehavior,
              restorationId: restorationId,
              clipBehavior: clipBehavior));
    });
  }
}

class CGList extends StatelessWidget {
  final bool enabledAnimation;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final int gridCount;
  final double horizontalSpacing;
  final double verticalSpacing;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final Function()? onPaginate;
  final int paginateCount;

  const CGList(
      {required this.onPaginate,
      this.enabledAnimation = false,
      required this.horizontalSpacing,
      required this.verticalSpacing,
      required this.gridCount,
      required this.scrollDirection,
      required this.reverse,
      required this.controller,
      required this.primary,
      required this.physics,
      required this.shrinkWrap,
      required this.padding,
      required this.itemBuilder,
      required this.itemCount,
      required this.addAutomaticKeepAlives,
      required this.addRepaintBoundaries,
      required this.addSemanticIndexes,
      required this.cacheExtent,
      required this.dragStartBehavior,
      required this.keyboardDismissBehavior,
      required this.restorationId,
      required this.clipBehavior,
      required this.paginateCount,
      super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          if (notification.metrics.pixels ==
              notification.metrics.maxScrollExtent) {
            if (onPaginate != null && itemCount > paginateCount) {
              onPaginate!();
            }
            return true;
          }
        }
        return true;
      },
      child: ListAnimation(
        enabledAnimation: enabledAnimation,
        child: MasonryGridView.count(
            scrollDirection: scrollDirection,
            reverse: reverse,
            controller: controller ?? ScrollController(),
            primary: primary,
            addAutomaticKeepAlives: addAutomaticKeepAlives,
            addRepaintBoundaries: addRepaintBoundaries,
            addSemanticIndexes: addSemanticIndexes,
            cacheExtent: cacheExtent,
            dragStartBehavior: dragStartBehavior,
            keyboardDismissBehavior: keyboardDismissBehavior,
            restorationId: restorationId,
            clipBehavior: clipBehavior,
            shrinkWrap: shrinkWrap,
            physics: physics,
            padding: padding,
            itemBuilder: (context, index) {
              return ListAnimationItem(
                  enabledAnimation: enabledAnimation,
                  index: index,
                  child: itemBuilder(context, index));
            },
            itemCount: itemCount,
            crossAxisCount: gridCount,
            mainAxisSpacing: verticalSpacing,
            crossAxisSpacing: horizontalSpacing),
      ),
    );
  }
}
