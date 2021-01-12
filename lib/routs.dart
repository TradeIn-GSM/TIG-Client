import 'package:flutter/material.dart';
import 'package:homepage/Login_success/login_success_screen.dart';
import 'package:homepage/screen/complete_profile/complete_profile_screen.dart';
import 'package:homepage/screen/forgot_password/forgot_password_screen.dart';
import 'package:homepage/screen/sign_up/sign_up_screen.dart';
import 'package:homepage/screen/splash/components/splash.dart';
import 'package:homepage/screen/sign_in/sign_in_screen.dart';

final Map<String, WidgetBuilder> rotes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpscreen.routeName: (context) => SignUpscreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
};