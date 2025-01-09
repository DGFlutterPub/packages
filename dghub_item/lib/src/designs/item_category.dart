import 'package:dghub_item/src/item_config.dart';
import 'package:dghub_item/src/mouse_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:dghub_image/dghub_image.dart';
import 'package:dghub_video_player/dghub_video_player.dart';
import '../tools/tools.dart';

class ItemCategory extends StatelessWidget {
  final ItemConfig config;
  const ItemCategory({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: config.onTap,
      child: Container(
        decoration:
            BoxDecoration(gradient: Tools.gradientColors(config.colors)),
        width:
            config.width == 0 ? MediaQuery.sizeOf(context).width : config.width,
        height: config.height == 0
            ? MediaQuery.sizeOf(context).width
            : config.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            MouseScaleAnimation(
                width: config.width ?? 150,
                height: config.height ?? 150,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: config.videoUrl != null
                        ? DGHubVideoPlayer(
                            config: VideoPlayerConfig(
                                enabledCacheMode: true,
                                enabledVolume: false,
                                enabledControl: false,
                                autoLoad: config.videoUrl!,
                                height: double.infinity,
                                width: double.infinity))
                        : DGHubImage(
                            width: double.infinity,
                            height: double.infinity,
                            autoLoad: config.photoUrl ?? config.label ?? 'C'))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Wrap(
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: Tools.gradientColors(
                            config.overLayColors.isEmpty
                                ? [theme.primaryColor, theme.primaryColor]
                                : config.overLayColors),
                        borderRadius: BorderRadius.circular(100)),
                    padding: EdgeInsets.all(5),
                    child: Wrap(
                      children: [
                        if (config.label != null)
                          Text(
                            config.label!,
                            maxLines: 1,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                fontSize: config.labelSize,
                                color: Tools.isColorDark(theme.primaryColor)
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        if (config.subLabel != null && config.subLabel != '')
                          Text(
                            config.subLabel!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: config.subLabelSize,
                                color: Colors.white.withOpacity(0.8)),
                          ),
                        if (config.buttonLabel != null &&
                            config.buttonLabel != '')
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
