import 'package:b_ball/core/auth_bloc/auth_bloc.dart';
import 'package:b_ball/injector.dart';
import 'package:b_ball/repositories/auth_repository.dart';
import 'package:b_ball/ui/pages/password_reset_page/cubit/password_reset_cubit.dart';
import 'package:b_ball/ui/pages/signin_page/signin_cubit/sign_in_cubit.dart';
import 'package:b_ball/ui/pages/signup_page/signup_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocWrapper extends StatelessWidget {
  final Widget child;
  const BlocWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => getIt.get<AuthRepository>(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt.get<AuthBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt.get<SignInCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt.get<PasswordResetCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt.get<SignUpCubit>(),
            )
          ],
          child: child,
        ));
  }
}
