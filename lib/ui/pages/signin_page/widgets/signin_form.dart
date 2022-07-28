import 'dart:developer';
import 'package:b_ball/config/colors.dart';
import 'package:b_ball/constants/texts.dart';
import 'package:b_ball/ui/pages/signin_page/sign_in_cubit/sign_in_cubit.dart';
import 'package:b_ball/ui/pages/signup_page/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validators/validators.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: ListView(
            shrinkWrap: true,
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
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: Texts.password,
                  prefixIcon: Icon(Icons.lock),
                ),
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: state.signingStatus == SigningStatus.submitting
                    ? null
                    : _submit,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      state.signingStatus == SigningStatus.submitting
                          ? Texts.loading
                          : Texts.signIn,
                      style: CustomTypography.textStyleH3Bold),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                  CustomColors.buttonColorDarker,
                )),
                onPressed: state.signingStatus == SigningStatus.submitting
                    ? null
                    : () =>
                        Navigator.of(context).pushNamed(SignUpPage.routeName),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Texts.createNewAccount,
                    style: CustomTypography.textStyleH3Bold,
                  ),
                ),
              )
            ],
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

    log('email: $_email, password: $_password');

    context.read<SignInCubit>().signIn(email: _email!, password: _password!);
  }
}
