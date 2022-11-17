import 'package:get/get.dart';
import '../states/app_colors.dart';
import 'package:flutter/material.dart';

import 'checkbox_list.dart';

class CheckBoxSingle extends StatefulWidget {
  CheckBoxItem item;
  void Function(bool value) onChanged;
  dynamic unselectedColor, selectedColor;
  CheckBoxSingle({
    Key? key,
    required this.item,
    required this.onChanged,
    this.unselectedColor,
    this.selectedColor,
  }) : super(key: key) {
    unselectedColor ??= Get.find<AppColors>().textColor;
    selectedColor ??= Color(0xFF6200EE);
  }

  @override
  _CheckBoxSingleState createState() => _CheckBoxSingleState();
}

class _CheckBoxSingleState extends State<CheckBoxSingle> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        widget.onChanged(widget.item.isSelected);
        setState(() {
          widget.item.isSelected = !widget.item.isSelected;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: widget.unselectedColor),
            child: Checkbox(
              onChanged: (bool? value) {
                widget.onChanged(widget.item.isSelected);
                setState(() {
                  widget.item.isSelected = value!;
                });
              },
              value: widget.item.isSelected,
              activeColor: widget.selectedColor,
            ),
          ),
          widget.item.child
        ],
      ),
    );
  }
}
