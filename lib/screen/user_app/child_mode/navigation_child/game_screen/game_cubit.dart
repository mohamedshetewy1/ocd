import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/game_screen/game_serves.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/game_screen/games_model.dart';

class GameCubit extends Cubit<List<GameModel>> {
  final GameService _gameService;

  GameCubit(this._gameService) : super([]);

  void fetchGames() async {
    try {
      final games = await _gameService.fetchGames();
      emit(games);
    } catch (e) {
      print(e);
    }
  }
}
