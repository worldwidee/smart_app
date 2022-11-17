import 'package:flutter/material.dart';
import '../texts/app_text.dart';
import 'package:smart_app/smart_app.dart';
import '/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    double iconW = appFonts.appWidth * 0.3;
    double iconH = appFonts.appHeight * 0.07;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${AppTexts.login} ${AppTexts.page}",
            style: appFonts.mega(),
          ),
          SizedBox(
            height: appFonts.appHeight * 0.01,
          ),
          TextButton(
              onPressed: () {
                context.go(name: "page1");
              },
              child: Container(
                width: iconW,
                height: iconH,
                decoration: BoxDecoration(
                    color: appColors.btnColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.login,
                      size: appFonts.icon_L,
                      color: appColors.btnTextColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      AppTexts.login,
                      style: appFonts.M(color: appColors.btnTextColor),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
