import 'package:smart_app/smart_app.dart';

class AppTexts {
  static String get ok => SmartText(["ok", "tamam"]).text;
  static String get hello => SmartText(["Hello", "Merhaba"]).text;
  static String get lang => SmartText(["Language", "Dil"]).text;
  static String get page => SmartText(["Page", "Sayfa"]).text;
  static String get login => SmartText(["Login", "Giriş"]).text;
  static String get widgets => SmartText(["Widgets", "Widgetlar"]).text;
  static String get appbar_title =>
      SmartText(["Smart App Design", "Akıllı Uygulama Tasarımı"]).text;
  static String get settings => SmartText(["Settings", "Ayarlar"]).text;
  static String get signout => SmartText(["Signout", "Çıkış"]).text;
  static String get darkMode => SmartText(["Dark Mode", "Karanlık Mod"]).text;
  static String get btnText => SmartText([
        "You have pushed the button this many times",
        "Düğmeye bukadar çok bastın",
      ]).text;
  static List<String> get languages => SmartList([
        ["English", "Turkish"],
        ["İngilizce", "Türkçe"]
      ]).texts;
  static List<String> get menus => SmartList([
        ["Page 1", "Page 2", "Settings", "Signout"],
        ["Sayfa 1", "Sayfa 2", "Ayarlar", "Çıkış"]
      ]).texts;
}
