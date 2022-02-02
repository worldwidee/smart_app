import 'controller/appColors.dart';
import 'controller/appFonts.dart';
import 'controller/appSettings.dart';
import 'controller/appTexts.dart';
import 'package:get/get.dart';

class SmartAppPanel {
  late AppColors appColors;
  late AppFonts appFonts;
  late AppSettings appSettings;
  late AppTexts appTexts;

  void start(
      {bool darkMode = false,
      void Function(bool status)? afterConnectionFunc,
      String? textPath,
      String initLanguage = "English"}) {
    appSettings = Get.put(AppSettings(
        darkMode: darkMode,
        afterConnectionFunc: afterConnectionFunc,
        initLanguage: initLanguage));
    appFonts = Get.put(AppFonts());
    appColors = Get.put(AppColors());
    if (textPath != null) {
      appTexts = Get.put(AppTexts());
      appTexts.setTexts(textPath);
    }
  }
}
