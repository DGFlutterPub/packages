import 'package:dghub_image/dghub_image.dart';
import 'package:dghub_picker/src/tools/tools.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:universal_io/io.dart';

class DGHubImagePickerSingle extends StatefulWidget {
  final Function(File) resultPath;
  final Function(Uint8List) resultBytes;
  final String? imageUrl;
  final double imageWidth;
  final double imageHeight;
  const DGHubImagePickerSingle({
    this.imageUrl,
    required this.resultPath,
    required this.resultBytes,
    this.imageWidth = 80,
    this.imageHeight = 80,
    Key? key,
  }) : super(key: key);

  @override
  State<DGHubImagePickerSingle> createState() => _DGHubImagePickerSingleState();
}

class _DGHubImagePickerSingleState extends State<DGHubImagePickerSingle> {
  TextEditingController imageTextController = TextEditingController();
  String? fileSize;
  String? filePath;
  String? fileExtension;
  Uint8List? bytes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: pick,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: theme.cardColor,
            border: Border.all(
                width: 0.3,
                color:
                    Tools.isDarkTheme(context) ? Colors.white : Colors.black),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Builder(
              builder: (context) {
                if (filePath == null &&
                    (widget.imageUrl == null || widget.imageUrl == '') &&
                    bytes == null) {
                  return Container(
                      decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(10)),
                      width: widget.imageWidth,
                      height: widget.imageHeight,
                      child: Icon(Iconsax.gallery_import,
                          color: Tools.isDarkTheme(context)
                              ? Colors.white
                              : Colors.black));
                }

                if (bytes != null) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.memory(
                      bytes!,
                      fit: BoxFit.cover,
                      width: widget.imageWidth,
                      height: widget.imageHeight,
                      errorBuilder: (context, path, error) {
                        return Container(
                            decoration: BoxDecoration(
                                color: theme.cardColor,
                                borderRadius: BorderRadius.circular(10)),
                            width: widget.imageWidth,
                            height: widget.imageHeight,
                            child: Icon(Iconsax.gallery_import,
                                color: Tools.isDarkTheme(context)
                                    ? Colors.white
                                    : Colors.black));
                      },
                    ),
                  );
                }

                if (filePath != null) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      File(filePath!),
                      fit: BoxFit.cover,
                      width: widget.imageWidth,
                      height: widget.imageHeight,
                      errorBuilder: (context, path, error) {
                        return Container(
                            decoration: BoxDecoration(
                                color: theme.cardColor,
                                borderRadius: BorderRadius.circular(10)),
                            width: widget.imageWidth,
                            height: widget.imageHeight,
                            child: Icon(Iconsax.gallery_import,
                                color: Tools.isDarkTheme(context)
                                    ? Colors.white
                                    : Colors.black));
                      },
                    ),
                  );
                }
                return DGHubImage.network(
                  radius: 10,
                  load: widget.imageUrl.toString(),
                  width: widget.imageWidth,
                  height: widget.imageHeight,
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
                      if (filePath == null &&
                          (widget.imageUrl == null || widget.imageUrl == '')) {
                        return Marquee(
                          child: const Text(
                            'Click to pick a photo',
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
                          '${widget.imageUrl}',
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
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg', 'gif']);

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
