import 'package:flutter/material.dart';

class InfiniteText extends StatelessWidget {
  double width;
  String text;
  TextStyle style;
  Alignment align;
  EdgeInsetsGeometry? padding;
  InfiniteText(
      {Key? key, required this.width,
      required this.text,
      required this.style,
      this.align = Alignment.center,
      this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: style.fontSize! * 2,
      alignment: align,
      padding: padding,
      child: ListView(
          controller: ScrollController(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            Align(
              alignment: align,
              child: Text(
                text,
                style: style,
              ),
            )
          ]),
    );
  }
}
