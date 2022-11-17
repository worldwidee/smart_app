import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../states/app_fonts.dart';
import 'expandedButton.dart';

class ExpandedTextButton extends StatelessWidget {
  String text;
  TextStyle? style;
  Alignment alignment;
  dynamic onPressed;
  int flex;
  ExpandedTextButton(this.text,
      {this.style,
      this.alignment = Alignment.centerLeft,
      this.flex = 1,
      this.onPressed}) {
    style ??= Get.find<AppFonts>().M();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandedButton(
        onPressed: onPressed,
        flex: flex,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: alignment,
          child: Text(
            text,
            style: style,
          ),
        ));
  }
}
