import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class InstagramFeed extends StatefulWidget {
  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Instagram Feed'),
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
                    _headFeed(),
                    _middilContain(),
                    _footerItems(),
                  ],
                ),
              ),
            );
          },
          itemCount: 13,
        ));
  }

  Widget _headFeed() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                        ExactAssetImage("assets/images/newsImg.png"),
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
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            )
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
            ],
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite),
                color: Colors.grey,
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
        ],
      ),
    );
  }

  Widget _middilContain() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "We also talk about the future of work as the robots",
                style: TextStyle(
                  fontSize: 14.0,
                  height: 1.8,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                ),
              ),
              Container(
                child: Wrap(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        "#advance",
                        style: TextStyle(
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        "#reting",
                        style: TextStyle(
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        "#instagram",
                        style: TextStyle(
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.40,
          child: Image(
            image: ExactAssetImage("assets/images/newsImg.png"),
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _footerItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          child: Text(
            " 10 COMMENTS",
            style: TextStyle(color: Colors.orangeAccent),
          ),
          onPressed: () {},
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
}
