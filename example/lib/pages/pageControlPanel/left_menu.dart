import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_app/smart_app.dart';
import 'package:smartapp/main.dart';

class LeftMenu extends StatelessWidget {
  LeftMenu({Key? key}) : super(key: key);
  List<String> pageNames = ["page", "page", "settings", "signout"];
  List<String> pageRoutes = ["page1", "page2", "settings", "login"];
  List<Widget> pageIcons = [
    Icon(Icons.last_page,
        size: appFonts.iconSize, color: appColors.secondTextColor),
    Icon(Icons.last_page,
        size: appFonts.iconSize, color: appColors.secondTextColor),
    Icon(Icons.settings,
        size: appFonts.iconSize, color: appColors.secondTextColor),
    Icon(Icons.logout_outlined,
        size: appFonts.iconSize, color: appColors.secondTextColor)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appColors.secondColor,
      child: GetBuilder<PageState>(builder: (controller) {
        return GetBuilder<AppSettings>(builder: (settingsController) {
          return Column(
            children: [
              for (int i = 0; i < pageNames.length; i++)
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      String route = pageRoutes[i];
                      if (route == "login") {
                        appSettings.signOut();
                      }
                      pageState.changePage(page: route);
                    },
                    child: ListTile(
                      leading: pageIcons[i],
                      title: Text(
                        appTexts.getText(pageNames[i])+" ${i<2?(i+1):""}",
                        style: appFonts.M(color: appColors.secondTextColor),
                      ),
                    ),
                  ),
                ),
              const Spacer(
                flex: 5,
              )
            ],
          );
        });
      }),
    );
  }
}
