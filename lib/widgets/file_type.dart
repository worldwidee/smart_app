import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';

class FileType extends StatelessWidget {
  double size;
  int typeIndex;
  late dynamic icon;
  List<Color> fileTypesColor = [
    Color(0xFF6370fd),
    Color(0xFFff6760),
    Color(0xFFfdbe00),
  ];
  List<Color> fileTypesBgColor = [
    Color(0xFFeff0fe),
    Color(0xFFffefee),
    Color(0xFFe6faf3)
  ];

  FileType({required this.typeIndex, required this.size}) {
    double iconSize = size * 0.6;
    if (typeIndex == 0) {
      icon = Icon(
        Icons.image_outlined,
        size: iconSize,
        color: fileTypesColor[typeIndex],
      );
    } else if (typeIndex == 1) {
      icon = Icon(
        Boxicons.bx_movie,
        size: iconSize,
        color: fileTypesColor[typeIndex],
      );
    } else {
      icon = Icon(
        Boxicons.bx_file,
        size: iconSize,
        color: fileTypesColor[typeIndex],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: fileTypesBgColor[typeIndex],
          borderRadius: BorderRadius.circular(7)),
      child: Center(
        child: icon,
      ),
    );
  }
}
