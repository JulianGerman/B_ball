import 'package:b_ball/config/colors.dart';
import 'package:b_ball/constants/texts.dart';
import 'package:b_ball/ui/global_widgets/custom_scaffold_wrapper.dart';
import 'package:b_ball/ui/pages/signup_page/widgets/sitgnup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatelessWidget {
  static const String routeName = '/signUp';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWrapper(
        automaticallyImplyLeading: true,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100.h),
                // LOGO PLACEHOLDER:
                Container(
                  height: 200,
                  width: 200,
                  color: CustomColors.bottomBackGroundColor,
                  child: const Text(
                    'LOGOPLACEHOLDER',
                    style: CustomTypography.textStyleH4,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10.h),
                const Text(
                  Texts.signUp,
                  style: CustomTypography.textStyleH2,
                ),
                SizedBox(height: 10.h),
                const SignUpForm(),
              ],
            ),
          ),
        ));
  }
}
