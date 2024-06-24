import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dghub_permission/src/dghub_permission_service.dart';
import 'package:dghub_permission/src/page_item.dart';
import 'package:dghub_permission/src/tools.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DGHubPermission extends StatefulWidget {
  final bool storage;
  final bool location;
  final bool microphone;
  final bool photo;
  final bool contact;
  final bool camera;
  final bool video;
  final bool alertWindow;
  final Function() onComplete;
  const DGHubPermission(
      {this.contact = false,
      this.storage = true,
      this.location = false,
      this.photo = false,
      this.microphone = false,
      this.camera = false,
      this.video = false,
      required this.onComplete,
      this.alertWindow = false,
      super.key});

  @override
  State<DGHubPermission> createState() => _DGHubPermissionState();
}

class _DGHubPermissionState extends State<DGHubPermission>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  final PageController controller = PageController();
  List<Widget> list = [];

  @override
  void initState() {
    LottieCache.add('packages/dghub_permission/assets/storage.json');
    LottieCache.add('packages/dghub_permission/assets/location.json');
    LottieCache.add('packages/dghub_permission/assets/camera.json');
    LottieCache.add('packages/dghub_permission/assets/contact.json');
    LottieCache.add('packages/dghub_permission/assets/microphone.json');
    LottieCache.add('packages/dghub_permission/assets/photo.json');
    LottieCache.add('packages/dghub_permission/assets/success.json');
    LottieCache.add('packages/dghub_permission/assets/video.json');

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    if (animationController.status == AnimationStatus.forward ||
        animationController.status == AnimationStatus.completed) {
      // animationController.reverse();
    } else {
      animationController.forward();
    }
    super.initState();
  }

  Future<List<Widget>> getList(BuildContext context) async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    AndroidDeviceInfo android = await plugin.androidInfo;
    bool storagePermission;
    if (android.version.sdkInt > 32) {
      storagePermission = await Permission.photos.isDenied;
    } else {
      storagePermission = await Permission.storage.isDenied;
    }

    list = [
      if (widget.storage)
        if (storagePermission)
          PageItem(
            onTap: () async {
              if (await Permission.storage.status.isDenied) {
                await Permission.storage.request();
              }
              if (await Permission.storage.status.isPermanentlyDenied) {
                await openAppSettings();
              }

              if (android.version.sdkInt > 32) {
                if (await Permission.manageExternalStorage.isDenied) {
                  await Permission.manageExternalStorage.request();
                }
                if (await Permission
                    .manageExternalStorage.status.isPermanentlyDenied) {
                  await openAppSettings();
                }
                if (await Permission.videos.isDenied) {
                  await Permission.videos.request();
                }
                if (await Permission.photos.isDenied) {
                  await Permission.photos.request();
                }
              }

              setState(() {});
            },
            label: 'Allow your Storage',
            sublabel: 'The storage permission is required for app functions',
            lottie: 'packages/dghub_permission/assets/storage.json',
          ),
      if (widget.alertWindow)
        if (await Permission.systemAlertWindow.isDenied)
          PageItem(
            onTap: () async {
              if (await Permission.systemAlertWindow.status.isDenied) {
                await Permission.systemAlertWindow.request();
              }
              if (await Permission.systemAlertWindow.isPermanentlyDenied) {
                await openAppSettings();
              }

              setState(() {});
            },
            label: 'Allow your alert window',
            sublabel:
                'The alert window permission is required for app functions',
            lottie: 'packages/dghub_permission/assets/location.json',
          ),
      if (widget.location)
        if (await Permission.location.status.isDenied)
          PageItem(
            onTap: () async {
              if (await Permission.location.status.isDenied) {
                await Permission.location.request();
              }
              if (await Permission.location.isPermanentlyDenied) {
                await openAppSettings();
              }

              setState(() {});
            },
            label: 'Allow your Location',
            sublabel: 'The location permission is required for app functions',
            lottie: 'packages/dghub_permission/assets/location.json',
          ),
      if (widget.microphone)
        if (await Permission.microphone.status.isDenied)
          PageItem(
            onTap: () async {
              if (await Permission.microphone.status.isDenied) {
                await Permission.microphone.request();
              }
              if (await Permission.microphone.status.isPermanentlyDenied) {
                await openAppSettings();
              }

              setState(() {});
            },
            label: 'Allow your Microphone',
            sublabel: 'The microphone permission is required for app functions',
            lottie: 'packages/dghub_permission/assets/microphone.json',
          ),
      if (widget.contact)
        if (await Permission.contacts.status.isDenied)
          PageItem(
            onTap: () async {
              if (await Permission.contacts.status.isDenied) {
                await Permission.contacts.request();
              }
              if (await Permission.contacts.status.isPermanentlyDenied) {
                await openAppSettings();
              }

              setState(() {});
            },
            label: 'Allow your Contact',
            sublabel: 'The contact permission is required for app functions',
            lottie: 'packages/dghub_permission/assets/contact.json',
          ),
      if (widget.camera)
        if (await Permission.camera.status.isDenied)
          PageItem(
            onTap: () async {
              if (await Permission.camera.status.isDenied) {
                await Permission.camera.request();
              }
              if (await Permission.camera.status.isPermanentlyDenied) {
                await openAppSettings();
              }

              setState(() {});
            },
            label: 'Allow your Camera',
            sublabel: 'The camera permission is required for app functions',
            lottie: 'packages/dghub_permission/assets/camera.json',
          ),
    ];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Tools.statusBarColor(theme.colorScheme.background);
    Tools.navBarColor(theme.colorScheme.background);
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: FutureBuilder(
              future: getList(context),
              builder: (context, state) {
                if (state.hasData && state.data != null) {
                  if (state.data!.isEmpty) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          PageItem(
                              lottieColorRemove: true,
                              buttonLabel: 'Done',
                              label: 'Success',
                              sublabel: 'Allowed all permissions',
                              lottie:
                                  'packages/dghub_permission/assets/success.json',
                              onTap: widget.onComplete),
                        ],
                      ),
                    );
                  }

                  return CircularRevealAnimation(
                    animation: animation,
                    centerAlignment: Alignment.center,
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: controller,
                            children: state.data!,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: SmoothPageIndicator(
                              controller: controller, // PageController
                              count: state.data!.length,
                              effect: JumpingDotEffect(
                                  activeDotColor:
                                      Theme.of(context).primaryColor,
                                  dotWidth: 10,
                                  dotHeight: 10), // your preferred effect
                              onDotClicked: (index) {
                                controller.jumpToPage(index);
                              }),
                        )
                      ],
                    ),
                  );
                }
                return const SizedBox();
              }),
        ),
      ),
    );
  }
}

class LottieCache {
  static final Map<String, LottieComposition> _compositions = {};

  /// Caches the given [LottieAsset]s.
  static Future<void> add(String assetName) async {
    _compositions[assetName] = await AssetLottie(assetName).load();
  }

  static Widget load(String assetName, Widget fallback) {
    final composition = _compositions[assetName];
    return composition != null ? Lottie(composition: composition) : fallback;
  }
}
