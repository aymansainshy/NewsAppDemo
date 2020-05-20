import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:news_app/model.dart';
import 'package:news_app/screens/home_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  ValueNotifier<int> _pageIndexNotifier = ValueNotifier(0);

  List<PageModel> pages;

  void _addPages() {
    pages = [];
    pages.add(PageModel(Icons.ac_unit, "assets/images/newsImg1.jpg"));
    pages.add(PageModel(Icons.access_alarm, "assets/images/newsImg.png"));
    pages.add(PageModel(Icons.access_time, "assets/images/newsImg2.jpg"));
    pages.add(PageModel(Icons.accessibility, "assets/images/newsImg3.jpg"));
  }

  // List<String> images = [
  //   "assets/images/newsImg.png",
  //   "assets/images/newsImg1.jpg",
  //   "assets/images/newsImg2.jpg",
  //   "assets/images/newsImg3.jpg"
  // ];

  // List<IconData> icons = [
  //   Icons.ac_unit,
  //   Icons.access_alarm,
  //   Icons.access_time,
  //   Icons.accessibility
  // ];

  @override
  Widget build(BuildContext context) {
    _addPages();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(pages[index].images),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(0, -90),
                        child: Icon(
                          pages[index].icons,
                          size: 130,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Welcome !',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(right: 48, left: 48, top: 10.0),
                        child: Text(
                          'Macking friends is easy as waving your hand back and foryh in easy step ',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                _pageIndexNotifier.value = index;
              });
            },
          ),
          ///////////////////////////////////////////page indicator//////////////////////////////////////////////////////////////////

          Align(
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(0, 130),
              child: _drowIndicator(pages.length),
            ),
          ),

          ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0, left: 15.0, right: 15.0),
              child: SizedBox(
                height: 45.0,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.red.shade800,
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          _upDateSeen();
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drowIndicator(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 11.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 13.0,
          color: Colors.red,
        ),
      ),
    );
  }

  _upDateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
  // List<Widget> _drowInicator() {
  //   List<Widget> _widgets = [];
  //   for (var i = 0; i < pages.length; i++) {
  //     _widgets.add(_drawCircle(Colors.red));
  //   }
  //   return _widgets;
  // }

  // Widget _drawCircle(Color color) {
  //   return Container(
  //     margin: EdgeInsets.all(3.0),
  //     width: 12.0,
  //     decoration: BoxDecoration(
  //       color: color,
  //       shape: BoxShape.circle,
  //     ),
  //   );
  // }
}
