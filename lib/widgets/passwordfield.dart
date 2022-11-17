import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_app/smart_app.dart';

class PasswordField extends StatefulWidget {
  String text;
  String hintText;
  String? labelText;
  int flex;
  TextEditingController controller;
  bool singleLine;
  TextStyle? textStyle, labelStyle, errorStyle;
  TextStyle? titleStyle, hintStyle;
  double radius, borderWidth;
  Color? color, borderColor, iconColor;
  Color? enabledColor;
  Color? focusedColor, bacgroundColor;
  dynamic onChanged;
  bool isUnderline, expands, noInputBorder;
  double? width, height;
  TextInputType textInputType;
  bool error;
  String? errorText;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? innerPadding;
  PasswordField(
      {Key? key,
      this.text = "",
      required this.controller,
      this.hintText = "",
      this.singleLine = true,
      this.titleStyle,
      this.textStyle,
      this.hintStyle,
      this.color,
      this.borderColor,
      this.borderWidth = 1,
      this.radius = 10.0,
      this.errorStyle,
      this.iconColor,
      this.error = false,
      this.errorText,
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
      this.bacgroundColor,
      this.padding = EdgeInsets.zero,
      this.innerPadding,
      this.noInputBorder = false,
      this.flex = 1})
      : super(key: key) {
    innerPadding ??= const EdgeInsets.symmetric(horizontal: 10);
    titleStyle ??= Get.find<AppSettings>().anyMobile
        ? Get.find<AppFonts>().S(fontWeight: FontWeight.w600)
        : Get.find<AppFonts>().M(fontWeight: FontWeight.w600);
    iconColor ??= Get.find<AppColors>().iconColor;
    textStyle ??= Get.find<AppFonts>().M();
    labelStyle ??= Get.find<AppFonts>().M();
    errorStyle ??= Get.find<AppFonts>().S(color: Colors.red);
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
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool showPw = false;

  @override
  Widget build(BuildContext context) {
    return widget.expands
        ? Expanded(
            flex: widget.flex,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: viewTextField(),
            ),
          )
        : Container(
            width: widget.width,
            height: widget.height,
            child: viewTextField(),
          );
  }

  Widget viewTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.text != "")
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
              widget.text,
              style: widget.titleStyle,
            ),
          ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: widget.padding ?? EdgeInsets.zero,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: widget.bacgroundColor,
                        borderRadius: BorderRadius.circular(widget.radius),
                        border: widget.border),
                    child: TextField(
                      controller: widget.controller,
                      maxLines: widget.singleLine ? 1 : null,
                      expands: widget.singleLine ? false : true,
                      style: widget.textStyle,
                      scrollPadding: EdgeInsets.zero,
                      obscureText: showPw ? false : true,
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: widget.singleLine == false
                          ? TextInputType.multiline
                          : widget.textInputType,
                      inputFormatters: <TextInputFormatter>[
                        if (widget.textInputType == TextInputType.number)
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                          hintText: widget.hintText,
                          contentPadding: widget.innerPadding,
                          hintStyle: widget.hintStyle,
                          enabledBorder: widget.enabledBorder,
                          focusedBorder: widget.focusedBorder,
                          border:
                              widget.noInputBorder ? InputBorder.none : null,
                          labelText: widget.labelText,
                          labelStyle: widget.labelStyle),
                      onChanged: (text) {
                        if (widget.onChanged != null) widget.onChanged(text);
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            showPw = !showPw;
                          });
                        },
                        icon: Icon(
                          showPw ? Icons.visibility_off : Icons.visibility,
                          color: widget.iconColor,
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
        if (widget.errorText != null && widget.error)
          Text(widget.errorText!, style: widget.errorStyle)
      ],
    );
  }
}
