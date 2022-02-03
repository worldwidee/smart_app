import 'package:flutter/material.dart';
import 'package:smartapp/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double iconW = appFonts.appWidth * 0.1;
    double iconH = appFonts.appHeight * 0.07;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${appTexts.getText("login")} ${appTexts.getText("page")}",
            style: appFonts.mega(),
          ),
          SizedBox(
            height: appFonts.appHeight * 0.01,
          ),
          TextButton(
              onPressed: () {
                appSettings.signIn();
                pageState.changePage(page: "page1");
              },
              child: Container(
                width: iconW,
                height: iconH,
                decoration: BoxDecoration(
                    color: appColors.secondColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      appTexts.getText("login"),
                      style: appFonts.M(color: appColors.secondTextColor),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.login,
                      size: appFonts.iconSize,
                      color: appColors.secondTextColor,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
