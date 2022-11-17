import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_app/smart_app.dart';
import '/pages/login_page.dart';
import '/pages/pageControlPanel/left_menu.dart';

import '../../main.dart';
import 'appBar.dart';
import 'drawer.dart';

class PageControlPanel extends StatefulWidget {
  const PageControlPanel({Key? key}) : super(key: key);

  @override
  State<PageControlPanel> createState() => _PageControlPanelState();
}

class _PageControlPanelState extends State<PageControlPanel> {
  @override
  void initState() {
    appSettings.addListener(setStateHere);
    appSettings.onConnectionChange = (connection) {
      print("Current Conneciton:$connection");
    };
    super.initState();
  }

  void setStateHere() {
    setState(() {});
  }

  @override
  void dispose() {
    appSettings.removeListener(setStateHere);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appFonts.init(context);
    return WillPopScope(
      child: Scaffold(
        backgroundColor: appColors.backgroundColor,
        appBar: MyAppbar(),
        drawer: appSettings.anyMobile ? MyDrawer() : null,
        body: Row(
          children: [
            if (!appSettings.anyMobile)
              SizedBox(
                height: double.infinity,
                width: appSettings.anyMobile ? appFonts.appWidth * 0.35 : 200,
                child: LeftMenu(),
              ),
            Expanded(
              child: SmartPage(),
            ),
          ],
        ),
      ),
      onWillPop: () async {
        return await pageState.back();
      },
    );
  }
}
