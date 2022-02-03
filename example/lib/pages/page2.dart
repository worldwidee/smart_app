import 'package:flutter/material.dart';

import '../main.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
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
      child: Text(
        "${appTexts.getText("page")} 2",
        style: appFonts.mega(),
      ),
    );
  }
}
