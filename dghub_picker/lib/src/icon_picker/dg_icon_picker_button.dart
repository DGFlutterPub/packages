import 'package:dghub_picker/src/icon_picker/dg_icon_picker.dart';
import 'package:flutter/material.dart';

class DGHubIconPickerButton extends StatefulWidget {
  final String title;
  final IconData? input;
  final Function(IconData icon) result;

  const DGHubIconPickerButton(
      {this.input, required this.result, required this.title, super.key});

  @override
  State<DGHubIconPickerButton> createState() => _DGHubIconPickerButtonState();
}

class _DGHubIconPickerButtonState extends State<DGHubIconPickerButton> {
  IconData? icon;

  @override
  void didChangeDependencies() {
    if (widget.input != null) {
      icon = widget.input;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DGHubIconPicker(
                    result: (i) {
                      widget.result(i);
                      icon = i;
                      setState(() {});
                    },
                  )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 0.3, color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            color: theme.colorScheme.surface),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: theme.primaryColor),
              child: Center(
                child: Icon(
                  icon ?? Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
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
                      icon == null ? 'Pick a icon' : icon!.codePoint.toString(),
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
