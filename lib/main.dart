import 'dart:developer';

import 'package:b_ball/core/bloc_wrapper.dart';
import 'package:b_ball/firebase_options.dart';
import 'package:b_ball/injector.dart';
import 'package:b_ball/ui/pages/home_page/home_page.dart';
import 'package:b_ball/ui/pages/signin_page/signin_page.dart';
import 'package:b_ball/ui/pages/signup_page/signup_page.dart';
import 'package:b_ball/ui/pages/splash_page/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  log(DefaultFirebaseOptions.currentPlatform.toString());
  injectorSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocWrapper(
      child: MaterialApp(
        title: 'Bball',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashPage(),
        routes: {
          SignUpPage.routeName: ((context) => SignUpPage()),
          SignInPage.routeName: (context) => SignInPage(),
          HomePage.routeName: (context) => HomePage(),
          // ProfilePage.routeName: ((context) => ProfilePage())
        },
      ),
    );
  }
}
