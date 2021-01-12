import 'package:flutter/material.dart';
import 'package:homepage/screen/sign_up/sign_up_screen.dart';
import '../size_config.dart';


class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "회원이 아니십니까? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpscreen.routeName),
          child: Text(
            "회원가입",
            style: TextStyle(fontSize: getProportionateScreenWidth(16),
            color: Color(0xFF42A5F5)),
          ),
        )
      ],
    );
  }
}

