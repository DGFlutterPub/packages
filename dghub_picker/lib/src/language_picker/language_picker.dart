import 'package:flutter/material.dart';
import 'package:language_picker/language_picker_dialog.dart';
import 'package:language_picker/languages.dart';

showLanguagePicker(
    {required BuildContext context,
    required Function(Language language) onResult}) {
  Widget buildDialogItem(Language language) => Row(
        children: <Widget>[
          Text(language.name),
          const SizedBox(width: 8.0),
          Flexible(child: Text("(${language.isoCode})"))
        ],
      );

  return showDialog(
      context: context,
      builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: LanguagePickerDialog(
              titlePadding: const EdgeInsets.all(8.0),
              searchCursorColor: Colors.pinkAccent,
              searchInputDecoration:
                  const InputDecoration(hintText: 'Search...'),
              isSearchable: true,
              title: const Text('Select your language'),
              onValuePicked: (Language language) => onResult(language),
              itemBuilder: buildDialogItem)));
}
