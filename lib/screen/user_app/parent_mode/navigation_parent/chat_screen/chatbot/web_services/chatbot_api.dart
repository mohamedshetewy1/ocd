import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/chat_screen/chatbot/models/intent_model.dart';

class ChatBot {
  final List<Intent> intents;

  ChatBot({required this.intents});

  factory ChatBot.fromJson(Map<String, dynamic> json) {
    var intentsList = json['intents'] as List;
    List<Intent> intents = intentsList.map((i) => Intent.fromJson(i)).toList();
    return ChatBot(intents: intents);
  }

  static Future<ChatBot> loadIntents(String path) async {
    String jsonString = await rootBundle.loadString(path);
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    return ChatBot.fromJson(jsonMap);
  }

  String getResponse(String input) {
    for (var intent in intents) {
      if (intent.patterns.any(
          (pattern) => input.toLowerCase().contains(pattern.toLowerCase()))) {
        return intent.responses.first;
      }
    }
    return 'عذرا، لا أفهم السؤال. حاول مرة أخرى.';
  }
}
