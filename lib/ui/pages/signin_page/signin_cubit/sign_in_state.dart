part of 'sign_in_cubit.dart';

enum SigningStatus {
  initial,
  submitting,
  success,
  error,
}

class SignInState extends Equatable {
  final SigningStatus signingStatus;
  final CustomError customError;

  const SignInState({
    required this.signingStatus,
    required this.customError,
  });

  factory SignInState.initial() {
    return const SignInState(
      signingStatus: SigningStatus.initial,
      customError: CustomError(),
    );
  }
  @override
  List<Object> get props => [signingStatus, customError];

  @override
  String toString() =>
      'SigninState(signingStatus: $signingStatus, customError: $customError)';

  SignInState copyWith({
    SigningStatus? signingStatus,
    CustomError? customError,
  }) {
    return SignInState(
      signingStatus: signingStatus ?? this.signingStatus,
      customError: customError ?? this.customError,
    );
  }
}
