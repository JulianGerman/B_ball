import 'package:b_ball/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEleveatedButton extends StatelessWidget {
  final Function()? onPressed;
  final String content;
  final Color backgroundColor;
  final bool isLarge;
  const CustomEleveatedButton({
    Key? key,
    required this.onPressed,
    required this.content,
    this.backgroundColor = CustomColors.buttonColor,
    this.isLarge = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(8.w),
        width: isLarge ? 300.w : 200.w,
        child: Center(
          child: Text(
            content,
            style: CustomTypography.textStyleH3Bold,
          ),
        ),
      ),
    );
  }
}
