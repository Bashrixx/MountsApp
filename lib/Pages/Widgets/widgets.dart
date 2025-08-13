import 'package:flutter/material.dart';
import 'package:mounts/Pages/Details/details.dart';
import 'package:mounts/Pages/Splash/splash.dart';
import 'package:mounts/data/models/app_bottom_bar.dart';
import 'package:mounts/data/models/category.dart';
import 'package:mounts/data/models/mount.dart';
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

class AppSearch extends StatelessWidget {
  const AppSearch({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Discover",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Text("Search", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: constants.mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.tune, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppMountListView extends StatelessWidget {
  const AppMountListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: constants.mountitems.length,
        itemBuilder: (context, index) {
          MountModel currentMount = constants.mountitems[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsPage(currentMount),
                ),
              );
            },
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(currentMount.path),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentMount.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    currentMount.location,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AppCategoryList extends StatelessWidget {
  const AppCategoryList({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "See More",
                  style: TextStyle(
                    color: constants.mainColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(left: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: constants.categories.length,
              itemBuilder: (context, index) {
                CategoryModel currentCategory = constants.categories[index];
                return Container(
                  width: 100,
                  margin: EdgeInsets.only(top: 10, right: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.2),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(currentCategory.icon, color: constants.mainColor),
                      Text(
                        currentCategory.category,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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

class DetailsRatingBar extends StatelessWidget {
  var sampleRatingData = {'Rating': '4.6', 'Price': '\$12', 'Open': '24hrs'};

  DetailsRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          sampleRatingData.entries.length,
          (index) => Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.2), width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  sampleRatingData.entries.elementAt(index).key,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  sampleRatingData.entries.elementAt(index).value,
                  style: TextStyle(
                    color: constants.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsBottomActions extends StatelessWidget {
  const DetailsBottomActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(15),
              color: constants.mainColor,
              child: InkWell(
                highlightColor: Colors.white.withOpacity(0.2),
                splashColor: Colors.white.withOpacity(0.2),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(21),
                  child: Text(
                    'Book Now',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              border: Border.all(color: constants.mainColor, width: 2),
            ),
            child: Icon(Icons.turned_in_not, color: constants.mainColor, size: 25),
          ),
        ],
      ),
    );
  }
}
