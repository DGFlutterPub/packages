import 'package:dghub_bottombar/dghub_bottombar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../list/bottombar_list_item.dart';
import '../tools/tools.dart';

class BottomBarItemDefault extends StatelessWidget {
  final Function(BottomBarStyle data) onTap;
  final BottomBarStyle selected;
  const BottomBarItemDefault(
      {required this.onTap, required this.selected, super.key});

  @override
  Widget build(BuildContext context) {
    var style = BottomBarStyle();

    return DGHubBottomBarListItem(
        selected: selected.type == 'defaultDesign',
        onTap: () {
          onTap(style);
          if (kDebugMode) {
            print(style.toJson());
          }
        },
        label: 'Default design',
        children: [
          DGHubBottomBar(
            type: DGHubBottomBarType.defaultDesign,
            config: BottomBarConfig(
              enabledProfile: false,
              backgroundColor: Tools.hexColor(style.backgroundColor),
              backgroundColorDarkTheme: Tools.hexColor(style.backgroundColor),
              cardColor: Tools.hexColor(style.cardColor),
              cardColorDarkTheme: Tools.hexColor(style.cardColor),
              selectedIconColor: Tools.hexColor(style.selectedIconColor),
              unSelectedIconColor: Tools.hexColor(style.unSelectedIconColor),
              selectedLabelColor: Tools.hexColor(style.selectedLabelColor),
              unSelectedLabelColor: Tools.hexColor(style.unSelectedIconColor),
              items: [
                DGHubBottomBarIcon(
                    label: 'Home',
                    selectedIcon: Icons.home_outlined,
                    unSelectedIcon: Icons.home_outlined,
                    onTap: () {}),
                DGHubBottomBarIcon(
                    label: 'Categories',
                    selectedIcon: Icons.category_outlined,
                    unSelectedIcon: Icons.category_outlined,
                    onTap: () {}),
                DGHubBottomBarIcon(
                    label: 'Orders',
                    enabledBadage: true,
                    badageLabel: '0',
                    badageColor: Colors.blue,
                    selectedIcon: Icons.account_tree_outlined,
                    unSelectedIcon: Icons.account_tree_outlined,
                    onTap: () {}),
                DGHubBottomBarIcon(
                    label: 'Settings',
                    selectedIcon: Icons.settings_outlined,
                    unSelectedIcon: Icons.settings_outlined,
                    onTap: () {}),
              ],
              result: (int index) {},
            ),
          ),

          /////////////////End DefaultDesign
          DGHubBottomBar(
            type: DGHubBottomBarType.defaultDesign,
            config: BottomBarConfig(
              enabledProfile: false,
              backgroundColor: Tools.hexColor(style.backgroundColorDarkTheme),
              backgroundColorDarkTheme:
                  Tools.hexColor(style.backgroundColorDarkTheme),
              cardColor: Tools.hexColor(style.cardColorDarkTheme),
              cardColorDarkTheme: Tools.hexColor(style.cardColorDarkTheme),
              selectedIconColor:
                  Tools.hexColor(style.selectedIconColorDarkTheme),
              unSelectedIconColor:
                  Tools.hexColor(style.unSelectedIconColorDarkTheme),
              selectedLabelColor:
                  Tools.hexColor(style.selectedLabelColorDarkTheme),
              unSelectedLabelColor:
                  Tools.hexColor(style.unSelectedIconColorDarkTheme),
              items: [
                DGHubBottomBarIcon(
                    label: 'Home',
                    selectedIcon: Icons.home_outlined,
                    unSelectedIcon: Icons.home_outlined,
                    onTap: () {}),
                DGHubBottomBarIcon(
                    label: 'Categories',
                    selectedIcon: Icons.category_outlined,
                    unSelectedIcon: Icons.category_outlined,
                    onTap: () {}),
                DGHubBottomBarIcon(
                    label: 'Orders',
                    enabledBadage: true,
                    badageLabel: '0',
                    badageColor: Colors.blue,
                    selectedIcon: Icons.account_tree_outlined,
                    unSelectedIcon: Icons.account_tree_outlined,
                    onTap: () {}),
                DGHubBottomBarIcon(
                    label: 'Settings',
                    selectedIcon: Icons.settings_outlined,
                    unSelectedIcon: Icons.settings_outlined,
                    onTap: () {}),
              ],
              result: (int index) {},
            ),
          ),
        ]);
  }
}
