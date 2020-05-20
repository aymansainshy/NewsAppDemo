import 'dart:math';

import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Color> myColor = [
    Colors.red,
    Colors.blue,
    Colors.lightGreen,
    Colors.yellow,
    Colors.green,
    Colors.blueGrey,
    Colors.deepOrangeAccent,
    Colors.purple,
  ];

  Random random = Random();

  Color _getRandomColor() {
    return myColor[random.nextInt(myColor.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            margin: EdgeInsets.all(13),
            child: Column(
              children: <Widget>[
                _firistRow(),
                _secondRow(),
              ],
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }

  Widget _firistRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/images/newsImg2.jpg"),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Michael Adams",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "15 min",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "LifeStyle",
                          style: TextStyle(
                            color: _getRandomColor(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _secondRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 13, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 115,
            width: 125,
            child: Image(
              image: ExactAssetImage("assets/images/newsImg2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                children: <Widget>[
                  Text(
                    "Tech Tent: Old phones and safe social",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    "We also talk about the future of work as the robots advance and we ask whether a retro phone",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      wordSpacing: 2,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
