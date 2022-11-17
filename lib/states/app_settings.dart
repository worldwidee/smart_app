import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_app/smart_app.dart';
import '../functions/functions.dart';

class AppSettings extends GetxController {
  late bool? _connected;
  late String _language;
  late bool _isMobile, _isDesktop, _isWeb;
  late bool _mobileMode, _landScape, _midMode, _largeMode;
  late List<String> _languages;
  String get language => _language;
  List<String> get languages => _languages;
  bool? get connected => _connected;
  bool get mobileMode => _mobileMode;
  bool get isMobile => _isMobile;
  bool get landScape => _landScape;
  bool get largeMode => _largeMode;
  bool get midMode => _midMode;
  bool get isDesktop => _isDesktop;
  bool get isWeb => _isWeb;
  bool get anyMobile => mobileMode || isMobile;
  void Function(bool status)? _afterConnectionFunc;
  final Map<String, void Function()> _specificSettings = {};
  final Map<String, dynamic> specificVariables = {};

  set mobileMode(bool status) {
    _mobileMode = status;
  }

  set midMode(bool status) {
    _midMode = status;
  }

  set isMobile(bool status) {
    _isMobile = status;
  }

  set isDesktop(bool status) {
    _isDesktop = status;
  }

  set largeMode(bool status) {
    _largeMode = status;
  }

  set isWeb(bool status) {
    _isWeb = status;
  }

  set landScape(bool status) {
    _landScape = status;
  }

  AppSettings() {
    _connected = null;
    if (!kIsWeb) {
      connectionListen(connectionChanged);
    }
  }
  set setAppLanguages(AppLanguages appLanguages) {
    _languages = appLanguages.languages;
    _language = appLanguages.initLanguge;
  }

  void listenState(State state) {
    void Function() setState = updateState(state);
    addListener(setState);
    Get.find<PageState>().setDispose = () {
      removeListener(setState);
    };
  }

  void changeLang(String lang) {
    _language = lang;
    update();
  }

  int getIndexOfLang() {
    return _languages.indexOf(_language);
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

  set changeLanguage(String language) {
    _language = language;
    update();
  }

  set onConnectionChange(Function(bool status) function) {
    _afterConnectionFunc = function;
  }

  void connectionChanged(bool status) {
    if (status) {
      _connected = true;
      if (_afterConnectionFunc != null) {
        _afterConnectionFunc!(_connected!);
      }
      update();
    } else {
      _connected = false;
      if (_afterConnectionFunc != null) {
        _afterConnectionFunc!(_connected!);
      }
      update();
    }
  }
}
