import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_app/smart_app.dart';

class SmartTextField extends StatelessWidget {
  String text;
  String hintText;
  String? labelText;
  int flex;
  TextEditingController controller;
  bool singleLine;
  TextStyle? textStyle, labelStyle;
  TextStyle? titleStyle, hintStyle;
  double radius, borderWidth;
  Color? color, borderColor;
  Color? enabledColor;
  Color? focusedColor, backgroundColor;
  dynamic onChanged;
  bool isUnderline, expands, noInputBorder;
  double? width, height;
  TextInputType textInputType;
  Widget? prefixIcon;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? innerPadding;
  SmartTextField(
      {Key? key,
      this.text = "",
      required this.hintText,
      required this.controller,
      this.singleLine = true,
      this.titleStyle,
      this.textStyle,
      this.hintStyle,
      this.color,
      this.borderColor,
      this.borderWidth = 1,
      this.radius = 10.0,
      this.onChanged,
      this.enabledColor,
      this.focusedColor,
      this.labelText,
      this.labelStyle,
      this.isUnderline = true,
      this.expands = false,
      this.width,
      this.height,
      this.textInputType = TextInputType.text,
      this.prefixIcon,
      this.backgroundColor,
      this.padding = EdgeInsets.zero,
      this.innerPadding,
      this.noInputBorder = false,
      this.flex = 1})
      : super(key: key) {
    innerPadding ??= EdgeInsets.symmetric(horizontal: 10);
    titleStyle ??= Get.find<AppSettings>().anyMobile
        ? Get.find<AppFonts>().S(fontWeight: FontWeight.w600)
        : Get.find<AppFonts>().M(fontWeight: FontWeight.w600);
    textStyle ??= Get.find<AppFonts>().M();
    labelStyle ??= Get.find<AppFonts>().M();
    hintStyle ??=
        Get.find<AppFonts>().M(color: Get.find<AppColors>().hintColor);
    enabledColor ??= Get.find<AppColors>().textColor;
    focusedColor ??= Colors.cyan;
    if (!noInputBorder) {
      if (isUnderline) {
        enabledBorder = UnderlineInputBorder(
          borderSide: BorderSide(color: enabledColor!),
        );
        focusedBorder = UnderlineInputBorder(
          borderSide: BorderSide(color: focusedColor!),
        );
      } else {
        enabledBorder = OutlineInputBorder(
            borderSide: BorderSide(color: enabledColor!),
            borderRadius: BorderRadius.circular(radius));
        focusedBorder = OutlineInputBorder(
            borderSide: BorderSide(color: focusedColor!),
            borderRadius: BorderRadius.circular(radius));
      }
    }
    border = borderColor != null
        ? Border.all(width: borderWidth, color: borderColor!)
        : null;
  }
  dynamic enabledBorder, focusedBorder;
  BoxBorder? border;
  @override
  Widget build(BuildContext context) {
    return expands
        ? Expanded(
            flex: flex,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: viewTextField(),
            ),
          )
        : Container(
            width: width,
            height: height,
            child: viewTextField(),
          );
  }

  Widget viewTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text != "")
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
              text,
              style: titleStyle,
            ),
          ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(radius),
                  border: border),
              padding: padding,
              child: TextField(
                controller: controller,
                maxLines: singleLine ? 1 : null,
                expands: singleLine ? false : true,
                style: textStyle,
                scrollPadding: EdgeInsets.zero,
                textAlignVertical: TextAlignVertical.top,
                keyboardType: singleLine == false
                    ? TextInputType.multiline
                    : textInputType,
                inputFormatters: <TextInputFormatter>[
                  if (textInputType == TextInputType.number)
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(
                    hintText: hintText,
                    contentPadding: innerPadding,
                    hintStyle: hintStyle,
                    enabledBorder: enabledBorder,
                    focusedBorder: focusedBorder,
                    border: noInputBorder ? InputBorder.none : null,
                    prefixIcon: prefixIcon,
                    labelText: labelText,
                    labelStyle: labelStyle),
                onChanged: (text) {
                  if (onChanged != null) onChanged(text);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}

class SmartTextFieldFull extends StatelessWidget {
  String text;
  String hintText;
  String? labelText;
  int flex;
  TextEditingController controller;
  bool singleLine;
  TextStyle? textStyle, labelStyle;
  TextStyle? titleStyle, hintStyle, errorStyle;
  double? width, height;
  double radius, borderWidth;
  Color? color, borderColor;
  Color? enabledColor;
  Color? focusedColor, backgroundColor;
  dynamic onChanged;
  bool isUnderline, noInputBorder, expands;
  TextInputType textInputType;
  Widget? prefixIcon;
  EdgeInsetsGeometry? padding, innerPadding;
  String? errorText;
  double paddingLeft;
  bool error;
  SmartTextFieldFull({
    required this.text,
    required this.controller,
    this.hintText = "",
    this.labelText,
    this.flex = 1,
    this.singleLine = true,
    this.textStyle,
    this.labelStyle,
    this.expands = false,
    this.titleStyle,
    this.hintStyle,
    this.radius = 10,
    this.borderWidth = 1,
    this.color,
    this.innerPadding,
    this.borderColor,
    this.width,
    this.height,
    this.enabledColor,
    this.focusedColor,
    this.errorStyle,
    this.backgroundColor,
    this.error = false,
    this.onChanged,
    this.isUnderline = true,
    this.noInputBorder = false,
    this.textInputType = TextInputType.text,
    this.prefixIcon,
    this.padding,
    this.errorText,
    this.paddingLeft = 0,
  }) {
    errorStyle ??= Get.find<AppFonts>().S(color: Colors.red);
  }
  @override
  Widget build(BuildContext context) {
    return expands
        ? Expanded(
            flex: flex,
            child: view(),
          )
        : view();
  }

  Widget view() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartTextField(
          text: text,
          hintText: hintText,
          labelText: labelText,
          flex: flex,
          controller: controller,
          singleLine: singleLine,
          textStyle: textStyle,
          labelStyle: labelStyle,
          titleStyle: titleStyle,
          hintStyle: hintStyle,
          radius: radius,
          borderWidth: borderWidth,
          color: color,
          borderColor: borderColor,
          enabledColor: enabledColor,
          innerPadding: innerPadding,
          focusedColor: focusedColor,
          backgroundColor: backgroundColor,
          onChanged: onChanged,
          isUnderline: isUnderline,
          noInputBorder: noInputBorder,
          textInputType: textInputType,
          prefixIcon: prefixIcon,
          width: width,
          height: height,
          padding: padding,
          expands: expands,
        ),
        if (errorText != null && error) Text(errorText!, style: errorStyle)
      ],
    );
  }
}
