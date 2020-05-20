import 'package:flutter/material.dart';
import 'package:news_app/screens/newsstory.dart';
import 'package:news_app/topstoriesapi.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  TopStoryApi topStoryApi = TopStoryApi();

  @override
  Widget build(BuildContext context) {
    topStoryApi.fetchPost();
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildContainer(),
          _buildTopStories(),
        ],
      ),
    );
  }

  Widget _buildContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.28,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage("assets/images/newsImg1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 30.0, right: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text(
                "How Terriers & Royals Gatecrashed Final",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiysmod",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopStoriesItem() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FlatButton(
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 125.0,
              width: 125.0,
              child: Image(
                image: ExactAssetImage("assets/images/newsImg2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 13.0),
                      child: Text(
                        "The World Global Warming Annual Summit",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Michael Adams",
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.timer,
                                size: 16.0,
                              ),
                              Text(
                                "15 min",
                                style: TextStyle(
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsDetail()),
          );
        },
      ),
    );
  }

  Widget _drawDivaider() {
    return Container(
      height: 1.0,
      width: double.infinity,
      color: Colors.grey.shade300,
    );
  }

  Widget _buildTopStories() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 12),
            child: Text(
              "Top Stories",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: Card(
              child: Column(
                children: <Widget>[
                  _buildTopStoriesItem(),
                  _drawDivaider(),
                  _buildTopStoriesItem(),
                  _drawDivaider(),
                  _buildTopStoriesItem(),
                  _drawDivaider(),
                  _buildTopStoriesItem(),
                ],
              ),
            ),
          ),
          _recentUpdate("SPORT", Colors.deepOrange),
          _recentUpdate("LIFESTYLE", Colors.green.shade800),
        ],
      ),
    );
  }

  Widget _recentUpdate(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0, right: 6.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8, bottom: 5, top: 14),
              child: Text(
                "Recent Updates",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.30,
              child: Image(
                image: ExactAssetImage("assets/images/newsImg.png"),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: color,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 6),
              child: Text(
                "Vettel is Ferreri Number One - Hamilton",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    size: 16.0,
                  ),
                  Text(
                    "15 min",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
