import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../smart_app.dart';
import 'app_settings.dart';

class AppColors extends GetxController {
  late Appearance _currentAppearance;
  List<Appearance> _appearances = [];

  Color get backgroundColor {
    return _currentAppearance.backgroundColor;
  }

  Color get textColor {
    return _currentAppearance.textColor;
  }

  Color? get hintColor {
    return _currentAppearance.hintColor;
  }

  Color? get btnTextColor {
    return _currentAppearance.btnTextColor;
  }

  Color? get btnColor {
    return _currentAppearance.btnColor;
  }

  Color? get iconColor {
    return _currentAppearance.iconColor;
  }

  Color? get secondaryBackgroundColor {
    return _currentAppearance.secondaryBackgroundColor;
  }

  Color? get secondaryBtnColor {
    return _currentAppearance.secondaryBtnColor;
  }

  Color? get secondaryBtnTextColor {
    return _currentAppearance.secondaryBtnTextColor;
  }

  Color? get secondaryIconColor {
    return _currentAppearance.secondaryIconColor;
  }

  Color? get secondaryHintColor {
    return _currentAppearance.secondaryHintColor;
  }

  Color? get secondaryTextColor {
    return _currentAppearance.secondaryTextColor;
  }

  Color? get appBarBackgroundColor {
    return _currentAppearance.appBarBackgroundColor;
  }

  Color? get appBarBtnColor {
    return _currentAppearance.appBarBtnColor;
  }

  Color? get appBarBtnTextColor {
    return _currentAppearance.appBarBtnTextColor;
  }

  Color? get appBarIconColor {
    return _currentAppearance.appBarIconColor;
  }

  Color? get appBarHintColor {
    return _currentAppearance.appBarHintColor;
  }

  Color? get appBarTextColor {
    return _currentAppearance.appBarTextColor;
  }

  Color? get dialogBackgroundColor {
    return _currentAppearance.dialogBackgroundColor;
  }

  Color? get dialogBtnColor {
    return _currentAppearance.dialogBtnColor;
  }

  Color? get dialogBtnTextColor {
    return _currentAppearance.dialogBtnTextColor;
  }

  Color? get dialogIconColor {
    return _currentAppearance.dialogIconColor;
  }

  Color? get dialogHintColor {
    return _currentAppearance.dialogHintColor;
  }

  Color? get dialogTextColor {
    return _currentAppearance.dialogTextColor;
  }

  Color? get drawerBackgroundColor {
    return _currentAppearance.drawerBackgroundColor;
  }

  Color? get drawerBtnColor {
    return _currentAppearance.drawerBtnColor;
  }

  Color? get drawerBtnTextColor {
    return _currentAppearance.drawerBtnTextColor;
  }

  Color? get drawerIconColor {
    return _currentAppearance.drawerIconColor;
  }

  Color? get drawerHintColor {
    return _currentAppearance.drawerHintColor;
  }

  Color? get drawerTextColor {
    return _currentAppearance.drawerTextColor;
  }

  String get name {
    return _currentAppearance.name;
  }

  AppColors.withAppearances(AppAppearances appearances) {
    _appearances = appearances.appearances;
    _currentAppearance = appearances.initAppearance;
  }
  set setAppAppearances(AppAppearances appearances) {
    _appearances = appearances.appearances;
    _currentAppearance = appearances.initAppearance;
  }

  void changeAppearance(String name) {
    _currentAppearance =
        _appearances.singleWhere((element) => element.name == name);
    update();
    Get.find<AppSettings>().update();
  }
}

class Appearance {
  late Color backgroundColor, textColor;
  Color? hintColor, btnColor, btnTextColor, iconColor;
  Color? secondaryBackgroundColor,
      secondaryTextColor,
      secondaryHintColor,
      secondaryBtnTextColor,
      secondaryIconColor,
      secondaryBtnColor;
  Color? appBarBackgroundColor,
      appBarTextColor,
      appBarHintColor,
      appBarBtnTextColor,
      appBarIconColor,
      appBarBtnColor;
  Color? drawerBackgroundColor,
      drawerTextColor,
      drawerHintColor,
      drawerBtnTextColor,
      drawerIconColor,
      drawerBtnColor;
  Color? dialogBackgroundColor,
      dialogTextColor,
      dialogHintColor,
      dialogBtnTextColor,
      dialogIconColor,
      dialogBtnColor;
  late String name;

  Appearance(
      {required this.name,
      required this.backgroundColor,
      required this.textColor,
      this.btnTextColor,
      this.hintColor,
      this.btnColor,
      this.iconColor,
      this.secondaryBackgroundColor,
      this.secondaryBtnColor,
      this.secondaryTextColor,
      this.secondaryHintColor,
      this.secondaryBtnTextColor,
      this.secondaryIconColor,
      this.appBarBackgroundColor,
      this.appBarTextColor,
      this.appBarHintColor,
      this.appBarBtnTextColor,
      this.appBarBtnColor,
      this.appBarIconColor,
      this.drawerBackgroundColor,
      this.drawerTextColor,
      this.drawerHintColor,
      this.drawerBtnTextColor,
      this.drawerBtnColor,
      this.drawerIconColor,
      this.dialogBackgroundColor,
      this.dialogTextColor,
      this.dialogHintColor,
      this.dialogBtnTextColor,
      this.dialogBtnColor,
      this.dialogIconColor});
  Appearance.dark() {
    name = "dark";
    backgroundColor = const Color(0xFF181818);
    textColor = Colors.white;
    btnColor = Colors.black;
    btnTextColor = Colors.white;
    hintColor = Colors.grey[500];
    iconColor = Color.fromARGB(255, 192, 192, 192);
    secondaryBackgroundColor = const Color(0xFF252526);
    secondaryTextColor = Colors.white;
    secondaryBtnColor = Color.fromARGB(255, 48, 50, 51);
    secondaryBtnTextColor = Colors.white;
    secondaryIconColor = const Color.fromARGB(255, 192, 192, 192);
    secondaryHintColor = Colors.grey[500];
    appBarBackgroundColor = const Color(0xFF333333);
    appBarBtnTextColor = Colors.white;
    appBarBtnColor = Color.fromARGB(255, 48, 50, 51);
    appBarTextColor = Colors.white;
    appBarIconColor = const Color(0xFF858585);
    appBarHintColor = Colors.grey[500];
    drawerBackgroundColor = Colors.black;
    drawerBtnTextColor = Colors.white;
    drawerBtnColor = Color.fromARGB(255, 48, 50, 51);
    drawerTextColor = Colors.white;
    drawerIconColor = const Color(0xFF858585);
    drawerHintColor = Colors.grey[500];
    dialogBackgroundColor = const Color(0xFF333333);
    dialogBtnTextColor = Colors.white;
    dialogBtnColor = Color.fromARGB(255, 48, 50, 51);
    dialogIconColor = const Color.fromARGB(255, 192, 192, 192);
    dialogTextColor = const Color.fromARGB(255, 192, 192, 192);
    dialogHintColor = Colors.grey[500];
  }
  Appearance.light() {
    name = "light";
    backgroundColor = Colors.white;
    textColor = Colors.black;
    hintColor = Colors.grey[600];
    btnColor = Color.fromARGB(255, 183, 185, 185);
    btnTextColor = Colors.black;
    iconColor = Colors.black;
    secondaryBackgroundColor = const Color(0xFFF3F3F3);
    secondaryTextColor = Colors.black;
    secondaryBtnColor = const Color.fromARGB(255, 55, 58, 59);
    secondaryBtnTextColor = Colors.white;
    secondaryIconColor = Colors.black;
    secondaryHintColor = Colors.grey[600];
    appBarBackgroundColor = const Color(0xFFDDDDDD);
    appBarBtnTextColor = Colors.black;
    appBarBtnColor = const Color.fromARGB(255, 161, 161, 161);
    appBarTextColor = Colors.black;
    appBarIconColor = Colors.black;
    appBarHintColor = Colors.grey[600];
    drawerBackgroundColor = const Color(0xFFDDDDDD);
    drawerBtnTextColor = Colors.black;
    drawerIconColor = Colors.black;
    drawerBtnColor = const Color.fromARGB(255, 161, 161, 161);
    drawerTextColor = Colors.black;
    drawerHintColor = Colors.grey[600];
    dialogBackgroundColor = const Color(0xFFDDDDDD);
    dialogBtnTextColor = Colors.black;
    dialogBtnColor = const Color.fromARGB(255, 161, 161, 161);
    dialogTextColor = Colors.black;
    dialogIconColor = Colors.black;
    dialogHintColor = Colors.grey[600];
  }
}
