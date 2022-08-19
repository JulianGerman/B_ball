import 'dart:developer';

import 'package:b_ball/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:b_ball/models/custom_error.dart';
import 'package:b_ball/repositories/user_collection_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserCollectionRepository userCollectionRepository;

  UserCubit({
    required this.userCollectionRepository,
  }) : super(UserState.initial());

  Future<void> getProfile({required String uid}) async {
    log('Getting profile');
    emit(state.copyWith(userStoreStatus: UserStoreStatus.loading));

    try {
      final User user = await userCollectionRepository.getProfile(uid: uid);
      emit(state.copyWith(
        userStoreStatus: UserStoreStatus.success,
        user: user,
      ));
    } on CustomError catch (e) {
      emit(state.copyWith(
        userStoreStatus: UserStoreStatus.failed,
        customError: e,
      ));
    }
  }

  Future<void> editProfile({required String uid}) async {
    emit(state.copyWith(userStoreStatus: UserStoreStatus.loading));
    try {
      final User user =
          await userCollectionRepository.editProfileData(uid: uid);
      emit(state.copyWith(
        userStoreStatus: UserStoreStatus.success,
        user: user,
      ));
    } catch (_) {}
  }
}
