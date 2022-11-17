import 'package:flutter/material.dart';

import 'package:smart_app/variables/time_variables.dart';

class FileIcon extends StatelessWidget {
  String extension;
  double size;
  List<Color> fileTypesColor = [
    Color(0xFF6370fd),
    Color(0xFFff6760),
    Color(0xFFfdbe00),
  ];
  late int typeIndex;
  FileIcon({required this.extension, required this.size}) {
    if (TimeVariables.imgExt
        .any((element) => element.toUpperCase() == extension.toUpperCase())) {
      typeIndex = 0;
    } else if (TimeVariables.vidExt
        .any((element) => element.toUpperCase() == extension.toUpperCase())) {
      typeIndex = 1;
    } else
      typeIndex = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: fileTypesColor[typeIndex],
          borderRadius: BorderRadius.circular(7)),
      child: Center(
        child: Text(
          extension.toUpperCase(),
          style: TextStyle(
              color: Colors.white,
              fontSize: size / 3.5,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
