import 'package:flutter/material.dart';

import '../horizontal_list_group_config.dart';
import 'package:dghub_listview/dghub_listview.dart';

import '../tools/tools.dart';

class HorizontalListGroupSimple extends StatefulWidget {
  final HorizontalListGroupConfig config;
  const HorizontalListGroupSimple({required this.config, super.key});

  @override
  State<HorizontalListGroupSimple> createState() =>
      _HorizontalListGroupSimpleState();
}

class _HorizontalListGroupSimpleState extends State<HorizontalListGroupSimple> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (widget.config.itemCount == 0) {
      return SizedBox();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: widget.config.headerPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.config.headerLabel != null)
                Expanded(
                  flex: Tools.isDesktop(context) ? 0 : 1,
                  child: Text(
                    widget.config.headerLabel!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: widget.config.headerLabelSize,
                    ),
                  ),
                ),
              if (widget.config.headerLabel != null)
                SizedBox(
                  width: 30,
                ),
              if (Tools.isDesktop(context))
                Expanded(
                    child: Divider(
                  thickness: 0.3,
                )),
              if (Tools.isDesktop(context))
                SizedBox(
                  width: 30,
                ),
              if (Tools.isDesktop(context))
                GestureDetector(
                  onTap: () {
                    controller.animateTo(controller.offset + -200,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeInOut);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 0.3, color: Colors.grey)),
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                ),
              if (Tools.isDesktop(context))
                SizedBox(
                  width: 20,
                ),
              if (Tools.isDesktop(context))
                GestureDetector(
                  onTap: () {
                    if (Tools.isDesktop(context)) {
                      controller.animateTo(controller.offset + 200,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeInOut);
                    } else {
                      if (widget.config.seeMoreOnTap != null) {
                        widget.config.seeMoreOnTap!();
                      }
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 0.3, color: Colors.grey)),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                )
            ],
          ),
        ),
        SizedBox(
          height: widget.config.height,
          child: DGHubListView(
              separatorBuilder: (context, index) => SizedBox(
                    width: Tools.isDesktop(context) ? 20 : 15,
                  ),
              controller: controller,
              scrollDirection: Axis.horizontal,
              padding: widget.config.listPadding,
              itemBuilder: (context, index) {
                if (widget.config.itemCount == index &&
                    widget.config.seeMoreWidget != null) {
                  return GestureDetector(
                      onTap: widget.config.seeMoreOnTap,
                      child: widget.config.seeMoreWidget!);
                }
                return widget.config.itemBuilder(context, index);
              },
              itemCount: widget.config.itemCount +
                  (widget.config.seeMoreWidget != null ? 1 : 0)),
        )
      ],
    );
  }
}
