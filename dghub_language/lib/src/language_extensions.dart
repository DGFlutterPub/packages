import 'package:dghub_language/src/dghub_language_model.dart';
import 'package:dghub_language/src/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef M = Map<dynamic, dynamic>;

extension LanguageExtension on BuildContext {
  String tr(String key) {
    try {
      return Provider.of<DGHubLanguageProvider>(this, listen: true).get(key);
    } catch (e) {
      return Provider.of<DGHubLanguageProvider>(this, listen: false).get(key);
    }
  }

  languageChange(DGHubLanguageModel m) {
    Provider.of<DGHubLanguageProvider>(this, listen: false).change(m);
  }

  languageCurrentCode() {
    return Provider.of<DGHubLanguageProvider>(this, listen: false)
        .box
        .get('language');
  }

  DGHubLanguageModel? languageCurrent() {
    try {
      return DGHubLanguageModel.fromJson(
          Provider.of<DGHubLanguageProvider>(this, listen: false)
              .box
              .get(languageCurrentCode()));
    } catch (e) {
      return null;
    }
  }
}
