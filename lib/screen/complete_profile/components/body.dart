import 'package:flutter/material.dart';
import 'package:homepage/constants.dart';
import 'package:homepage/size_config.dart';

import 'complete_profile_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
                  child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(
                "프로필 작성",
                style: headingStyle,
              ),
              Text(
                "프로필을 작성해주세요",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              CompleteProfileForm(),
              SizedBox(height: getProportionateScreenHeight(30)),
              Text(
                "프로필을 작성한 후 확인을 눌러주세요",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

