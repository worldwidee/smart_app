import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:smart_app/smart_app.dart';

class LiquidLoadingBar extends StatelessWidget {
  double width, height;
  String? tag;
  Color? borderColor, textColor;
  Color color;
  LiquidLoadingBar(
      {Key? key,
      required this.width,
      required this.height,
      required this.color,
      this.tag,
      this.borderColor,
      this.textColor})
      : super(key: key) {
    textColor ??= Get.find<AppColors>().textColor;
    borderColor ??= Get.find<AppColors>().textColor;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: GetBuilder<LiquidBarController>(
        tag: tag,
        builder: (controller) => LiquidLinearProgressIndicator(
          value: controller.percent, // Defaults to 0.5.
          valueColor: AlwaysStoppedAnimation(
              color), // Defaults to the current Theme's accentColor.
          backgroundColor: Colors
              .transparent, // Defaults to the current Theme's backgroundColor.
          borderColor: textColor,
          borderWidth: 2.0,
          borderRadius: 12.0,
          direction: Axis
              .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
          center: Text(controller.percentText,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: borderColor)),
        ),
      ),
    );
  }
}

class LiquidBarController extends GetxController {
  String percentText = "Loading %0";
  double percent = 0.0;
  void incrasePercent(double percent) {
    this.percent = percent;
    String text = (percent * 100).toInt().toString();
    percentText = percent < 101 ? "Loading %" + text : "Loading %100";
    update();
  }
}
