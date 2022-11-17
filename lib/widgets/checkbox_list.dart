import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_app/smart_app.dart';

import '../states/app_colors.dart';

class CheckBoxList extends StatefulWidget {
  List<CheckBoxItem> items = [];
  Color? unselectedColor, selectedColor;
  int columnCount;
  String title;
  TextStyle? titleStyle;

  void Function(List<CheckBoxItem> items) onChange;
  CheckBoxList(
      {Key? key,
      required this.items,
      required this.onChange,
      this.title = "Select All",
      this.unselectedColor,
      this.selectedColor,
      this.titleStyle,
      this.columnCount = 1})
      : super(key: key) {
    titleStyle ??= Get.find<AppFonts>().M();
    unselectedColor ??= Get.find<AppColors>().textColor;
    selectedColor ??= const Color(0xFF6200EE);
  }
  @override
  _CheckBoxListState createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {
  bool selectAll = false;

  @override
  void initState() {
    if (widget.items.any((element) => !element.isSelected)) {
      selectAll = false;
    } else {
      selectAll = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Theme(
              data: ThemeData(unselectedWidgetColor: widget.unselectedColor),
              child: Checkbox(
                onChanged: (bool? value) {
                  selectAllItems();
                },
                value: selectAll,
                activeColor: widget.selectedColor,
              ),
            ),
            TextButton(
                onPressed: () {
                  selectAllItems();
                },
                child: Text(
                  widget.title,
                  style: widget.titleStyle,
                ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        for (int i = 0; i < widget.items.length; i += widget.columnCount)
          Row(
            children: [
              for (int j = i; j < i + widget.columnCount; j++)
                if (j < widget.items.length)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        widget.items[j].isSelected =
                            !widget.items[j].isSelected;
                      });
                      widget.onChange(widget.items);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Theme(
                          data: ThemeData(
                              unselectedWidgetColor: widget.unselectedColor),
                          child: Checkbox(
                            onChanged: (bool? value) {
                              setState(() {
                                widget.items[j].isSelected = value!;
                              });
                              widget.onChange(widget.items);
                            },
                            value: widget.items[j].isSelected,
                            activeColor: widget.selectedColor,
                          ),
                        ),
                        widget.items[i].child
                      ],
                    ),
                  )
            ],
          )
      ],
    );
  }

  void selectAllItems() {
    selectAll = !selectAll;
    for (int i = 0; i < widget.items.length; i++) {
      if (widget.items[i].isSelected != selectAll) {
        widget.items[i].isSelected = selectAll;
      }
    }
    setState(() {});
    widget.onChange(widget.items);
  }
}

class CheckBoxItem {
  bool isSelected;
  Widget child;
  dynamic item;
  CheckBoxItem({required this.child, this.isSelected = false, this.item});
}
