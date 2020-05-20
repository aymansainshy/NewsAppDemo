import 'package:flutter/material.dart';
import 'package:news_app/screens/home_tap/favourites.dart';
import 'package:news_app/screens/home_tap/popular.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';


class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews>
    with TickerProviderStateMixin {
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
        title: Text("HeadLineNews"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
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
          Favorites(),
          Popular(),
          Favorites(),
        ],
        controller: _tabController,
      ),
    );
  }
}
