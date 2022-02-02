import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppSettings extends GetxController {
  late bool _darkMode;
  late bool? _connected;
  late String _language;
  String get language => _language;
  bool? get connected => _connected;
  bool get darkMode => _darkMode;
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
    update();
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
