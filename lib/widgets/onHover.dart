import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class OnHover extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  bool doTransform;
  OnHover({required this.builder, this.doTransform = true});
  @override
  _OnHoverState createState() => _OnHoverState(doTransform);
}

class _OnHoverState extends State<OnHover> {
  bool isHovered = false;
  bool isFinished = false;
  bool doTransform=false;
  _OnHoverState(this.doTransform);
  @override
  Widget build(BuildContext context) {
    final hovered = Matrix4Transform().translate(x: 5).matrix4;
    var transform;
    if (doTransform) {
      if (isHovered) transform = hovered;
      if (!isHovered || isFinished) transform = Matrix4.identity();
    }
    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: doTransform?transform:Matrix4.identity(),
        onEnd: () {
          setState(() {
            this.isFinished = true;
          });
        },
        child:
            widget.builder(isHovered), // build the widget passed from main.dart
      ),
    );
  }
  void dispose(){
    super.dispose();
  }
  //used to set bool isHovered to true/false
  void onEntered(bool isHovered) {
    setState(() {
      if (isHovered == true) isFinished = false;
      this.isHovered = isHovered;
    });
  }
}
