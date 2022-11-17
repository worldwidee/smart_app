import 'package:flutter/material.dart';
import 'package:smart_app/smart_app.dart';

import '../../main.dart';
import '../../texts/app_text.dart';

class MyDrawer extends StatelessWidget {
  List<Widget> pageIcons = [
    Icon(Icons.last_page,
        size: appFonts.iconSize, color: appColors.secondaryTextColor),
    Icon(Icons.last_page,
        size: appFonts.iconSize, color: appColors.secondaryTextColor),
    Icon(Icons.settings,
        size: appFonts.iconSize, color: appColors.secondaryTextColor),
    Icon(Icons.widgets,
        size: appFonts.iconSize, color: appColors.secondaryTextColor),
  ];
  MyDrawer({Key? key}) : super(key: key);
  List<String> routes = [
    "page1",
    "page2",
    "settings",
    "widgets",
  ];
  late List<String> pageNames;
  @override
  Widget build(BuildContext context) {
    pageNames = [AppTexts.page, AppTexts.page, AppTexts.settings,AppTexts.widgets];
    return Drawer(
      backgroundColor: appColors.drawerBackgroundColor,
      child: Container(
        width: double.infinity,
        height: appFonts.appHeight,
        child: Column(
          children: [
            SizedBox(
              height: appFonts.appHeight * 0.03,
            ),
            SizedButton(
              width: double.infinity,
              height: appFonts.appHeight * 0.06,
              onPressed: () {
                context.go(name: "page1");
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.label_important,
                      color: appColors.appBarTextColor,
                      size: appFonts.iconSize),
                  Text(AppTexts.appbar_title,
                      style: appFonts.M(color: appColors.appBarTextColor))
                ],
              ),
            ),
            for (int i = 0; i < pageNames.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextButton(
                  onPressed: () {
                    context.go(name: routes[i]);
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      pageIcons[i],
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        pageNames[i] + " ${i < 2 ? (i + 1) : ""}",
                        style: appFonts.S(color: appColors.secondaryTextColor),
                      )
                    ],
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: SizedButton(
                width: double.infinity,
                height: appFonts.appHeight * 0.06,
                color: appColors.drawerBtnColor,
                innerPadding: const EdgeInsets.symmetric(horizontal: 10),
                onPressed: () {
                  context.go(name: "login");
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.logout,
                        color: appColors.appBarBtnTextColor,
                        size: appFonts.iconSize),
                    Text(AppTexts.signout,
                        style: appFonts.M(color: appColors.appBarBtnTextColor))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
