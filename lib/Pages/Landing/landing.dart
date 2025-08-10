import 'package:flutter/material.dart';
import 'package:mounts/Pages/Splash/splash.dart';
import 'package:mounts/Widgets/widgets.dart';

class MountsApp extends StatelessWidget {
  const MountsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Icon(Icons.terrain, color: mainColor, size: 40,),
        ),
        actions: [
          SizedBox(width: 40, height: 40)
        ],
        iconTheme: IconThemeData(color: mainColor),
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(30),
          color: mainColor,
          alignment: Alignment.bottomLeft,
          child: Icon(Icons.terrain, color: Colors.white, size: 80),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeader(),
          AppSearch(),
          Expanded(
            child: AppMountListView(),
          ),
          AppCategoryList(),
          AppBottomBar()
        ],
      )
    );
  }
}
