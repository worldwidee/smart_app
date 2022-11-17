import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_app/smart_app.dart';

import '../../main.dart';
import '../../texts/app_text.dart';

class MyAppbar extends StatelessWidget with PreferredSizeWidget {
  const MyAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettings>(builder: (context) {
      return AppBar(
        title: Row(
          children: [
            Icon(Icons.label_important,
                color: appColors.appBarIconColor, size: appFonts.iconSize),
            Text(AppTexts.appbar_title,
                style: appFonts.M(color: appColors.appBarTextColor))
          ],
        ),
        backgroundColor: appColors.appBarBackgroundColor,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Internet",
                style: appFonts.M(color: appColors.appBarTextColor),
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.wifi,
                color: appSettings.connected == null
                    ? Colors.grey
                    : appSettings.connected!
                        ? Colors.green
                        : Colors.red,
              ),
              SizedBox(
                width: appFonts.appWidth * 0.01,
              ),
            ],
          )
        ],
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
