// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:custom_thumbnail_video/video_thumbnail_web.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  VideoThumbnailWeb.registerWith(registrar);
  FilePickerWeb.registerWith(registrar);
  registrar.registerMessageHandler();
}
