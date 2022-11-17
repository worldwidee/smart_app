import 'package:flutter/material.dart';

class InfContainer extends StatelessWidget {
  Widget? child;
  Alignment alignment;
  Decoration? decoration;
  EdgeInsetsGeometry? padding;
  Color? color;
  Decoration? foregroundDecoration;
  BoxConstraints? constraints;
  EdgeInsetsGeometry? margin;
  Matrix4? transform;
  AlignmentGeometry? transformAlignment;
  InfContainer(
      {required this.child,
      this.alignment = Alignment.center,
      this.decoration,
      this.padding,
      this.color,
      this.foregroundDecoration,
      this.constraints,
      this.margin,
      this.transform,
      this.transformAlignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      decoration: decoration,
      width: double.infinity,
      height: double.infinity,
      padding: padding,
      child: child,
      color: color,
      foregroundDecoration: foregroundDecoration,
      constraints: constraints,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
    );
  }
}
