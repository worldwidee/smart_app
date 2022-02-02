import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_app/controller/appColors.dart';
import 'package:smart_app/controller/appFonts.dart';
import 'package:smart_app/controller/appSettings.dart';
import 'package:smart_app/controller/appTexts.dart';
import 'package:smart_app/smart_app.dart';

late AppColors appColors;
late AppFonts appFonts;
late AppSettings appSettings;
late AppTexts appTexts;
late SmartAppPanel panel;
void main() {
  panel = SmartAppPanel();
  panel.start(darkMode: true, textPath: "assets/texts.txt");
  appFonts = panel.appFonts;
  appColors = panel.appColors;
  appSettings = panel.appSettings;
  appTexts = panel.appTexts;
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isStaticWindow = false;
  @override
  void initState() {
    appSettings.afterConnectionFunc = (connection) {
      // ignore: avoid_print
      print("Current Conneciton:$connection");
    };
    appSettings.addListener(setStateHere);
    super.initState();
  }

  void setStateHere() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    appSettings.removeListener(setStateHere);
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  bool started = false;
  @override
  Widget build(BuildContext context) {
    if (!isStaticWindow) {
      appFonts.changeSizes(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          isResposible: true);
    } else if (isStaticWindow && !started) {
      appFonts.changeSizes(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          isResposible: false);
      started = true;
    }
    return Scaffold(
      backgroundColor: appColors.backGroundColor,
      appBar: AppBar(
        title: Text(appTexts.getText("appbar_title"),
            style: appFonts.L(isBold: true, color: appColors.secondTextColor)),
        backgroundColor: appColors.secondColor,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Internet",
                style:
                    appFonts.L(isBold: true, color: appColors.secondTextColor),
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.wifi,
                color: appSettings.connected == null
                    ? Colors.grey
                    : appSettings.connected!
                        ? Colors.green
                        : Colors.red,
              ),
              SizedBox(
                width: appFonts.appWidth * 0.01,
              ),
            ],
          )
        ],
      ),
      body: Center(
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
            Text(
              '$_counter',
              style: appFonts.L(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: appColors.secondColor,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
