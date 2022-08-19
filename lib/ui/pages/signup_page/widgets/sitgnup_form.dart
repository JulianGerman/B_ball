import 'dart:developer';
import 'package:b_ball/config/colors.dart';
import 'package:b_ball/constants/texts.dart';
import 'package:b_ball/ui/dialogs/error_dialog.dart';
import 'package:b_ball/ui/global_widgets/custom_elevated_button.dart';
import 'package:b_ball/ui/pages/signup_page/signup_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:validators/validators.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  // TextFields:
  String? _email;
  String? _password;
  String? _name;
  bool _obscurePassword = true;
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.signUpStatus == SignUpStatus.error) {
          errorDialog(context, state.customError);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: Texts.name,
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return Texts.nameRequired;
                    }
                    if (!value.contains(RegExp('[a-zA-Z]'))) {
                      return Texts.onlyLetters;
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _name = value;
                  },
                ),
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
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  autocorrect: false,
                  decoration: InputDecoration(
                      labelText: Texts.password,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: (() {
                          _obscurePassword = !_obscurePassword;
                          if (mounted) setState(() {});
                        }),
                        icon: Icon(
                          _obscurePassword
                              ? Icons.password
                              : Icons.remove_red_eye,
                          color: CustomColors.white,
                        ),
                        splashColor: Colors.transparent,
                      )),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return Texts.passwordRequired;
                    }
                    if (value.trim().length < 6) {
                      return Texts.passwordValidationError;
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _password = value;
                  },
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  obscureText: _obscurePassword,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: Texts.confirmPassword,
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return Texts.passwordRequired;
                    }
                    if (value.trim().length < 6) {
                      return Texts.passwordValidationError;
                    }
                    if (value.trim() != _passwordController.text) {
                      return Texts.passwordsDoesntMatch;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                CustomEleveatedButton(
                  onPressed: state.signUpStatus == SignUpStatus.submitting
                      ? null
                      : _submit,
                  content: Texts.signUp,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }

  void _submit() {
    _autovalidateMode = AutovalidateMode.always;
    if (mounted) setState(() {});

    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;

    form.save();
    context
        .read<SignUpCubit>()
        .signUp(name: _name!, email: _email!, password: _password!);
    log('email: $_email, password: $_password');
  }
}
