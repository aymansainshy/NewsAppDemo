import 'package:flutter/material.dart';
import 'package:news_app/models/nav_menuitem.dart';
import 'package:news_app/screens/headline_news.dart';
import 'package:news_app/screens/home_Screen.dart';
import 'package:news_app/screens/home_tap/facebookfeed.dart';
import 'package:news_app/screens/instagram_feed.dart';
import 'package:news_app/screens/twitter_feed.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavMenuItem> navMenuItem = [
    NavMenuItem("Explore", () => HomeScreen()),
    NavMenuItem("HeadLineNews", () => HeadLineNews()),
    NavMenuItem("Twitter Feed", () => TwitterFeed()),
    NavMenuItem("Instagram Feed", () => InstagramFeed()),
    NavMenuItem("FaceBook Feed", () => FacebookFeed())
  ];

  // List<String> navMenu = [
  //   'Explore',
  //   'Headline News',
  //   'Read Later',
  //   'Videos',
  //   'Photos'
  // ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 80.0, left: 25),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(navMenuItem[index].title),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => navMenuItem[index].destnation(),
                  ),
                );
              },
            );
          },
          itemCount: navMenuItem.length,
        ),
      ),
    );
  }
}
