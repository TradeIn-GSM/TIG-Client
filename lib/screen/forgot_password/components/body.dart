import 'package:flutter/material.dart';
import 'package:homepage/components/custom_surfix_icon.dart';
import 'package:homepage/components/default_button.dart';
import 'package:homepage/components/form_error.dart';
import 'package:homepage/components/no_account_text.dart';
import 'package:homepage/constants.dart';
import 'package:homepage/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "비밀번호 수정",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "이메일을 입력하시면 계정을 반환할 수 있는\n 링크를 보내드리겠습니다.",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  @override
  Widget build(BuildContext context) { 
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => email = newValue,
          onChanged: (value){
            if(value.isNotEmpty && errors.contains(kEmailNullError)){
              setState(() {
                errors.remove(kEmailNullError);
              });
            } else if(emailValidatorRegExp.hasMatch(value) && 
                errors.contains(kInvalidEmailError)){
              setState(() {
                errors.remove(kInvalidEmailError);
              });
            }
            return null;
          },
          validator: (value) {
            if(value.isEmpty && !errors.contains(kEmailNullError)){
              setState(() {
                errors.add(kEmailNullError);
                });
             } else if(!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)){
                setState(() {
                  errors.add(kInvalidEmailError);
               });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "이메일",
              hintText: "이메일을 입력해주세요.",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "확인",
            press: () {
              if(_formKey.currentState.validate()){

              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ],
      ),
    );
  }
}