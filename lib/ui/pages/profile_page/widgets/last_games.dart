import 'package:b_ball/config/colors.dart';
import 'package:b_ball/constants/texts.dart';
import 'package:b_ball/ui/global_widgets/custom_gradient_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastGames extends StatelessWidget {
  const LastGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                Texts.lastGames,
                style: CustomTypography.textStyleH3,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          const CustomGradientCard(child: Text('PLACEHOLDER')),
        ],
      ),
    );
  }
}
