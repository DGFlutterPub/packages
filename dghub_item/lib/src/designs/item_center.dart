import 'package:dghub_item/src/item_config.dart';
import 'package:dghub_item/src/mouse_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:dghub_image/dghub_image.dart';
import 'package:dghub_video_player/dghub_video_player.dart';
import '../tools/tools.dart';

class ItemCenter extends StatelessWidget {
  final ItemConfig config;
  const ItemCenter({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: config.onTap,
      child: ClipRRect(
        borderRadius: config.radius ?? BorderRadius.circular(15),
        child: Container(
          decoration:
              BoxDecoration(gradient: Tools.gradientColors(config.colors)),
          width: config.width == 0
              ? MediaQuery.sizeOf(context).width
              : config.width,
          height: config.height == 0
              ? MediaQuery.sizeOf(context).width
              : config.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              MouseScaleAnimation(
                  width: config.width ?? double.infinity,
                  height: config.height ?? double.infinity,
                  child: config.videoUrl != null
                      ? DGHubVideoPlayer(
                          config: VideoPlayerConfig(
                              enabledCacheMode: true,
                              enabledVolume: false,
                              enabledControl: false,
                              autoLoad: config.videoUrl!,
                              height: double.infinity,
                              width: double.infinity))
                      : DGHubImage.network(
                              width: double.infinity,
                              height: double.infinity,
                              load: config.photoUrl!) ??
                          const SizedBox()),
              SizedBox(
                width: config.width,
                height: config.height,
                child: Container(
                  width: config.width,
                  height: config.height,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
