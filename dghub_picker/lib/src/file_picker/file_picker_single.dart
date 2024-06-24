import 'package:dghub_picker/src/tools/tools.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:universal_io/io.dart';

class DGHubFilePickerSingle extends StatefulWidget {
  final Function(File) resultPath;
  final Function(Uint8List) resultBytes;
  final double width;
  final double height;
  final List<String> supports;
  const DGHubFilePickerSingle({
    required this.resultPath,
    required this.resultBytes,
    this.width = 60,
    this.height = 60,
    this.supports = const ['*'],
    Key? key,
  }) : super(key: key);

  @override
  State<DGHubFilePickerSingle> createState() => _DGHubFilePickerSingleState();
}

class _DGHubFilePickerSingleState extends State<DGHubFilePickerSingle> {
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
            color: theme.colorScheme.surface,
            border: Border.all(width: 0.3, color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Builder(
              builder: (context) {
                return Container(
                    decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(10)),
                    width: widget.width,
                    height: widget.height,
                    child: const Icon(Icons.file_present_outlined,
                        color: Colors.grey));
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
                      if (filePath == null) {
                        return Marquee(
                          child: const Text(
                            'Click to pick a file',
                            style: TextStyle(fontSize: 10),
                          ),
                        );
                      }

                      return Marquee(
                        child: Text(
                          '$filePath',
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
        .pickFiles(type: FileType.custom, allowedExtensions: widget.supports);

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
