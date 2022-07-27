import 'dart:async';
import 'dart:developer';
import 'package:b_ball/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  late final StreamSubscription authSubscription;
  AuthBloc({
    required this.authRepository,
  }) : super(AuthState.unknown()) {
    authSubscription = authRepository.user.listen((fb_auth.User? user) {
      add(AuthStateChangedEvent(user: user));
    });
    on<AuthStateChangedEvent>((event, emit) {
      if (event.user != null) {
        emit(
          state.copyWith(
            authStatus: AuthStatus.authenticated,
            user: event.user,
          ),
        );
      } else {
        emit(
          state.copyWith(
            authStatus: AuthStatus.unauthenticated,
            user: null,
          ),
        );
      }
      log(state.authStatus.toString());
    });
    on<SignOutRequestedEvent>((event, emit) async {
      await authRepository.signOut();
    });
  }

  @override
  Future<void> close() {
    authSubscription.cancel();
    return super.close();
  }
}
