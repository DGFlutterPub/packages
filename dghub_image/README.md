# DGHub Studio

<a href="https://t.me/dghub_founder" target="_blank"><img src="https://avatars.githubusercontent.com/u/112307287?v=4 | width=100" style="height: 170px !important;width: 170px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

### Buy Me a Coffee

<a href="https://www.paypal.me/dghubfounder" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 37px !important;width: 170px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

[![Pub](https://img.shields.io/pub/v/font_awesome_flutter.svg)](https://pub.dartlang.org/packages/dghub_web_scrapper)

## What is

A flutter package to cache network image fastly without native dependencies, with loader, error builder, and smooth fade transitions. You can also add beautiful loaders and percentage indicators with the total and download size of the image.

See for example this or this answer on previous posted issues.

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  dghub_image: <latest_version>
```

## Import package

```dart
import 'package:dghub_image/dghub_image.dart';
```

## Example - Install

```dart
  await DGHubImage.init();
```

## Example - Auto load image

```dart
   DGHubImage(
                width: 200,
                height: 200,
                autoLoad:'Auto load url,file,asset,avatar');
```

## Example - Network

```dart
   DGHubImage.network(
                width: 200,
                height: 200,
                load:
                    'https://st2.depositphotos.com/2001755/8564/i/450/depositphotos_85647140-stock-photo-beautiful-landscape-with-birds.jpg');
```

## Example - File

```dart
   DGHubImage.file(
                width: 200,
                height: 200,
                load:
                    'your file path');
```

## Example - Asset

```dart
   DGHubImage.asset(
                width: 200,
                height: 200,
                load:
                    'your asset path');
```

## Example - Byte

```dart
   DGHubImage.byte(
                width: 200,
                height: 200,
                load:
                    'your image byte');
```

## Example - Avatar

```dart
   DGHubImage.avatar(
                width: 200,
                height: 200,
                load:
                    'your name');
```

## Importants Methods and propriets

- Table by antonio-nicolau

| Methods               | Mean            |
| --------------------- | --------------- |
| DGHubImage.init       | For install     |
| DGHubImage.clearCache | For clean       |
| DGHubImage.network    | For url image   |
| DGHubImage.file       | For file image  |
| DGHubImage.asset      | For asset image |
| DGHubImage.byte       | For byte image  |
| DGHubImage.avatar     | For avatar      |

- Package created by Min Thant Htet
