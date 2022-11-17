import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_app/smart_app.dart';
import '../texts/app_text.dart';
import '/main.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    SmartApp.appSettings.listenState(this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "${AppTexts.page} 1",
        style: appFonts.mega(),
      ),
    );
  }
}
