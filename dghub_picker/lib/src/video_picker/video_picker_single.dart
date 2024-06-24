import 'package:custom_thumbnail_video/index.dart';
import 'package:custom_thumbnail_video/video_thumbnail.dart';
import 'package:dghub_image/dghub_image.dart';
import 'package:dghub_picker/src/tools/tools.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

class DGHubVideoPickerSingle extends StatefulWidget {
  final Function(File) resultPath;
  final Function(Uint8List) resultBytes;
  final String? videoUrl;
  final double videoWidth;
  final double videoHeight;
  const DGHubVideoPickerSingle({
    this.videoUrl,
    required this.resultPath,
    required this.resultBytes,
    this.videoWidth = 80,
    this.videoHeight = 80,
    Key? key,
  }) : super(key: key);

  @override
  State<DGHubVideoPickerSingle> createState() => _DGHubVideoPickerSingleState();
}

class _DGHubVideoPickerSingleState extends State<DGHubVideoPickerSingle> {
  TextEditingController videoTextController = TextEditingController();
  String? fileSize;
  String? filePath;
  String? fileExtension;
  Uint8List? bytes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Future<XFile?> getTUrl() async {
      return await VideoThumbnail.thumbnailFile(
        video: widget.videoUrl.toString(),
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.WEBP,
        maxHeight:
            64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
        quality: 75,
      );
    }

    Future<Uint8List> getTFile() async {
      return await VideoThumbnail.thumbnailData(
        video: filePath!,
        imageFormat: ImageFormat.JPEG,
        maxWidth:
            128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
        quality: 25,
      );
    }

    return GestureDetector(
      onTap: pick,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            border: Border.all(width: 0.3, color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Builder(
              builder: (context) {
                if (filePath == null &&
                    widget.videoUrl == null &&
                    bytes == null) {
                  return Container(
                      decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(10)),
                      width: widget.videoWidth,
                      height: widget.videoHeight,
                      child: const Icon(Iconsax.video_add, color: Colors.grey));
                }

                if (bytes != null) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.memory(
                      bytes!,
                      fit: BoxFit.cover,
                      width: widget.videoWidth,
                      height: widget.videoHeight,
                      errorBuilder: (context, path, error) {
                        return Container(
                            decoration: BoxDecoration(
                                color: theme.cardColor,
                                borderRadius: BorderRadius.circular(10)),
                            width: widget.videoWidth,
                            height: widget.videoHeight,
                            child: const Icon(Iconsax.gallery_import,
                                color: Colors.grey));
                      },
                    ),
                  );
                }

                if (filePath != null) {
                  return FutureBuilder<Uint8List>(
                      future: getTFile(),
                      builder: (context, state) {
                        if (state.hasData && state.data != null) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              state.data!,
                              fit: BoxFit.cover,
                              width: widget.videoWidth,
                              height: widget.videoHeight,
                              errorBuilder: (context, path, error) {
                                return Container(
                                    decoration: BoxDecoration(
                                        color: theme.cardColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: widget.videoWidth,
                                    height: widget.videoHeight,
                                    child: const Icon(Iconsax.gallery_import,
                                        color: Colors.grey));
                              },
                            ),
                          );
                        }
                        return SizedBox();
                      });
                }

                return FutureBuilder<XFile?>(
                  future: getTUrl(),
                  builder: (context, state) {
                    if (state.hasData && state.data != null) {
                      return DGHubImage.network(
                        radius: 10,
                        load: state.data!.path,
                        width: widget.videoWidth,
                        height: widget.videoHeight,
                      );
                    }
                    return SizedBox();
                  },
                );
              },
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(builder: (context) {
                      if (filePath == null && widget.videoUrl == null) {
                        return Marquee(
                          child: const Text(
                            'Click to pick a video',
                            style: TextStyle(fontSize: 10),
                          ),
                        );
                      }

                      if (filePath != null) {
                        return Marquee(
                          child: Text(
                            '$filePath',
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      }

                      return Marquee(
                        child: Text(
                          '${widget.videoUrl}',
                          style: const TextStyle(fontSize: 10),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 5,
                    ),
                    if (fileSize != null)
                      Text(
                        '$fileSize',
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    const SizedBox(
                      height: 5,
                    ),
                    if (fileExtension != null)
                      Text(
                        '$fileExtension',
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void pick() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['mp4', 'mkv']);

    if (result != null) {
      var pick = result.files.single;
      bytes = pick.bytes;

      if (!kIsWeb) {
        File file = File(pick.path!);
        filePath = pick.path!.toString();
        widget.resultPath(file);
      }
      if (kIsWeb) {
        var value = File.fromRawPath(bytes!);
        widget.resultPath(value);
        widget.resultBytes(bytes!);
      }

      fileExtension = pick.extension!.toString();

      fileSize = Tools.getSize(pick.size.toDouble());
      setState(() {});
    } else {}
  }
}
