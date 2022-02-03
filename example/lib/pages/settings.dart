import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    appSettings.addListener(setStateHere);
    appFonts.addListener(setStateHere);
    super.initState();
  }

  void setStateHere() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    appFonts.removeListener(setStateHere);
    appSettings.removeListener(setStateHere);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            appTexts.getText("hello"),
            style: appFonts.L(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                appTexts.getText("lang") + " : ",
                style: appFonts.M(),
              ),
              const SizedBox(
                width: 10,
              ),
              DropdownButton<String>(
                dropdownColor: appColors.secondColor,
                value: appSettings.language,
                items:
                    List<String>.from(appTexts.languages).map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: appFonts.M(),
                    ),
                  );
                }).toList(),
                onChanged: (language) {
                  appSettings.changeLanguage = language!;
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                appTexts.getText("darkMode"),
                style: appFonts.M(),
              ),
              CupertinoSwitch(
                  value: appSettings.darkMode,
                  onChanged: (mode) {
                    appSettings.changeDarkMode = mode;
                  })
            ],
          ),
          Text(
            appTexts.getText("btnText"),
            style: appFonts.M(),
          ),
        ],
      ),
    );
  }
}
