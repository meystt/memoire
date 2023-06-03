import 'package:flutter/material.dart';

class ChartData {
  String name;
  DateTime dateTime;
  double value;

  ChartData({
     this.name,
     this.dateTime,
     this.value,
  });
}

class ChartDataType {
  String name;
  int type;
  double value;
  Color color;

  ChartDataType(
      { this.name,
       this.type,
       this.value,
       this.color});
}
