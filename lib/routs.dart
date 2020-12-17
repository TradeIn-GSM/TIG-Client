import 'package:flutter/cupertino.dart';
import 'package:homepage/screen/splash.dart';
import 'package:homepage/sign_in/sign_in_screen.dart';

final Map<String, WidgetBuilder> rotes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen()
};