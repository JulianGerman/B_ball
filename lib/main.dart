
import 'package:b_ball/config/theme.dart';
import 'package:b_ball/core/bloc_wrapper.dart';
import 'package:b_ball/firebase_options.dart';
import 'package:b_ball/injector.dart';
import 'package:b_ball/ui/global_widgets/page_wrapper.dart';
import 'package:b_ball/ui/pages/game/game.dart';
import 'package:b_ball/ui/pages/game_page/game_page.dart';
import 'package:b_ball/ui/pages/home_page/home_page.dart';
import 'package:b_ball/ui/pages/password_reset_page/password_reset_page.dart';
import 'package:b_ball/ui/pages/profile_page/profile_page.dart';
import 'package:b_ball/ui/pages/signin_page/signin_page.dart';
import 'package:b_ball/ui/pages/signup_page/signup_page.dart';
import 'package:b_ball/ui/pages/splash_page/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Set device orientation to portrait only:
  await Flame.device.setPortrait();
  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  injectorSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocWrapper(
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => child!,
        child: MaterialApp(
          title: 'Bball',
          debugShowCheckedModeBanner: false,
          theme: CustomThemeData.theme,
          home: const SplashPage(),
          routes: {
            SignUpPage.routeName: (context) => const SignUpPage(),
            SignInPage.routeName: (context) => const SignInPage(),
            HomePage.routeName: (context) => const HomePage(),
            PasswordResetPage.routeName: (context) => const PasswordResetPage(),
            PageWrapper.routeName: (context) => const PageWrapper(),
            ProfilePage.routeName: (context) => const ProfilePage(),
            GamePage.routeName: (context) => const GamePage(),
            Game.routeName: (context) => const Game(),
          },
        ),
      ),
    );
  }
}
