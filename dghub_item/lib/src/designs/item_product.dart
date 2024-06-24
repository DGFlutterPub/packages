import 'package:dghub_item/src/item_config.dart';
import 'package:flutter/material.dart';

import '../mouse_scale_animation.dart';
import '../tools/tools.dart';

class ItemProduct extends StatelessWidget {
  final ItemConfig config;
  const ItemProduct({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: config.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              MouseScaleAnimation(
                width: config.width,
                height: config.height,
                child: ClipRRect(
                  borderRadius: config.radius ?? BorderRadius.circular(15),
                  child: config.video ?? config.photo ?? const SizedBox(),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (config.ratingLabel != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: theme.primaryColor,
                          size: 12,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          config.ratingLabel!,
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                if (config.label != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      config.label!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: config.labelSize,
                      ),
                    ),
                  ),
                if (config.subLabel != null && config.subLabel != '')
                  Text(
                    config.subLabel!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: config.subLabelSize,
                    ),
                  ),
                if (config.buttonLabel != null)
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: theme.primaryColor),
                      padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Text(
                        config.buttonLabel!,
                        style: TextStyle(
                            fontSize: config.buttonLabelSize,
                            color: Tools.isColorDark(theme.primaryColor)
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
