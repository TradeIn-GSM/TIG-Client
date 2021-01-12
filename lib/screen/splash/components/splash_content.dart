import 'package:flutter/material.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key, 
    this.text, 
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text('Trade In GSM',
        style: TextStyle(fontSize: getProportionateScreenWidth(36),
        color: Colors.blue[400],fontWeight: FontWeight.bold,
        ),
      ),
       Text(
         text,
         textAlign: TextAlign.center,),
       Spacer(flex: 3,),
       Image.asset(image,
       height: getProportionateScreenWidth(255),
       width: getProportionateScreenWidth(200),)
    ],
    );
  }
}