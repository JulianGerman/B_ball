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
        //TODO: Add google, fb, github signIn
        _buildButton(SocialLoginButtonType.google, () => null),
        _buildButton(SocialLoginButtonType.facebook, () => null),
        _buildButton(SocialLoginButtonType.github, () => null),
      ],
    );
  }

  Container _buildButton(
    SocialLoginButtonType buttonType,
    Function()? onPressed,
  ) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: CustomColors.buttonColor,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: SocialLoginButton(
        borderRadius: 15,
        backgroundColor: CustomColors.upperBackGroundColor,
        mode: SocialLoginButtonMode.single,
        fontSize: 0,
        text: '',
        buttonType: buttonType,
        onPressed: onPressed,
      ),
    );
  }
}