import 'package:flutter/material.dart';
import 'package:homepage/components/custom_surfix_icon.dart';
import 'package:homepage/components/default_button.dart';
import 'package:homepage/components/form_error.dart';
import 'package:homepage/screen/complete_profile/complete_profile_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';


class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String conform_password;
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
          SizedBox(height: getProportionateScreenWidth(30),),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenWidth(30),),
          buildConfPasswordFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenWidth(30),),
          DefaultButton(
          text: "확인",
         press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
          }
        ),
      ],
    ),
  );
}

  TextFormField buildConfPasswordFormField() {
    return TextFormField(
    obscureText: true,
    onSaved: (newValue) => conform_password = newValue,
    onChanged: (value) {
      if(password == conform_password){
           removeError(error: kMatchPassError);
          }
          return null;
          },
          validator: (value) {
            if(value.isEmpty){
              removeError(error: kPassNullError);
              return "";
            } else if(password != value){
              addError(error: kMatchPassError);
              return "";
            }
            return null;
            },
        decoration: InputDecoration(
          labelText: "비밀번호 확인",
          hintText: "비밀번호를 입력해주세요.",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "비밀번호",
        hintText: "비밀번호를 입력해주세요",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
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