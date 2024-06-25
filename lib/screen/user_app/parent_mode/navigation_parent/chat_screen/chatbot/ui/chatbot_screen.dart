import 'package:flutter/material.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/chat_screen/chatbot/web_services/chatbot_api.dart';
import 'package:ocdear/utils/colors.dart';

class ChatBotScreen extends StatefulWidget {
  final ChatBot chatBot;

  ChatBotScreen({required this.chatBot});

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(String message) {
    if (message.isEmpty) return;

    setState(() {
      _messages.add({'user': message});
      // Replace with your logic for getting bot responses
      String response = widget.chatBot.getResponse(message);
      _messages.add({'bot': response});
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              SizedBox(
                height: 56,
                width: 56,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/ai_chat.png",
                  ),
                ),
              ),
              Text('ChatBot'),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.normalActive,
          ),
        ),
        actions: const [
          Icon(Icons.menu),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  var message = _messages[index];
                  if (message.containsKey('user')) {
                    return Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.only(
                                  left: 50.0, top: 5.0, bottom: 5.0),
                              decoration: BoxDecoration(
                                color: AppColors.light,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Text(
                                message['user']!,
                                style: const TextStyle(
                                    color: AppColors.normalActive),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/avatar/girl.png'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/ai_chat.png'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.only(
                                  right: 50.0, top: 5.0, bottom: 5.0),
                              decoration: BoxDecoration(
                                color: AppColors.normalActive,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Text(
                                message['bot']!,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Enter your message...',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: AppColors.normalActive),
                    onPressed: () => _sendMessage(_controller.text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
