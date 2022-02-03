import 'package:flutter/material.dart';
import 'package:smart_app/smart_app.dart';
import 'package:smartapp/pages/login_page.dart';
import 'package:smartapp/pages/page1.dart';
import 'package:smartapp/pages/page2.dart';
import 'package:smartapp/pages/settings.dart';

import 'pages/pageControlPanel/pageControlPanel.dart';

late AppColors appColors;
late AppFonts appFonts;
late AppSettings appSettings;
late AppTexts appTexts;
late PageState pageState;
late SmartAppPanel panel;
void main() {
  panel = SmartAppPanel();
  Map<String, Widget> pages = {
    "page1": const Page1(),
    "page2": const Page2(),
    "settings": const Settings(),
    "login": const LoginPage(),
  };
  InitPages initPages = InitPages();
  initPages.pages = pages;
  initPages.initPage = "page1";
  panel.start(
      darkMode: true, textPath: "assets/texts.txt", initPages: initPages);
  appFonts = panel.appFonts;
  appColors = panel.appColors;
  appSettings = panel.appSettings;
  appTexts = panel.appTexts;
  pageState = panel.pageState;
  appSettings.signIn();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const PageControlPanel(),
    );
  }
}

