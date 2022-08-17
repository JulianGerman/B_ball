import 'package:b_ball/models/custom_error.dart';
import 'package:b_ball/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository authRepository;
  SignUpCubit({required this.authRepository}) : super(SignUpState.initial());

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(state.copyWith(signUpStatus: SignUpStatus.submitting));
    try {
      await authRepository.signUpWithEmail(
        name: name,
        email: email,
        password: password,
      );
      emit(state.copyWith(signUpStatus: SignUpStatus.success));
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          signUpStatus: SignUpStatus.error,
          customError: e,
        ),
      );
    }
  }
}
