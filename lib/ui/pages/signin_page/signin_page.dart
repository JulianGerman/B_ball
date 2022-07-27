import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  static const String routeName = '/signIn';
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Signin'),
          automaticallyImplyLeading: false,
        ),
      ),
    );
  }
}
