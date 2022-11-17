import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../states/app_colors.dart';
import '../states/app_fonts.dart';

Future<dynamic> smartDialog(
    {required Widget child,
    String title = "",
    String hideText = "Hide",
    bool noAction = false,
    bool zeroPadding = false,
    bool barrierDismissible = true,
    TextStyle? titleStyle,
    TextStyle? hideTextStyle,
    Color? bgColor,
    required BuildContext context}) {
  return showDialog(
      context: context,
      barrierDismissible: barrierDismissible, // user must tap button!
      builder: (BuildContext context) {
        Widget? titleWidget = title != ""
            ? Text(
                title,
                style: titleStyle ??
                    Get.find<AppFonts>().L(
                        isBold: true,
                        color: Get.find<AppColors>().dialogTextColor),
              )
            : null;
        List<Widget>? actions;
        if (noAction == false) {
          actions = [
            TextButton(
              child: Text(hideText,
                  style: hideTextStyle ??
                      Get.find<AppFonts>()
                          .M(color: Get.find<AppColors>().dialogHintColor)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ];
        }
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return AlertDialog(
            contentPadding: zeroPadding
                ? EdgeInsets.zero
                : const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
            title: titleWidget,
            backgroundColor:
                bgColor ?? Get.find<AppColors>().dialogBackgroundColor,
            content: SingleChildScrollView(
              child: ListBody(children: <Widget>[child]),
            ),
            actions: actions,
          );
        });
      });
}
