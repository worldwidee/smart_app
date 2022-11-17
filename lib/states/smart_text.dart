import 'package:get/get.dart';
import 'app_settings.dart';


class SmartText {
  List<String> meanings = [];
  SmartText(this.meanings);
  String get text {
    return meanings[Get.find<AppSettings>().getIndexOfLang()];
  }
}

class SmartList {
  List<List<String>> meanings = [];
  SmartList(this.meanings);
  List<String> get text {
    return meanings[Get.find<AppSettings>().getIndexOfLang()];
  }
}
