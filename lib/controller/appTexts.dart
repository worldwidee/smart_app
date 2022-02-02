import 'dart:io';

import 'appSettings.dart';

import 'package:get/get.dart';

class AppTexts extends GetxController {
  List<String> _languages = [];
  get languages => _languages;
  final Map<String, TextItem> _appTexts = {};

  void setTexts(String path) {
    _appTexts.clear();
    List<String> lines =
        File(path).readAsStringSync().split("\n").map((e) => e.trim()).toList();
    _languages = lines[0].split(",");
    for (int i = 1; i < lines.length; i++) {
      List<String> parts = lines[i].split("|=|");
      String name = parts[0];
      List<String> meanings = parts[1].split("|,|");
      _appTexts[name] = TextItem(name: name, meanings: meanings);
    }
  }

  String getText(String name) {
    String lang = Get.find<AppSettings>().language;
    return _appTexts[name]!.meanings[_languages.indexOf(lang)];
  }
}

class TextItem {
  String name;
  List<String> meanings = [];
  TextItem({required this.name, required this.meanings});
}
