import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appSettings.dart';

class AppColors extends GetxController {
  late ColorItem _backGroundColor;
  late ColorItem _secondColor;
  late ColorItem _textColor;
  late ColorItem _secondTextColor;

  AppColors(
      {ColorItem? backGroundColor,
      ColorItem? secondColor,
      ColorItem? secondTextColor,
      ColorItem? textColor}) {
    if (backGroundColor != null) _backGroundColor = backGroundColor;
    if (secondColor != null) _secondColor = secondColor;
    if (textColor != null) _textColor = textColor;
    if (secondTextColor != null) _secondTextColor = secondTextColor;
    setItems();
  }

  Color get backGroundColor {
    return Get.find<AppSettings>().darkMode == true
        ? _backGroundColor.darkColor
        : _backGroundColor.lightColor;
  }

  Color get secondColor {
    return Get.find<AppSettings>().darkMode == true
        ? _secondColor.darkColor
        : _secondColor.lightColor;
  }

  Color get textColor {
    return Get.find<AppSettings>().darkMode == true
        ? _textColor.darkColor
        : _textColor.lightColor;
  }
  Color get secondTextColor {
    return Get.find<AppSettings>().darkMode == true
        ? _secondTextColor.darkColor
        : _secondTextColor.lightColor;
  }

  Map<String, ColorItem> _specificColors = {};

  void addSpecificColor({required ColorItem color, required String name}) {
    _specificColors[name] = color;
  }

  void removeSpecificColor(String name) {
    _specificColors.removeWhere((key, value) => key == name);
  }

  Color specific(String name) {
    return Get.find<AppSettings>().darkMode == true
        ? _specificColors[name]!.darkColor
        : _specificColors[name]!.lightColor;
  }

  void setItems() {
    _backGroundColor = ColorItem(
        darkColor: const Color(0xFF181818),
        lightColor: const Color(0xFFf6fcf7));
    _secondColor =
        ColorItem(darkColor: Colors.black, lightColor: const Color(0xFF696c6e));
    _textColor = ColorItem(darkColor: Colors.white, lightColor: Colors.black);
    _secondTextColor = ColorItem(darkColor: Colors.white, lightColor: Colors.white);
  }
}

class ColorItem {
  Color darkColor;
  Color lightColor;
  ColorItem({required this.darkColor, required this.lightColor});
}
