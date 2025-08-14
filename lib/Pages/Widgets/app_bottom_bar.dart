import 'package:flutter/material.dart';
import 'package:mounts/data/models/app_bottom_bar.dart';
import 'package:mounts/utility/constants.dart' as constants;

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});

  @override
  AppBottomBarState createState() => AppBottomBarState();
}

class AppBottomBarState extends State<AppBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(constants.barItems.length, (index) {
          AppBottomBarItem currentBarItem = constants.barItems[index];

          Widget barItemWidget;

          if (currentBarItem.isSelected) {
            barItemWidget = Container(
              padding: EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: constants.mainColor,
              ),
              child: Row(
                children: [
                  Icon(currentBarItem.icon, color: Colors.white),
                  SizedBox(width: 5),
                  Text(
                    currentBarItem.label,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          } else {
            barItemWidget = IconButton(
              icon: Icon(currentBarItem.icon, color: Colors.grey),
              onPressed: () {
                setState(() {
                  for (var item in constants.barItems) {
                    item.isSelected = item == currentBarItem;
                  }
                });
              },
            );
          }

          return barItemWidget;
        }),
      ),
    );
  }
}
