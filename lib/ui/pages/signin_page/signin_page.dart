import 'package:b_ball/config/colors.dart';
import 'package:b_ball/constants/texts.dart';
import 'package:b_ball/ui/global_widgets/custom_divider.dart';
import 'package:b_ball/ui/global_widgets/custom_scaffold_wrapper.dart';
import 'package:b_ball/ui/pages/signin_page/widgets/signin_form.dart';
import 'package:b_ball/ui/pages/signin_page/widgets/social_login_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends StatelessWidget {
  static const String routeName = '/signIn';
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: CustomScaffoldWrapper(
        child: SingleChildScrollView(
            child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              _buildSignInForm()
            ],
          ),
        )),
      ),
    );
  }

  Padding _buildSignInForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          const SignInForm(),
          SizedBox(height: 15.h),
          Row(children: [
            const CustomDivider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Text(
                Texts.orContinueWith,
                style: CustomTypography.textStyleH4,
              ),
            ),
            const CustomDivider(),
          ]),
          SizedBox(height: 15.h),
          const SocialLoginRow(),
          SizedBox(height: 15.h),
          //TODO: Add terms of use and privacy policies.
          const Text(
            Texts.byClickingThisButton,
            style: CustomTypography.textStyleH6,
          )
        ],
      ),
    );
  }
}
