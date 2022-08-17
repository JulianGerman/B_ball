part of 'sign_up_cubit.dart';

enum SignUpStatus {
  initial,
  submitting,
  success,
  error,
}

class SignUpState extends Equatable {
  final SignUpStatus signUpStatus;
  final CustomError customError;

  const SignUpState({
    required this.signUpStatus,
    required this.customError,
  });

  factory SignUpState.initial() {
    return const SignUpState(
      signUpStatus: SignUpStatus.initial,
      customError: CustomError(),
    );
  }

  @override
  List<Object> get props => [signUpStatus, customError];

  SignUpState copyWith({
    SignUpStatus? signUpStatus,
    CustomError? customError,
  }) {
    return SignUpState(
      signUpStatus: signUpStatus ?? this.signUpStatus,
      customError: customError ?? this.customError,
    );
  }

  @override
  String toString() => 'SignUpState(signUpStatus: $signUpStatus, customError: $customError)';
}
