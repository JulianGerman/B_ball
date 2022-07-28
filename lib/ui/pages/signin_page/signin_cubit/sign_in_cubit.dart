import 'package:b_ball/models/custom_error.dart';
import 'package:b_ball/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository authRepository;
  SignInCubit({required this.authRepository}) : super(SignInState.initial());

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(signingStatus: SigningStatus.submitting));
    try {
      await authRepository.signInWithEmail(
        email: email,
        password: password,
      );
      emit(state.copyWith(signingStatus: SigningStatus.success));
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          signingStatus: SigningStatus.error,
          customError: e,
        ),
      );
    }
  }

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(signingStatus: SigningStatus.submitting));
    try {
      await authRepository.signInWithGoogle();
      emit(state.copyWith(signingStatus: SigningStatus.success));
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          signingStatus: SigningStatus.error,
          customError: e,
        ),
      );
    }
  }
}
