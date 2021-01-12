import 'package:flutter/material.dart';
import 'package:homepage/components/no_account_text.dart';
import 'package:homepage/components/socal_card.dart';
import 'package:homepage/screen/forgot_password/forgot_password_screen.dart';
import 'package:homepage/screen/sign_in/components/sign_form.dart';
import 'package:homepage/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: 
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
                      child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04,),
                Text(
                  "어서오세요!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(),
                Text(
                  "로그인할 이메일 또는 SNS 연동을 해주세요!",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08,),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.avg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.avg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenWidth(20)),
                NoAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}


