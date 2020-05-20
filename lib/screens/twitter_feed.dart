import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Twitter Feeds'),
          centerTitle: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        drawer: NavigationDrawer(),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade100,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _headerRow(),
                    _middilRow(),
                    _drawDivaider(),
                    _footerRow(),
                  ],
                ),
              ),
            );
          },
          itemCount: 13,
        ));
  }

  Widget _headerRow() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: ExactAssetImage("assets/images/newsImg.png"),
            radius: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Christina Meyers",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "@cd_meryj",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13.0,
                ),
                Text(
                  "Fri, 12 May 2019 - 14:30",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _middilRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 10.0, left: 10.0),
      child: Text(
        "We also talk about the future of work as the robots advance and we ask whether a reteo photo",
        style: TextStyle(
          fontSize: 14.0,
          height: 1.8,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }

  Widget _footerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.repeat),
              color: Colors.orangeAccent,
              onPressed: () {},
            ),
            Transform.translate(
              offset: Offset(-10, 0),
              child: Text(
                '25',
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            FlatButton(
              child: Text(
                "SHARE",
                style: TextStyle(color: Colors.orangeAccent),
              ),
              onPressed: () {},
            ),
            FlatButton(
              child: Text(
                "OPEN",
                style: TextStyle(color: Colors.orangeAccent),
              ),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }

  Widget _drawDivaider() {
    return Container(
      height: 1.0,
      width: double.infinity,
      color: Colors.grey.shade300,
    );
  }
}
