part of 'user_cubit.dart';

enum UserStoreStatus {
  initial,
  loading,
  success,
  failed,
}

class UserState extends Equatable {
  final UserStoreStatus userStoreStatus;
  final User user;
  final CustomError customError;

  const UserState({
    required this.userStoreStatus,
    required this.customError,
    required this.user,
  });

  factory UserState.initial() {
    return UserState(
      userStoreStatus: UserStoreStatus.initial,
      customError: const CustomError(),
      user: User.initialUser(),
    );
  }

  @override
  List<Object> get props => [userStoreStatus, user, customError];

  UserState copyWith({
    UserStoreStatus? userStoreStatus,
    User? user,
    CustomError? customError,
  }) {
    return UserState(
      userStoreStatus: userStoreStatus ?? this.userStoreStatus,
      user: user ?? this.user,
      customError: customError ?? this.customError,
    );
  }

  @override
  String toString() => 'UserState(userStoreStatus: $userStoreStatus, user: $user, customError: $customError)';
}
