part of 'game_model_cubit.dart';

enum GameModelStatus {
  initial,
  loading,
  loaded,
}

class GameModelState extends Equatable {
  final GameModelStatus gameModelStatus;

  const GameModelState({
    required this.gameModelStatus,
  });

  factory GameModelState.initial() {
    return const GameModelState(
      gameModelStatus: GameModelStatus.initial,
    );
  }

  @override
  List<Object> get props => [gameModelStatus];

  GameModelState copyWith({
    GameModelStatus? gameModelStatus,
  }) {
    return GameModelState(
      gameModelStatus: gameModelStatus ?? this.gameModelStatus,
    );
  }

  @override
  String toString() => 'GameState(gameStatus: $gameModelStatus)';
}
