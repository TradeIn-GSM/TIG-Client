import 'package:flutter/material.dart';
import 'package:homepage/screen/sign_up/components/body.dart';

class SignUpscreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원가입")
      ),
      body: Body(),
    );
  }
}