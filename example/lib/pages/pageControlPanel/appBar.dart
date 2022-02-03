import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_app/smart_app.dart';

import '../../main.dart';

class MyAppbar extends StatelessWidget with PreferredSizeWidget {
  const MyAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettings>(builder: (context) {
      return AppBar(
        title: Row(
          children: [
            Icon(Icons.label_important,
                color: appColors.secondTextColor, size: appFonts.iconSize),
            Text(appTexts.getText("appbar_title"),
                style: appFonts.L(color: appColors.secondTextColor))
          ],
        ),
        backgroundColor: appColors.secondColor,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Internet",
                style: appFonts.L(color: appColors.secondTextColor),
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
  Size get preferredSize => Size.fromHeight(appFonts.appHeight * 0.07);
}
