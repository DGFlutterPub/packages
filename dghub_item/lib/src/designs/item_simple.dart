import 'package:dghub_item/src/item_config.dart';
import 'package:dghub_item/src/mouse_scale_animation.dart';
import 'package:flutter/material.dart';

import '../tools/tools.dart';

class ItemSimple extends StatelessWidget {
  final ItemConfig config;
  const ItemSimple({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: config.onTap,
      child: ClipRRect(
        borderRadius: config.radius ?? BorderRadius.circular(15),
        child: Container(
          color: config.backgroundColor,
          width: config.width,
          height: config.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              MouseScaleAnimation(
                  width: config.width,
                  height: config.height,
                  child: config.video ?? config.photo ?? const SizedBox()),
              SizedBox(
                width: config.width,
                height: config.height,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    width: config.width,
                    height: config.height,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (config.label != null)
                          Text(
                            config.label!,
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                fontSize: config.labelSize,
                                color: Colors.white),
                          ),
                        if (config.subLabel != null && config.subLabel != '')
                          Text(
                            config.subLabel!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: config.subLabelSize,
                                color: Colors.white.withOpacity(0.8)),
                          ),
                        if (config.buttonLabel != null)
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white),
                            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                            child: Text(
                              config.buttonLabel!,
                              style: TextStyle(
                                  fontSize: config.buttonLabelSize,
                                  color: Colors.black),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
