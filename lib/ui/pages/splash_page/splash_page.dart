import 'dart:developer';
import 'package:b_ball/core/auth_bloc/auth_bloc.dart';
import 'package:b_ball/ui/global_widgets/custom_indicator.dart';
import 'package:b_ball/ui/global_widgets/page_wrapper.dart';
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
  // late final AnimationController _animationController;
  // late final Animation _animation;

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
          Navigator.pushNamed(context, PageWrapper.routeName);
          log('user: ${state.user}');
        }
      },
      builder: (context, state) {
        //TODO: Add splashscreen animation
        return const Scaffold(
          body: Center(
            child: CustomIndicator(),
          ),
        );
      },
    );
  }
}
