# DGHub Studio

<a href="https://t.me/dghub_founder" target="_blank"><img src="https://avatars.githubusercontent.com/u/112307287?v=4 | width=100" style="height: 170px !important;width: 170px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

### Buy Me a Coffee

<a href="https://www.paypal.me/dghubfounder" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 37px !important;width: 170px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

[![Pub](https://img.shields.io/pub/v/font_awesome_flutter.svg)](https://pub.dartlang.org/packages/dghub_button)

## What is

This package provides a customizable button for flutter projects

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  dghub_button: <latest_version>
```

## Import package

```dart
import 'package:dghub_button/dghub_button.dart';
```

## Example home button

```dart

        DGHubButton(
              config: ButtonConfig( width: 100,

                    isError: isError,
                    isSuccess: isSuccess,
                    // isLoading: true,
                    onTap: () {
                      isSuccess = true;
                      setState(() {});
                    },


                    color: Colors.pink,
                    label: 'Click')),
            ),

```

- Package created by Min Thant Htet
