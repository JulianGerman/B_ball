part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class StartGameEvent extends GameEvent {}

class FetchGamesEvent extends GameEvent {}