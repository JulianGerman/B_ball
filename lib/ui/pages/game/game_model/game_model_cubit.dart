import 'package:b_ball/ui/pages/game/game.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

part 'game_model_state.dart';

class GameModelCubit extends Cubit<GameModelState> {
  GameModelCubit() : super(GameModelState.initial());

  Future<void> launchGameScreen(BuildContext context) async {
    emit(state.copyWith(gameModelStatus: GameModelStatus.loading));
    pushNewScreen(
      context,
      screen: const Game(),
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.scale,
    );
  }

  void startGame() {
    emit(state.copyWith(gameModelStatus: GameModelStatus.loaded));
  }

  void stopGame(BuildContext context) {
    emit(state.copyWith(gameModelStatus: GameModelStatus.initial));
    Navigator.of(context).pop();
  }
}
