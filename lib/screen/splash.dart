import 'package:flutter/material.dart';
import 'package:homepage/screen/body.dart';
import 'package:homepage/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/spllash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}