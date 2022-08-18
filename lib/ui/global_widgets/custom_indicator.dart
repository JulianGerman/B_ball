import 'package:b_ball/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitSpinningLines(color: CustomColors.buttonColor);
  }
}
