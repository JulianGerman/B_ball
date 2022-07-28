import 'package:flutter/material.dart';

class CustomColors {
  //Scaffold background color:

  static const Color upperBackGroundColor = Color(0xff454B4E);
  static const Color bottomBackGroundColor = Color(0xff23272A);
  static const Color buttonColor = Color(0xff37C0CA);
  static const Color grey = Colors.grey;
  static const Color buttonColorDarker = Color(0xff199AAD);
  static const Color white = Colors.white;
}

class CustomTypography {
  static const TextStyle textStyleH1 = TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.w800,
  );
  static const TextStyle textStyleH2 = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle textStyleH3 =
      TextStyle(color: Colors.white, fontSize: 18);
  static TextStyle textStyleH3Bold =
      textStyleH3.copyWith(fontWeight: FontWeight.w800);
  static const TextStyle textStyleH4 =
      TextStyle(color: Colors.white, fontSize: 12);
  static const TextStyle textStyleH5 =
      TextStyle(color: Colors.white, fontSize: 12);
  static const TextStyle textStyleH6 =
      TextStyle(color: Colors.white, fontSize: 8);
}
