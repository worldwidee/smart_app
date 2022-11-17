import 'package:get/get.dart';
import 'package:smart_app/smart_app.dart';
import 'package:flutter/material.dart';

class IconOfFile extends StatelessWidget {
  dynamic icon;

  IconOfFile(String type, {double? size, dynamic color}) {
    IconData? iconData;
    size ??= Get.find<AppFonts>().iconSize;
    color ??= Get.find<AppColors>().textColor;
    if (type == "image") {
      iconData = Icons.image_outlined;
    } else if (type == "video") {
      iconData = Icons.movie_outlined;
    } else if (type == "file") {
      iconData = Icons.file_present_outlined;
    }
    if (type != "dicom") {
      icon = Icon(
        iconData!,
        size: size,
        color: color,
      );
    } else {
      icon = Image(
        image: AssetImage("assets/images/dicom.png"),
        width: size,
        height: size,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return icon;
  }
}
