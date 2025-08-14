import 'package:flutter/material.dart';
import 'package:mounts/utility/constants.dart' as constants;

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 30, right: 30),
      child: Row(
        children: [
          ClipOval(
            child: Image(
              image: AssetImage("assets/images/cltest.jpg"),
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20),
          Column(
            children: [
              Text(
                "Hello, Roman",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Good morning",
                style: TextStyle(color: constants.mainColor, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
