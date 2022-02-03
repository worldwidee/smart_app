import 'package:flutter/material.dart';
import 'package:smartapp/main.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
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
        "${appTexts.getText("page")} 1",
        style: appFonts.mega(),
      ),
    );
  }
}
