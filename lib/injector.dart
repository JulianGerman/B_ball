import 'package:b_ball/core/auth_bloc/auth_bloc.dart';
import 'package:b_ball/repositories/auth_repository.dart';
import 'package:b_ball/ui/pages/signin_page/sign_in_cubit/sign_in_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

void injectorSetup() {
  getIt.registerFactory<AuthRepository>(() => AuthRepository(
      firebaseFirestore: FirebaseFirestore.instance,
      firebaseAuth: FirebaseAuth.instance));
  getIt.registerFactory<AuthBloc>(() => AuthBloc(
        authRepository: getIt.get<AuthRepository>(),
      ));
  getIt.registerFactory<SignInCubit>(
      () => SignInCubit(authRepository: getIt.get<AuthRepository>()));
}
