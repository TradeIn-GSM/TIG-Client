import 'package:flutter/material.dart';
import 'package:homepage/components/default_button.dart';
import 'package:homepage/screen/sign_in/sign_in_screen.dart';
import 'package:homepage/size_config.dart';
//import '../screen/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {   
      "text": "Trade In GSM에 오신걸 환영합니다.",
      "image": "ddong.png",
    },
    {   
      "text": "Trade In GSM은 1234",
      "image": "joyuri.jpg",
    },
    {   
      "text": "코로나 시국 안전한 비대면 중고거래 서비스!",
      "image": "joyuri2.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget> [
             Expanded(
               flex: 2,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context,index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]["text"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
                child: Column(
                  children: <Widget>[
                    Spacer(flex: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length, 
                        (index) => buildDot(index: index)),
                    ),
                    Spacer(flex: 1,),
                    DefaultButton(
                      text: "Trade In GSM 시작",
                      press: () { 
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
              ),
            ],
          ),
        ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 7, 
      width: currentPage == index ? 22 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blue : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
         ),
    );
  }
}

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
        style: TextStyle(fontSize: getProportionateScreenWidth(34),
        color: Colors.blue[400],fontWeight: FontWeight.bold, 
        ),
      ),
       Text(
         text,
         textAlign: TextAlign.center,),
       Spacer(flex: 2,),
       Image.asset(image,
       height: getProportionateScreenWidth(200),
       width: getProportionateScreenWidth(180),)
    ],
    );
  }
}