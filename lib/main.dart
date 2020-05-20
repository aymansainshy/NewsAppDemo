import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:news_app/screens/welcome_screen.dart';
import 'package:news_app/screens/home_Screen.dart';
import 'package:news_app/utilities/app_them.dart';

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool seen = prefs.getBool('seen');

  Widget _screen;

  if (seen == null || seen == false) {
    _screen = WelcomeScreen();
  } else {
    _screen = HomeScreen();
  }
  runApp(MyApp(_screen));
}

class MyApp extends StatelessWidget {
  final Widget _screen;
  MyApp(this._screen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThem.appThem,
      home: _screen,
    );
  }
}
