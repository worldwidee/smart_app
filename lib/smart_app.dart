import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SmartAppPanel {
  late AppColors appColors;
  late AppFonts appFonts;
  late AppSettings appSettings;
  late AppTexts appTexts;
  late PageState pageState;

  void start(
      {bool darkMode = false,
      void Function(bool status)? afterConnectionFunc,
      InitPages? initPages,
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
    if (initPages != null) {
      pageState = Get.put(PageState());
      pageState.initPages(
          pages: initPages.pages, initPageName: initPages.initPage);
    }
  }
}

class InitPages {
  Map<String, Widget> pages = {};

  late String initPage;
}

class PageState extends GetxController {
  Map<String, Widget> _pages = {};

  late String currentPage;
  dynamic _disposeFunction;
  dynamic _deliveringItem;

  get deliverinItem=>_deliveringItem;


  set setDispose(dynamic dispose) {
    _disposeFunction = dispose;
  }
  void initPages(
      {required Map<String, Widget> pages, required String initPageName}) {
    _pages = pages;
    currentPage = initPageName;
  }
  get pages=>_pages;
  void changePage({required String page, dynamic item = ""}) {
    if (page != currentPage) {
      _deliveringItem = item;
      currentPage = page;
      if (_disposeFunction != null) {
        _disposeFunction();
      }
      _disposeFunction = () {};
      update();
    }
  }

  get page => _pages[currentPage];
}



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

class AppFonts extends GetxController {
  double _appWidth = 0;
  double _appHeight = 0;
  late double _size1, _size2, _size3, _size4, _size5, _size6, _totalSize;
  final Map<String, double> _sizeRatios = {
    "xS": 0.005,
    "S": 0.007,
    "M": 0.009,
    "L": 0.012,
    "xL": 0.015,
    "mega": 0.020
  };
  final Map<String, double> _staticSizes = {
    "xS": 8,
    "S": 12,
    "M": 16,
    "L": 20,
    "xL": 26,
    "mega": 40
  };
  double _iconRatio = 0.02, _staticIconSize = 20;
  late double _iconSize;
  final Map<String, double> _specificSizes = {};

  get iconRatio => _iconRatio;
  get staticIconSize => _staticIconSize;
  get iconSize => _iconSize;
  get appWidth => _appWidth;
  get appHeight => _appHeight;
  get totalSize => _totalSize;

  double specificSize(String name) {
    return _specificSizes[name]!;
  }

  void changeSizes(
      {required double width,
      required double height,
      bool isResposible = true}) {
    _appWidth = width;
    _appHeight = height;
    _totalSize = _appWidth + _appHeight;
    _size1 =
        isResposible ? _totalSize * _sizeRatios["xS"]! : _staticSizes["xS"]!;
    _size2 = isResposible ? _totalSize * _sizeRatios["S"]! : _staticSizes["S"]!;
    _size3 = isResposible ? _totalSize * _sizeRatios["M"]! : _staticSizes["M"]!;
    _size4 = isResposible ? _totalSize * _sizeRatios["L"]! : _staticSizes["L"]!;
    _size5 =
        isResposible ? _totalSize * _sizeRatios["xL"]! : _staticSizes["xL"]!;
    _size6 =
        isResposible ? _totalSize * _sizeRatios["mega"]! : _staticSizes["mega"]!;
    _iconSize = isResposible ? _totalSize * _iconRatio : _staticIconSize;
    update();
  }

  void changeStaticSize({required String name, required double size}) {
    _staticSizes[name] = size;
    update();
  }

  void changeStaticSizeRatio({required String name, required double ratio}) {
    _sizeRatios[name] = ratio;
    update();
  }

  void addSpecificSize({required double size, required String name}) {
    _specificSizes[name] = size;
  }

  void removeSpecificSize(String name) {
    _specificSizes.removeWhere((key, value) => key == name);
  }

  void changeStaticIconSize(double size) {
    _staticIconSize = size;
    update();
  }

  void changeStaticIconRatio(double ratio) {
    _iconRatio = ratio;
    update();
  }

  TextStyle specific(
      {required String specificType,
      Color? color,
      bool? isBold,
      FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: _specificSizes[specificType],
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle mega(
      {Color? color, bool? isBold, FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: _size6,
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle xL(
      {Color? color, bool? isBold, FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: _size5,
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle L(
      {Color? color, bool? isBold, FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: _size4,
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle M(
      {Color? color, bool? isBold, FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: _size3,
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle S(
      {Color? color, bool? isBold, FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: _size2,
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle xS(
      {Color? color, bool? isBold, FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: _size1,
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }
}

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


class AppSettings extends GetxController {
  late bool _darkMode;
  late bool? _connected;
  late String _language;
  bool _isAuthenticationVerified = false;
  String get language => _language;
  bool? get connected => _connected;
  bool get darkMode => _darkMode;
  bool get isAuthenticationVerified => _isAuthenticationVerified;
  void Function(bool status)? _afterConnectionFunc;
  final Map<String, void Function()> _specificSettings = {};
  final Map<String, dynamic> specificVariables = {};
  AppSettings(
      {bool darkMode = false,
      void Function(bool status)? afterConnectionFunc,
      String initLanguage = "English"}) {
    _connected = null;
    connectionListen();
    _darkMode = darkMode;
    _language = initLanguage;
    _afterConnectionFunc = afterConnectionFunc;
  }
  
  void signIn() {
    _isAuthenticationVerified = true;
    update();
  }

  void signOut() {
    _isAuthenticationVerified = false;
    update();
  }

  dynamic specificSetting(String name) {
    return _specificSettings[name]!;
  }

  void addSpecificSetting(
      {required void Function() function, required String name}) {
    _specificSettings[name] = () {
      function();
      update();
    };
  }

  void removeSpecificSetting(String name) {
    _specificSettings.removeWhere((key, value) => key == name);
  }

  void addSpecificVariable({required var variable, required String name}) {
    specificVariables[name] = variable;
  }

  void removeSpecificVariable(String name) {
    specificVariables.removeWhere((key, value) => key == name);
  }

  set changeDarkMode(bool mode) {
    _darkMode = mode;
    update();
  }

  set changeLanguage(String language) {
    _language = language;
    update();
  }

  set afterConnectionFunc(void Function(bool status) function) {
    _afterConnectionFunc = function;
  }

  void connectionListen() {
    InternetConnectionChecker().onStatusChange.listen((status) async {
      switch (status) {
        case InternetConnectionStatus.connected:
          _connected = true;
          if (_afterConnectionFunc != null) {
            _afterConnectionFunc!(_connected!);
          }
          update();
          break;
        case InternetConnectionStatus.disconnected:
          _connected = false;
          if (_afterConnectionFunc != null) {
            _afterConnectionFunc!(_connected!);
          }
          update();
          break;
      }
    });
  }
}
