import 'package:flutter/material.dart';
import 'package:smart_app/smart_app.dart';
import 'pages/widgets.dart';
import '/pages/login_page.dart';
import '/pages/page1.dart';
import '/pages/page2.dart';
import '/pages/settings.dart';

import 'pages/app_design/page_control_panel.dart';
import 'texts/app_text.dart';

late AppColors appColors;
late AppFonts appFonts;
late AppSettings appSettings;
late PageState pageState;
late SmartApp panel;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppPages appPages = AppPages(pages: {
    "page1": const Page1(),
    "page2": const Page2(),
    "settings": const Settings(),
    "login": const LoginPage(),
    "widgets": const Widgets(),
  }, initPage: "widgets");
  AppLanguages languages =
      AppLanguages(languages: ["English","Turkish"], initLanguge: "English");
  AppAppearances appearances = AppAppearances(appearances: [
    Appearance.dark(),
    Appearance.light(),
  ], initAppearance: Appearance.dark());
  SmartApp.setup(
      pages: appPages, languages: languages, appearances: appearances);
  appFonts = SmartApp.appFonts;
  appColors = SmartApp.appColors;
  appSettings = SmartApp.appSettings;
  pageState = SmartApp.pageState;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageControlPanel(),
    );
  }
}
