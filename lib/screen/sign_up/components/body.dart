import 'package:flutter/material.dart';
import 'package:homepage/screen/sign_up/components/sign_up_form.dart';
import 'package:homepage/size_config.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
            Text(
              "계정등록",
              style: headingStyle, 
            ),
            Text(
              "계정 세부정보를 입력해주시거나\nSNS 연동을 해주세요.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            SignupForm(),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
          ]
        ),
    ),
    );
  }
}
