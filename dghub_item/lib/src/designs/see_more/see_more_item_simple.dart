import 'package:dghub_item/dghub_item.dart';
import 'package:flutter/material.dart';

import '../../tools/tools.dart';

class SeeMoreItemSimple extends StatelessWidget {
  final SeeMoreItemConfig config;
  const SeeMoreItemSimple({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: config.onTap,
      child: Container(
        width: config.width,
        height: config.height,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: config.radius ?? BorderRadius.circular(15),
            color: Tools.isDarkTheme(context) ? Colors.white : Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              config.label ?? 'See more',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color:
                      Tools.isDarkTheme(context) ? Colors.black : Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            Icon(
              Icons.arrow_forward,
              color: Tools.isDarkTheme(context) ? Colors.black : Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
