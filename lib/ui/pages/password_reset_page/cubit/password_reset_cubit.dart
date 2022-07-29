import 'package:b_ball/models/custom_error.dart';
import 'package:b_ball/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_reset_state.dart';

class PasswordResetCubit extends Cubit<PasswordResetState> {
  final AuthRepository authRepository;
  PasswordResetCubit({
    required this.authRepository,
  }) : super(PasswordResetState.initial());

  Future<void> resetPassword({
    required String email,
  }) async {
    emit(state.copyWith(passwordResetStatus: PasswordResetStatus.submitting));
    try {
      await authRepository.resetPassword(email: email);
      emit(state.copyWith(passwordResetStatus: PasswordResetStatus.success));
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          passwordResetStatus: PasswordResetStatus.error,
          error: e,
        ),
      );
    }
  }
}
