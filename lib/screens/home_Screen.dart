import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
import 'package:news_app/screens/home_tap/whats_new.dart';
import 'package:news_app/screens/home_tap/popular.dart';
import 'package:news_app/screens/home_tap/favourites.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopUpMenu { help, contact, sitting }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          _popUpMenu(context),
        ],
        bottom: TabBar(
          indicatorWeight: 3.0,
          indicatorColor: Colors.white,
          labelPadding: EdgeInsets.all(13.0),
          tabs: <Widget>[
            Text("WHAT'S NEW"),
            Text("POPULAR"),
            Text("FAVOURITES"),
          ],
          controller: _tabController,
        ),
      ),
      drawer: NavigationDrawer(),
      body: TabBarView(
        children: <Widget>[
          WhatsNew(),
          Popular(),
          Favorites(),
        ],
        controller: _tabController,
      ),
    );
  }

  Widget _popUpMenu(BuildContext context) {
    return PopupMenuButton<PopUpMenu>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopUpMenu>(
            value: PopUpMenu.help,
            child: Text("HELP"),
          ),
          PopupMenuItem<PopUpMenu>(
            value: PopUpMenu.contact,
            child: Text("CONTACT"),
          ),
          PopupMenuItem<PopUpMenu>(
            value: PopUpMenu.sitting,
            child: Text("SITTING"),
          )
        ];
      },
      onSelected: (PopUpMenu menu) {},
      icon: Icon(Icons.more_vert),
    );
  }
}
