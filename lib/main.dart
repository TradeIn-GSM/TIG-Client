import 'package:flutter/material.dart';
import 'package:homepage/routs.dart';
import 'package:homepage/screen/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trade-In-GSM',
      theme: ThemeData(
        fontFamily: "Muli",
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: SplashScreen()
      initialRoute: SplashScreen.routeName,
      routes: rotes,
    );
  }
}
