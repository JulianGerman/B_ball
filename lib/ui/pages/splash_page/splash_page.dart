import 'package:b_ball/core/auth_bloc/auth_bloc.dart';
import 'package:b_ball/ui/pages/home_page/home_page.dart';
import 'package:b_ball/ui/pages/signin_page/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  //Animations:

  late final _animationController;
  late final _animation;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.authStatus == AuthStatus.unauthenticated) {
          //CLEAR THE STACK:
          Navigator.pushNamedAndRemoveUntil(context, SignInPage.routeName,
              (route) {
            return route.settings.name == ModalRoute.of(context)!.settings.name
                ? true
                : false;
          });
        } else if (state.authStatus == AuthStatus.authenticated) {
          Navigator.pushNamed(context, HomePage.routeName);
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
