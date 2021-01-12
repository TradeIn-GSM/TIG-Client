import 'package:flutter/material.dart';
import 'package:homepage/components/default_button.dart';
import 'package:homepage/components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';


class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
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
         buildFirstNameFormField(),
         SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "확인",
            press: (){
              if(_formKey.currentState.validate()) {

              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
  obscureText: true,
  onSaved: (newValue) => address = newValue,
  onChanged: (value) {
    if(value.isNotEmpty){
          removeError(error: kAddressNullError);
        } 
        return null;
  },
  validator: (value) {
    if(value.isEmpty){
      addError(error: kAddressNullError);
            return "";
          }
            return null;
          },
          decoration: InputDecoration(
            labelText: "주소",
            hintText: "주소를 입력해주세요.",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
          keyboardType: TextInputType.number,
          onSaved: (newValue) => phoneNumber = newValue,
          onChanged: (value) {
            if(value.isNotEmpty){
              removeError(error: kPhoneNumberNullError);
              } 
                return null;
          },
          validator: (value) {
            if(value.isEmpty){
              addError(error: kPhoneNumberNullError);
                return "";
              }
               return null;
              },
          decoration: InputDecoration(
            labelText: "핸드폰 번호",
            hintText: "핸드폰 번호를 입력해주세요.",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
          obscureText: true,
          onSaved: (newValue) => lastName = newValue,
          decoration: InputDecoration(
            labelText: "이름",
            hintText: "이름 입력해주세요.",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
  obscureText: true,
  onSaved: (newValue) => firstName = newValue,
  onChanged: (value) {
    if(value.isNotEmpty){
          removeError(error: kNamelNullError);
        } 
        return null;
  },
  validator: (value) {
    if(value.isEmpty){
      addError(error: kNamelNullError);
            return "";
          }
            return null;
          },
          decoration: InputDecoration(
            labelText: "First name",
            hintText: "이름(성) 입력해주세요.",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        );
  }
}