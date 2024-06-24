import 'package:dghub_splash/dghub_splash.dart';
import 'package:dghub_splash/src/splashs/fill_splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../list/dghub_splash_list_item.dart';

class FillSplashListItem extends StatelessWidget {
  final Function(DGHubSplashStyle data) onTap;
  final DGHubSplashStyle selected;
  const FillSplashListItem(
      {required this.selected, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    var style = DGHubSplashStyle(
        backgroundColor: '0xffffffff',
        cardColor: '0xffffffff',
        backgroundColorDarkTheme: '0xff000000',
        cardColorDarkTheme: '0xff000000',
        type: 'fill');

    return DGHubSplashListItem(
      selected: selected.type == 'fill',
      onTap: () {
        onTap(style);
        if (kDebugMode) {
          print(style);
        }
      },
      label: 'Fill design',
      children: [
        FillSplash(
            devMode: true,
            data: DGHubSplashData(),
            style: DGHubSplashStyle(
              backgroundColor: style.backgroundColor,
              backgroundColorDarkTheme: style.backgroundColor,
              cardColor: style.cardColor,
              cardColorDarkTheme: style.cardColor,
            )),
        FillSplash(
            devMode: true,
            data: DGHubSplashData(),
            style: DGHubSplashStyle(
              backgroundColor: style.backgroundColorDarkTheme,
              backgroundColorDarkTheme: style.backgroundColorDarkTheme,
              cardColor: style.cardColorDarkTheme,
              cardColorDarkTheme: style.cardColorDarkTheme,
            )),
      ],
    );
  }
}
