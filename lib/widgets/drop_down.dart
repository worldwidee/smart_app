import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_app/smart_app.dart';
import 'package:smart_app/widgets/onHover.dart';

class DropDown extends StatefulWidget {
  List<DropDownItem> itemsData;
  String title, hintText;
  double width;
  double? height;
  Color? dropdownColor, borderColor, color, hoverColor;
  TextStyle? titleStyle, textStyle, hintStyle;
  double? radius, borderWith;
  bool expands;
  Alignment align;
  EdgeInsetsGeometry padding;
  int flex;
  void Function(String value) onChange;
  DropDown(
      {Key? key,
      required this.itemsData,
      this.title = "",
      required this.width,
      this.height,
      this.hintText = "",
      this.titleStyle,
      this.hintStyle,
      this.textStyle,
      this.borderColor,
      this.color,
      this.align = Alignment.centerLeft,
      this.padding = EdgeInsets.zero,
      this.flex = 1,
      this.expands = false,
      this.borderWith,
      this.radius,
      this.hoverColor,
      this.dropdownColor,
      required this.onChange})
      : super(key: key) {
    titleStyle ??= Get.find<AppFonts>().S(isBold: true);
    textStyle ??= Get.find<AppFonts>().S();
    hintStyle ??=
        Get.find<AppFonts>().S(color: Get.find<AppColors>().btnTextColor);
    dropdownColor ??= Get.find<AppColors>().btnColor;
    height ??= textStyle!.fontSize! * 2;
  }
  @override
  _DropDownState createState() => _DropDownState(itemsData, onChange, hintText);
}

class _DropDownState extends State<DropDown> {
  List<DropDownItem> itemsData;
  void Function(String value) onChange;
  late String hintText;
  _DropDownState(this.itemsData, this.onChange, this.hintText);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.expands
        ? Expanded(
            flex: widget.flex,
            child: view(),
          )
        : SizedBox(
            width: widget.width,
            height: widget.height,
            child: view(),
          );
  }

  Widget view() {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != "")
            Padding(
              padding: EdgeInsets.only(left: widget.width * 1.5 / 10),
              child: Text(
                widget.title,
                style: widget.titleStyle,
              ),
            ),
          Expanded(
            child: OnHover(
                doTransform: false,
                builder: (isHovered) {
                  Color? color = isHovered && widget.hoverColor != null
                      ? widget.hoverColor
                      : widget.color;
                  return InfContainer(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: widget.borderWith != null
                            ? Border.all(
                                width: widget.borderWith!,
                                color: widget.borderColor ??
                                    const Color(0xFF000000))
                            : null,
                        color: color,
                        borderRadius: widget.radius != null
                            ? BorderRadius.circular(widget.radius!)
                            : null),
                    child: DropdownButtonHideUnderline(
                      child: InfContainer(
                        child: DropdownButton(
                            dropdownColor: widget.dropdownColor,
                            isExpanded: true,
                            elevation: 0,
                            items: widget.itemsData
                                .map((data) => DropdownMenuItem<String>(
                                      child: Row(
                                        children: [
                                          Container(
                                            width: widget.width * 7.5 / 10,
                                            child: Text(
                                              data.item,
                                              style: widget.textStyle,
                                            ),
                                          ),
                                        ],
                                      ),
                                      value: data.value,
                                    ))
                                .toList(),
                            onChanged: (String? value) {
                              setState(() {
                                onChange(value!);
                                hintText = value;
                              });
                            },
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Align(
                                  alignment: widget.align,
                                  child:
                                      Text(hintText, style: widget.hintStyle)),
                            )),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class DropDownItem {
  String item;
  String value;
  DropDownItem({required this.item, required this.value});
}
