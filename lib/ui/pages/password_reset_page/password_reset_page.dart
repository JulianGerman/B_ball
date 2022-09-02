import 'package:b_ball/config/colors.dart';
import 'package:b_ball/constants/texts.dart';
import 'package:b_ball/ui/dialogs/error_dialog.dart';
import 'package:b_ball/ui/global_widgets/custom_elevated_button.dart';
import 'package:b_ball/ui/global_widgets/custom_scaffold_wrapper.dart';
import 'package:b_ball/ui/pages/password_reset_page/cubit/password_reset_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:validators/validators.dart';

class PasswordResetPage extends StatefulWidget {
  static const String routeName = '/passwordReset';
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? _email;

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWrapper(
      automaticallyImplyLeading: true,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 100.h),
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
            SizedBox(height: 20.h),
            const Text(
              Texts.resetPassword,
              style: CustomTypography.textStyleH2,
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Text(
                Texts.pleaseEnterYourEmailAddress,
                style: CustomTypography.textStyleH5,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10.h),
            _buildResetPasswordForm(),
          ],
        ),
      ),
    );
  }

  Padding _buildResetPasswordForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: BlocConsumer<PasswordResetCubit, PasswordResetState>(
        listener: (context, state) {
          if (state.passwordResetStatus == PasswordResetStatus.error) {
            errorDialog(context, state.error);
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: Texts.email,
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return Texts.emailRequired;
                    }
                    if (!isEmail(value.trim())) {
                      return Texts.emailValidationError;
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _email = value;
                  },
                ),
                SizedBox(height: 20.h),
                CustomEleveatedButton(
                  onPressed: _submit,
                  content: Texts.sendPasswordResetEmail,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _submit() {
    _autovalidateMode = AutovalidateMode.always;
    if (mounted) setState(() {});
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;

    form.save();
    context.read<PasswordResetCubit>().resetPassword(email: _email!);
  }
}
