# DGHub Studio

<a href="https://t.me/dghub_founder" target="_blank"><img src="https://avatars.githubusercontent.com/u/112307287?v=4 | width=100" style="height: 170px !important;width: 170px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

### Buy Me a Coffee

<a href="https://www.paypal.me/dghubfounder" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 37px !important;width: 170px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

[![Pub](https://img.shields.io/pub/v/font_awesome_flutter.svg)](https://pub.dartlang.org/packages/dghub_tab)

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  dghub_tab: <latest_version>
```

## Import package

```dart
import 'package:dghub_tab/dghub_tab.dart';
```

```dart

DGHubTab(
        config: DGHubTabConfig(
            changed: (index, controller) {
            ///
            },
            tabs: [
          DGHubTabBarItem(icon: Icons.abc, label: 'All'),
          DGHubTabBarItem(icon: Icons.abc, label: 'Users'),
          DGHubTabBarItem(icon: Icons.abc, label: 'Admins'),
          DGHubTabBarItem(icon: Icons.abc, label: 'Services'),
          DGHubTabBarItem(icon: Icons.abc, label: 'Bots'),
        ]));

```

- Package created by Min Thant Htet
