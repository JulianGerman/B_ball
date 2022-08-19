import 'package:b_ball/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGradientCard extends StatelessWidget {
  final Widget child;
  final double height;

  const CustomGradientCard({
    Key? key,
    required this.child,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              CustomColors.bottomBackGroundColor,
              CustomColors.upperBackGroundColor,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Center(child: child),
        ),
      ),
    );
  }
}
