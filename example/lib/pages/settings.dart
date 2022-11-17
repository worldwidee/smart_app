import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_app/smart_app.dart';

import '../main.dart';
import '../texts/app_text.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late bool darkMode;
  @override
  void initState() {
    darkMode = appColors.name == "dark";
    appSettings.listenState(this);
    super.initState();
  }

  List<String> languages = ["English", "Turkish"];
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    darkMode = appColors.name == "dark";
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            AppTexts.hello,
            style: appFonts.L(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppTexts.lang + " : ",
                style: appFonts.M(),
              ),
              const SizedBox(
                width: 10,
              ),
              DropDown(
                itemsData: AppTexts.languages
                    .map((e) => DropDownItem(item: e, value: e))
                    .toList(),
                width: 100,
                onChange: (value) {
                  appSettings.changeLanguage =
                      languages[AppTexts.languages.indexOf(value)];
                },
                radius: 30,
                hoverColor: Colors.green,
                color: appColors.btnColor,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppTexts.darkMode,
                style: appFonts.M(),
              ),
              CupertinoSwitch(
                  value: darkMode,
                  onChanged: (mode) {
                    appColors.changeAppearance(darkMode ? "light" : "dark");
                  })
            ],
          ),
          Text(
            AppTexts.btnText,
            style: appFonts.M(),
          ),
        ],
      ),
    );
  }
}
