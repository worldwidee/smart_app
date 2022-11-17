import 'package:flutter/material.dart';

class ChildExpanded extends StatelessWidget {
  Widget child;
  int flex;
  int itemCount;
  late int marginFlex;
  late int mainFlex;
  ChildExpanded({Key? key, required this.child, this.flex = 1, this.itemCount = 1}) : super(key: key) {
    if (itemCount != 1) {
      if (itemCount % 2 == 0) {
        mainFlex = 2;
        marginFlex = (((itemCount * 2) - 2) ~/ 2);
      } else {
        mainFlex = 1;
        marginFlex = (itemCount - 1) ~/ 2;
      }
    }else{
      mainFlex=1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Column(
        children: [
          if(itemCount!=1)
          Expanded(
            flex: marginFlex,
            child: SizedBox(),
          ),
          Expanded(
            flex: mainFlex,
            child: child,
          ),
          if(itemCount!=1)
          Expanded(
            flex: marginFlex,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
