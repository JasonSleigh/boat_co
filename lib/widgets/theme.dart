import 'package:boat_co/constants/colors.dart';
import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.blueAccent,
  fontFamily: 'Georgia',
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  // appBarTheme:
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    titleTextStyle: TextStyle(
      color: mainBlue,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: true,
  ),
);
