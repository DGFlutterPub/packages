import 'package:dghub_listview/src/animation/list_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DGHubListView extends StatelessWidget {
  final bool enabledAnimation;
  final Future<void> Function()? onRefresh;
  final Function()? onPaginate;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int? Function(Key)? findChildIndexCallback;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final int itemCount;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final int paginateCount;

  const DGHubListView(
      {this.enabledAnimation = false,
      this.scrollDirection = Axis.vertical,
      this.reverse = false,
      this.controller,
      this.onRefresh,
      this.onPaginate,
      this.primary,
      this.physics,
      this.shrinkWrap = true,
      this.padding,
      required this.itemBuilder,
      this.findChildIndexCallback,
      this.separatorBuilder,
      required this.itemCount,
      this.addAutomaticKeepAlives = true,
      this.addRepaintBoundaries = true,
      this.addSemanticIndexes = true,
      this.cacheExtent,
      this.dragStartBehavior = DragStartBehavior.start,
      this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
      this.restorationId,
      this.clipBehavior = Clip.hardEdge,
      this.paginateCount = 19,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (onRefresh == null) {
        return CList(
            paginateCount: paginateCount,
            onPaginate: onPaginate,
            enabledAnimation: enabledAnimation,
            scrollDirection: scrollDirection,
            reverse: reverse,
            controller: controller,
            primary: primary,
            findChildIndexCallback: findChildIndexCallback,
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
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder,
            itemCount: itemCount);
      }
      return RefreshIndicator(
        // notificationPredicate: (notification) {

        //  },
        onRefresh: onRefresh!,
        child: CList(
            paginateCount: paginateCount,
            onPaginate: onPaginate,
            enabledAnimation: enabledAnimation,
            scrollDirection: scrollDirection,
            reverse: reverse,
            controller: controller,
            primary: primary,
            findChildIndexCallback: findChildIndexCallback,
            addAutomaticKeepAlives: addAutomaticKeepAlives,
            addRepaintBoundaries: addRepaintBoundaries,
            addSemanticIndexes: addSemanticIndexes,
            cacheExtent: cacheExtent,
            dragStartBehavior: dragStartBehavior,
            keyboardDismissBehavior: keyboardDismissBehavior,
            restorationId: restorationId,
            clipBehavior: clipBehavior,
            shrinkWrap: shrinkWrap,
            physics: physics ?? const AlwaysScrollableScrollPhysics(),
            padding: padding,
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder,
            itemCount: itemCount),
      );
    });
  }
}

class CList extends StatelessWidget {
  const CList({
    super.key,
    required this.enabledAnimation,
    required this.scrollDirection,
    required this.reverse,
    required this.controller,
    required this.primary,
    required this.findChildIndexCallback,
    required this.addAutomaticKeepAlives,
    required this.addRepaintBoundaries,
    required this.addSemanticIndexes,
    required this.cacheExtent,
    required this.dragStartBehavior,
    required this.keyboardDismissBehavior,
    required this.restorationId,
    required this.clipBehavior,
    required this.shrinkWrap,
    required this.physics,
    required this.padding,
    required this.itemBuilder,
    required this.separatorBuilder,
    required this.itemCount,
    required this.paginateCount,
    required this.onPaginate,
  });
  final bool enabledAnimation;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final int? Function(Key p1)? findChildIndexCallback;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final int itemCount;
  final Function()? onPaginate;
  final int paginateCount;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          if (notification.metrics.pixels ==
              notification.metrics.maxScrollExtent) {
            if (onPaginate != null && itemCount > 19) {
              onPaginate!();
            }
            return true;
          }
        }
        return false;
      },
      child: ListAnimation(
        enabledAnimation: enabledAnimation,
        child: ListView.separated(
            scrollDirection: scrollDirection,
            reverse: reverse,
            controller: controller,
            primary: primary,
            findChildIndexCallback: findChildIndexCallback,
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
            separatorBuilder: separatorBuilder ??
                (context, index) {
                  if (scrollDirection == Axis.horizontal) {
                    return const SizedBox(
                      width: 10,
                    );
                  } else {
                    return const SizedBox(
                      height: 10,
                    );
                  }
                },
            itemCount: itemCount),
      ),
    );
  }
}
