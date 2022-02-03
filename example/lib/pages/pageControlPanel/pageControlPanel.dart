import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_app/smart_app.dart';
import 'package:smartapp/pages/login_page.dart';
import 'package:smartapp/pages/pageControlPanel/left_menu.dart';

import '../../main.dart';
import 'appBar.dart';

class PageControlPanel extends StatefulWidget {
  const PageControlPanel({Key? key}) : super(key: key);

  @override
  State<PageControlPanel> createState() => _PageControlPanelState();
}

class _PageControlPanelState extends State<PageControlPanel> {
  bool isStaticWindow = false;
  late bool signIn;
  late bool darkMode;
  @override
  void initState() {
    signIn = appSettings.isAuthenticationVerified;
    darkMode = appSettings.darkMode;
    appSettings.addListener(checkSign);
    appSettings.afterConnectionFunc = (connection) {
      print("Current Conneciton:$connection");
    };
    super.initState();
  }

  void checkSign() {
    if (appSettings.isAuthenticationVerified != signIn) {
      signIn = appSettings.isAuthenticationVerified;
      setState(() {});
    } else if (darkMode != appSettings.darkMode) {
      darkMode = appSettings.darkMode;
      setState(() {});
    }
  }

  @override
  void dispose() {
    appSettings.removeListener(checkSign);
    super.dispose();
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
      appBar: signIn ? MyAppbar() : null,
      body: signIn
          ? Row(
              children: [
                Expanded(
                  child: LeftMenu(),
                ),
                Expanded(
                  flex: 5,
                  child: GetBuilder<PageState>(
                    builder: (controller) {
                      return controller.page;
                    },
                  ),
                )
              ],
            )
          : GetBuilder<PageState>(
              builder: (controller) {
                return controller.page;
              },
            ),
    );
  }
}
