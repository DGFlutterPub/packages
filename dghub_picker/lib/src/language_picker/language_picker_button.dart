import 'package:dghub_picker/src/language_picker/language_picker.dart';
import 'package:flutter/material.dart';
import 'package:language_picker/languages.dart';

class DGHubLanguagePickerButton extends StatefulWidget {
  final Language? input;
  final Function(Language) result;
  const DGHubLanguagePickerButton(
      {this.input, required this.result, super.key});

  @override
  State<DGHubLanguagePickerButton> createState() =>
      _DGHubLanguagePickerButtonState();
}

class _DGHubLanguagePickerButtonState extends State<DGHubLanguagePickerButton> {
  Language c = Language.fromIsoCode('en');

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      c = widget.input ?? c;
      widget.result(c);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        showLanguagePicker(
            context: context,
            onResult: (l) {
              c = l;
              widget.result(c);
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
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: theme.cardColor),
              child: Center(
                  child: Text(c.isoCode, style: const TextStyle(fontSize: 12))),
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
                    c.name,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
