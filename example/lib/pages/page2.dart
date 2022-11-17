import 'package:flutter/material.dart';

import '../main.dart';
import '../texts/app_text.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  void initState() {
    appSettings.listenState(this);
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
        "${AppTexts.page} 2",
        style: appFonts.mega(),
      ),
    );
  }
}
