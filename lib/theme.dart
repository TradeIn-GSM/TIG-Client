import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        appBarTheme: appBarTheme(),
        inputDecorationTheme: inputDecorationTheme(),
        textTheme: textTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: Color(0xFF42A5F5)),
              gapPadding: 10,
              );
    return InputDecorationTheme(
              //floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(horizontal: 42,vertical: 20),
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            border: outlineInputBorder
          );
}

TextTheme textTheme() {
  return TextTheme(
        bodyText1: TextStyle(color: Color(0xFF42A5F5)),
        bodyText2: TextStyle(color: Colors.grey[700])
        );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
        color: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: TextTheme(
          headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 30),
        ),
      );
}