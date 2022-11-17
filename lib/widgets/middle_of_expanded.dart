import 'package:flutter/material.dart';

class MiddleOfExpanded extends StatelessWidget {
  Widget child;
  int flex;
  int childFlex;
  Axis scrollDirection;
  MiddleOfExpanded(
      {Key? key, required this.child,
      this.flex = 1,
      this.childFlex = 1,
      this.scrollDirection = Axis.horizontal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: scrollDirection == Axis.horizontal
          ? Row(
              children: [
                Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                  flex: childFlex,
                  child: child,
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                  flex: childFlex,
                  child: child,
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
    );
  }
}
