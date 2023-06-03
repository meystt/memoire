import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const.dart';
import '../../themes/theme.dart';


class MenuWidget extends StatelessWidget {
  const MenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Wrap(
        children: mainMenu.map((item) {
          // Menu icon
          return GestureDetector(
            child: SizedBox(
              width: (constraints.maxWidth / 3),
              height: (constraints.maxWidth / 3),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      item.image,
                      size: (constraints.maxWidth / 3) * 0.4,
                      color: item.color,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: FittedBox(child: Text(item.title, style: textTitleStyle)),
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              // Navigate to target page
              Get.to(() => item.widget);
            },
          );
        }).toList(),
      );
    });
  }
}
