import 'package:flutter/material.dart';
import 'package:homepage/screen/body.dart';


class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로그인",textAlign: TextAlign.center),
      ),
      body: Body(
        
      ),
    );
  }
}