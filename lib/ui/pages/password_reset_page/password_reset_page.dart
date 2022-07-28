import 'package:b_ball/constants/texts.dart';
import 'package:b_ball/ui/global_widgets/custom_elevated_button.dart';
import 'package:b_ball/ui/global_widgets/custom_scaffold_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordResetPage extends StatelessWidget {
  static const String routeName = '/passwordReset';
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWrapper(
      automaticallyImplyLeading: true,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100.h),
              Text(
                Texts.signIn,
              ),
              _buildResetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildResetPasswordForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        child: Column(
          children: [
            TextFormField(),
            SizedBox(height: 20.h),
            CustomEleveatedButton(onPressed: _submit, content: Texts.email)
          ],
        ),
      ),
    );
  }

  void _submit() {}
}
