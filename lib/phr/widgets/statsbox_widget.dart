import 'package:flutter/material.dart';

import 'boxcolumndata_widget.dart';


class StatsBoxWidget extends StatelessWidget {
  const StatsBoxWidget({
    Key key,
     this.width,
     this.height,
     this.title,
     this.value,
     this.valueColor,
     this.subTitle,
  }) : super(key: key);

  final double width;
  final double height;
  final String title;
  final String value;
  final Color valueColor;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        child: BoxColumnDataWidget(
          title: title,
          value: value,
          subTitle: subTitle,
          valueColor: valueColor,
        ),
      ),
    );
  }
}
