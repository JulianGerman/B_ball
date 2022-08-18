part of 'password_reset_cubit.dart';

enum PasswordResetStatus {
  initial,
  submitting,
  success,
  error,
}

class PasswordResetState extends Equatable {
  final PasswordResetStatus passwordResetStatus;
  final CustomError error;

  const PasswordResetState({
    required this.passwordResetStatus,
    required this.error,
  });

  factory PasswordResetState.initial() {
    return const PasswordResetState(
      passwordResetStatus: PasswordResetStatus.initial,
      error: CustomError(),
    );
  }

  PasswordResetState copyWith({
    PasswordResetStatus? passwordResetStatus,
    CustomError? error,
  }) {
    return PasswordResetState(
      passwordResetStatus: passwordResetStatus ?? this.passwordResetStatus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [passwordResetStatus, error];

  @override
  String toString() =>
      'PasswordResetState(passwordResetStatus: $passwordResetStatus, error: $error)';
}
