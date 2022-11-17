import 'package:flutter/material.dart';

class LineChart extends StatelessWidget {
  double width;
  int total = 0;
  int maxLength;
  double height;
  List<LineChartItem> items;
  LineChart(
      {required this.width, required this.maxLength, required this.items,this.height=5}) {
    for (var item in items) {
      total += item.count;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: Colors.grey[300], borderRadius: BorderRadius.circular(30)),
          ),
          if(total!=0)
          for (int i = items.length - 1; i >= 0; i--)
            Container(
              width: width * ((total - removeCount(i)) / maxLength),
              height: height,
              decoration: BoxDecoration(
                  color: items[i].color, borderRadius: BorderRadius.circular(30)),
            )
        ],
      ),
    );
  }

  int removeCount(int index) {
    if (index == items.length - 1)
      return 0;
    else {
      int count = 0;
      for (int i = items.length - 1; i > index; i--) {
        count += items[i].count;
      }
      return count;
    }
  }
}

class LineChartItem {
  int count;
  Color color;
  LineChartItem({required this.count, required this.color});
}
