import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ocdear/screen/user_app/child_mode/navigation_child/game_screen/games_model.dart';

class GameService {
  final String apiUrl = "http://10.0.2.2:8000/api/gamestwoos";

  Future<List<GameModel>> fetchGames() async {
    final response = await http.get(Uri.parse("apiUrl"));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<GameModel> games =
          body.map((dynamic item) => GameModel.fromJson(item)).toList();
      return games;
    } else {
      throw Exception('Failed to load games');
    }
  }
}
