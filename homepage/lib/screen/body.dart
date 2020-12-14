import 'package:flutter/material.dart';
import 'package:homepage/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget> [
             Expanded(
               flex: 3,
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Text('Trade In GSM',
                    style: TextStyle(fontSize: getProportionateScreenWidth(36),
                    color: Colors.blue[400],fontWeight: FontWeight.bold,
                    ),
                  ),
                   Text("Trade In GSM에 오신걸 환영합니다!"),
                   Spacer(flex: 2,),
                   Image.asset("unknown.png",
                   height: getProportionateScreenWidth(235),
                   width: getProportionateScreenWidth(210),)
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(),
              ),
            ],
          ),
        ),
    );
  }
}