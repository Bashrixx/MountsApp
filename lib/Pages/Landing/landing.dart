import 'package:flutter/material.dart';
import 'package:mounts/Pages/Widgets/app_bottom_bar.dart';
import 'package:mounts/Pages/Widgets/app_category_list.dart';
import 'package:mounts/Pages/Widgets/app_header.dart';
import 'package:mounts/Pages/Widgets/app_mounts_list.dart';
import 'package:mounts/Pages/Widgets/app_search.dart';
import 'package:mounts/utility/constants.dart' as constants;

class MountsApp extends StatelessWidget {
  const MountsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: constants.appBar,
      drawer: constants.drawer,
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
