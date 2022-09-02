import 'package:b_ball/core/auth_bloc/auth_bloc.dart';
import 'package:b_ball/global_blocs/game_bloc/game_bloc.dart';
import 'package:b_ball/repositories/auth_repository.dart';
import 'package:b_ball/repositories/user_collection_repository.dart';
import 'package:b_ball/ui/pages/game/game_model/game_model_cubit.dart';
import 'package:b_ball/ui/pages/password_reset_page/cubit/password_reset_cubit.dart';
import 'package:b_ball/ui/pages/profile_page/user_cubit/user_cubit.dart';
import 'package:b_ball/ui/pages/signin_page/signin_cubit/sign_in_cubit.dart';
import 'package:b_ball/ui/pages/signup_page/signup_cubit/sign_up_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

void injectorSetup() {
  getIt.registerFactory<AuthRepository>(
    () => AuthRepository(
      firebaseFirestore: FirebaseFirestore.instance,
      firebaseAuth: FirebaseAuth.instance,
    ),
  );
  getIt.registerFactory<UserCollectionRepository>(UserCollectionRepository.new);
  getIt.registerFactory<GameModelCubit>(GameModelCubit.new);
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      authRepository: getIt.get<AuthRepository>(),
    ),
  );
  getIt.registerFactory<SignInCubit>(
    () => SignInCubit(
      authRepository: getIt.get<AuthRepository>(),
    ),
  );
  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(
      authRepository: getIt.get<AuthRepository>(),
    ),
  );
  getIt.registerFactory<PasswordResetCubit>(
    () => PasswordResetCubit(
      authRepository: getIt.get<AuthRepository>(),
    ),
  );
  getIt.registerFactory<UserCubit>(
    () => UserCubit(
      userCollectionRepository: getIt.get<UserCollectionRepository>(),
    ),
  );
  getIt.registerFactory<GameBloc>(GameBloc.new);
}
