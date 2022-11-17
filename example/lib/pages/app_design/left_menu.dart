import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_app/smart_app.dart';
import '../../texts/app_text.dart';
import '/main.dart';

class LeftMenu extends StatelessWidget {
  LeftMenu({Key? key}) : super(key: key);
  late List<String> pageNames;
  List<String> pageRoutes = ["page1", "page2", "settings", "widgets", "login"];
  List<Widget> pageIcons = [
    Icon(Icons.last_page,
        size: appFonts.iconSize, color: appColors.secondaryIconColor),
    Icon(Icons.last_page,
        size: appFonts.iconSize, color: appColors.secondaryIconColor),
    Icon(Icons.settings,
        size: appFonts.iconSize, color: appColors.secondaryIconColor),
    Icon(Icons.widgets,
        size: appFonts.iconSize, color: appColors.secondaryIconColor),
    Icon(Icons.logout_outlined,
        size: appFonts.iconSize, color: appColors.secondaryIconColor)
  ];
  @override
  Widget build(BuildContext context) {
    pageNames = [
      AppTexts.page,
      AppTexts.page,
      AppTexts.settings,
      AppTexts.widgets,
      AppTexts.signout
    ];
    return Container(
      color: appColors.secondaryBackgroundColor,
      child: GetBuilder<PageState>(builder: (controller) {
        return GetBuilder<AppSettings>(builder: (settingsController) {
          return ListView(
            children: [
              for (int i = 0; i < pageNames.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextButton(
                    onPressed: () {
                      String route = pageRoutes[i];
                      SmartApp.pageState.go(name: route);
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
                          style:
                              appFonts.S(color: appColors.secondaryTextColor),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          );
        });
      }),
    );
  }
}
