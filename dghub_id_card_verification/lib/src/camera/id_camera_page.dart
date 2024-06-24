import 'dart:io';

import 'package:dghub_id_card_verification/src/overlay/flutter_camera_overlay.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import '../overlay/model.dart';

class IDCameraPage extends StatefulWidget {
  final Function(File file)? result;
  final bool enabledIdFrame;
  const IDCameraPage({this.enabledIdFrame = false, this.result, Key? key})
      : super(key: key);

  @override
  State<IDCameraPage> createState() => _IDCameraPageState();
}

class _IDCameraPageState extends State<IDCameraPage> {
  OverlayFormat format = OverlayFormat.cardID1;
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: widget.enabledIdFrame
          ? BottomNavigationBar(
              selectedItemColor: theme.primaryColor,
              unselectedItemColor: Colors.grey,
              backgroundColor: theme.colorScheme.background,
              currentIndex: tab,
              onTap: (value) {
                setState(() {
                  tab = value;
                });
                switch (value) {
                  case (0):
                    setState(() {
                      format = OverlayFormat.cardID1;
                    });
                    break;
                  case (1):
                    setState(() {
                      format = OverlayFormat.cardID3;
                    });
                    break;
                  case (2):
                    setState(() {
                      format = OverlayFormat.simID000;
                    });
                    break;
                }
              },
              items: [
                BottomNavigationBarItem(
                  backgroundColor: theme.cardColor,
                  icon: const Icon(Icons.contact_mail),
                  label: 'Small',
                ),
                BottomNavigationBarItem(
                    backgroundColor: theme.cardColor,
                    icon: const Icon(Icons.contact_mail),
                    label: 'Big'),
                // BottomNavigationBarItem(icon: Icon(Icons.sim_card), label: 'Sim'),
              ],
            )
          : null,
      backgroundColor: Colors.white,
      body: FutureBuilder<List<CameraDescription>?>(
        future: availableCameras(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'No camera found',
                    style: TextStyle(color: Colors.black),
                  ));
            }

            return CameraOverlay(
                snapshot.data!.first, CardOverlay.byFormat(format),
                enabled: widget.enabledIdFrame, (XFile file) {
              if (widget.result != null) {
                widget.result!(File(file.path));
                Navigator.pop(context);
              }
            },
                info:
                    'Position your ID card within the rectangle and ensure the image is perfectly readable.',
                label: 'Scanning ID Card');
          } else {
            return const Align(
                alignment: Alignment.center,
                child: Text(
                  'Fetching cameras',
                  style: TextStyle(color: Colors.black),
                ));
          }
        },
      ),
    );
  }
}
