import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_app/smart_app.dart';

class RegionBar extends StatelessWidget {
  void Function(int index) onChanged;
  List<String> menuTexts;
  Color? bgColor, selectedColor, labelColor, unselectedLabelColor;
  TabController? controller;
  TextStyle? labelStyle;
  RegionBar(
      {required this.onChanged,
      required this.menuTexts,
      this.bgColor,
      this.controller,
      this.labelColor,
      this.labelStyle,
      this.unselectedLabelColor,
      this.selectedColor}) {
    bgColor ??= Get.find<AppColors>().btnColor;
    selectedColor ??= Get.find<AppColors>().backgroundColor;
    labelColor ??= Get.find<AppColors>().textColor;
    unselectedLabelColor ??= Get.find<AppColors>().hintColor;
    labelStyle ??= Get.find<AppFonts>().S(isBold: true);
  }
  @override
  Widget build(BuildContext context) {
    double height = labelStyle!.fontSize! * 3;
    return Center(
      child: DefaultTabController(
        length: menuTexts.length,
        child: Container(
          height: height + 5,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TabBar(
            controller: controller,
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: height,
              indicatorColor: selectedColor!,
            ),
            labelStyle: labelStyle,
            labelColor: labelColor,
            unselectedLabelColor: unselectedLabelColor,
            tabs: <Widget>[
              for (int i = 0; i < menuTexts.length; i++) Text(menuTexts[i]),
            ],
            onTap: (index) {
              onChanged(index);
            },
          ),
        ),
      ),
    );
  }
}
