import 'dart:convert';
import 'package:dghub_language/src/tools.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:rabbit_converter/rabbit_converter.dart';
import 'dghub_language_model.dart';

class DGHubLanguageProvider extends ChangeNotifier {
  DGHubLanguageProvider(DGHubLanguageModel data) {
    init(data);
  }

  DGHubLanguageModel? getData;
  var box = Hive.box('language');

  get(String key) {
    try {
      return getData?.data?[key] ?? 'null';
    } catch (e) {
      return 'null';
    }
  }

  init(DGHubLanguageModel? data) async {
    getData = data;

    if (box.get('count') != data?.data?.length) {
      box.put('count', data?.data?.length);
      box.put('language', 'en');
      box.put('en', getData?.toJson());
    }
    read();
  }

  change(DGHubLanguageModel model) {
    box.put('language', model.code);
    if (Tools.isUnicode()) {
      box.put(model.code, model.toJson());
    } else {
      box.put(
          model.code, jsonDecode(Rabbit.uni2zg(jsonEncode(model.toJson()))));
    }
    read();
  }

  read() {
    var lg = box.get('language') ?? 'en';
    if (kDebugMode) {
      print(lg);
    }
    if (box.get(lg) != null) {
      DGHubLanguageModel result = DGHubLanguageModel.fromJson(box.get(lg));

      getData = result;
    }

    notifyListeners();
  }
}
