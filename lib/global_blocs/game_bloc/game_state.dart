part of 'game_bloc.dart';

enum GamesStatus {
  initial,
  loading,
  loaded,
}

class GameState extends Equatable {
  final GamesStatus gameStatus;
  //TODO: Change after game base added to List<Games>
  final List<int> games;

  const GameState({
    required this.gameStatus,
    required this.games,
  });

  factory GameState.initial() {
    return const GameState(
      gameStatus: GamesStatus.initial,
      games: [],
    );
  }

  @override
  List<Object> get props => [gameStatus, games];

  GameState copyWith({
    GamesStatus? gameStatus,
    List<int>? games,
  }) {
    return GameState(
      gameStatus: gameStatus ?? this.gameStatus,
      games: games ?? this.games,
    );
  }

  @override
  String toString() => 'GameState(gameStatus: $gameStatus, games: $games)';
}
