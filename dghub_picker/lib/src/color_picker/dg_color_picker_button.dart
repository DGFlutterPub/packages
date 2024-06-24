import 'package:dghub_picker/src/color_picker/dg_color_picker.dart';
import 'package:flutter/material.dart';

class DGHubColorPickerButton extends StatefulWidget {
  final String title;
  final Color? input;
  final Function(Color) result;
  const DGHubColorPickerButton(
      {this.input, required this.title, required this.result, super.key});

  @override
  State<DGHubColorPickerButton> createState() => _DGHubColorPickerButtonState();
}

class _DGHubColorPickerButtonState extends State<DGHubColorPickerButton> {
  Color? color;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.input != null) {
        widget.result(widget.input!);
      } else if (color == null) {
        widget.result(Theme.of(context).primaryColor);
      }
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: DGHubColorPicker(
                    input: color == null
                        ? widget.input ?? theme.primaryColor
                        : color!,
                    result: (r) {
                      widget.result(r);
                      color = r;
                      setState(() {});
                    },
                  ));
            });
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 0.3, color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            color: theme.colorScheme.surface),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: widget.input != null
                      ? widget.input!
                      : color ?? theme.primaryColor),
              child: const Icon(
                Icons.colorize,
                size: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  Text(
                      color == null
                          ? widget.input != null
                              ? '#${widget.input!.value.toRadixString(16)}'
                              : '#${theme.primaryColor.value.toRadixString(16)}'
                          : '#${color!.value.toRadixString(16)}',
                      style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
