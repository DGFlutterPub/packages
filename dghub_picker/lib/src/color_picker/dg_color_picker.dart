import 'package:dghub_edittext/dghub_edittext.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class DGHubColorPicker extends StatefulWidget {
  final Color? input;
  final Function(Color) result;
  const DGHubColorPicker({this.input, required this.result, Key? key})
      : super(key: key);

  @override
  State<DGHubColorPicker> createState() => _DGHubColorPickerState();
}

class _DGHubColorPickerState extends State<DGHubColorPicker> {
  TextEditingController colorTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ColorPicker(
                pickerColor:
                    widget.input == null ? theme.primaryColor : widget.input!,
                onColorChanged: (color) {
                  var res = color;
                  if (kDebugMode) {
                    print(res);
                  }
                  widget.result(res);
                },
                colorPickerWidth: 200,
                pickerAreaHeightPercent: 0.7,
                displayThumbColor: true,
                paletteType: PaletteType.hsvWithHue,
                enableAlpha: false,
                labelTypes: const [],
                pickerAreaBorderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(2), topRight: Radius.circular(2)),
                hexInputController: colorTextEditingController,
                portraitOnly: true,
              ),
              DGHubEditText(
                config: EditTextConfig(
                    maxLength: 8,
                    leftWidget: const Icon(
                      Icons.tag,
                      size: 20,
                    ),
                    controller: colorTextEditingController,
                    hint: theme.primaryColor.value
                        .toRadixString(16)
                        .toUpperCase(),
                    label: 'Color',
                    rightWidget: const Icon(Icons.paste, size: 20)),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
