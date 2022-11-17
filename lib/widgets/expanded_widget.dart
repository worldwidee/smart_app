import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  double width;
  Widget child;
  TextStyle style;
  Alignment align;
  ExpandedWidget(
      {required this.width,
      required this.child,
      required this.style,
      this.align = Alignment.center});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: style.fontSize! * 2,
      alignment: align,
      child: ListView(
          controller: ScrollController(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            Align(
              alignment: align,
              child: child,
            )
          ]),
    );
  }
}
