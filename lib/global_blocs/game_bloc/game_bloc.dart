import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.initial()) {
    on<GameEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<FetchGamesEvent>((event, emit) async {
      emit(state.copyWith(gameStatus: GameStatus.loading));
      List<int> games = [1, 2, 3, 4, 5, 6, 7, 8];
      // TODO: Change  for data fetching:
      await Future.delayed(const Duration(seconds: 2)).then((_) {
        emit(
          state.copyWith(gameStatus: GameStatus.loaded, games: games),
        );
      });
    });
  }
}
