import 'package:flutter/material.dart';
import 'package:homepage/Login_success/login_success_screen.dart';
import 'package:homepage/components/custom_surfix_icon.dart';
import 'package:homepage/components/default_button.dart';
import 'package:homepage/components/form_error.dart';
import 'package:homepage/screen/forgot_password/forgot_password_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}){
    if(!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}){
    if(errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(value: remember, 
              activeColor: Color(0xFF42A5F5),
              onChanged: (value) {
                setState(() {
                  remember = value;
                });
              }
              ),
               Text("정보를 기억할까요?"),
               Spacer(),
               GestureDetector(
                 onTap: () => Navigator.pushNamed(
                   context, ForgotPasswordScreen.routeName),
                 child: Text("Forgot Password?",style: TextStyle(decoration: TextDecoration.underline))),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "확인",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if(value.isNotEmpty && errors.contains(kPassNullError)){
              setState(() {
                errors.remove(kPassNullError);
              });
            } else if(value.length >= 8 && errors.contains(kShortPassError)){
              setState(() {
                errors.remove(kShortPassError);
              });
            }
            return null;
      },
      validator: (value) {
            if(value.isEmpty && !errors.contains(kPassNullError)){
              setState(() {
                errors.add(kPassNullError);
              });
            } else if(value.length < 8 && !errors.contains(kShortPassError)){
              setState(() {
                errors.add(kShortPassError);
              });
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "비밀번호",
            hintText: "비밀번호를 입력해주세요.",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
    );
  }
}
