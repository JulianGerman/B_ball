import 'package:b_ball/config/colors.dart';
import 'package:b_ball/constants/texts.dart';
import 'package:b_ball/ui/global_widgets/custom_gradient_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentBalls extends StatelessWidget {
  const RecentBalls({Key? key}) : super(key: key);
  final List<int> balls = const [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                Texts.recentlyUsedBalls,
                style: CustomTypography.textStyleH3,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CustomGradientCard(child: _buildBalls()),
        ],
      ),
    );
  }

  Row _buildBalls() {
    //TODO: Replace placeholder with balls models
    return Row(
        children: balls.map((ball) {
      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
          ),
          child: Center(
              child: Text(
            ball.toString(),
            style: CustomTypography.textStyleH4,
          )),
        ),
      );
    }).toList());
  }
}
