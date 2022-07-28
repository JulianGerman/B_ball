import 'package:b_ball/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialLoginButton(
          backgroundColor: CustomColors.upperBackGroundColor,
          buttonType: SocialLoginButtonType.google,
          mode: SocialLoginButtonMode.single,
          text: '',
          onPressed: () {},
        ),
        SocialLoginButton(
          backgroundColor: CustomColors.upperBackGroundColor,
          buttonType: SocialLoginButtonType.facebook,
          mode: SocialLoginButtonMode.single,
          text: '',
          onPressed: () {},
        ),
        SocialLoginButton(
          backgroundColor: CustomColors.upperBackGroundColor,
          buttonType: SocialLoginButtonType.github,
          mode: SocialLoginButtonMode.single,
          text: '',
          onPressed: () {},
        ),
      ],
    );
  }
}
