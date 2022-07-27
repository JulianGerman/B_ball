import 'package:b_ball/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThemeData {
  static final ThemeData theme = ThemeData(
    textTheme: GoogleFonts.montserratTextTheme(),
    //TODO: Change for gradient
    scaffoldBackgroundColor: CustomColors.upperBackGroundColor,
    // TODO: Add whole theme data, fix elevated button theme data:
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return CustomColors.buttonColor;
          } else if (states.contains(MaterialState.disabled)) {
            return CustomColors.grey;
          }
          return CustomColors.buttonColor; // default
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return CustomColors.grey;
          } else {
            return CustomColors.buttonColor;
          } // default or pressed
        }),
        splashFactory: NoSplash.splashFactory, // disable ripple effect
        elevation: MaterialStateProperty.all(0.0),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
              side: BorderSide(color: CustomColors.grey, width: 2.w),
            );
          }
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.r),
            side: BorderSide(color: CustomColors.grey, width: 0.5.w),
          );
        }),
      ),
    ),
  );
}
