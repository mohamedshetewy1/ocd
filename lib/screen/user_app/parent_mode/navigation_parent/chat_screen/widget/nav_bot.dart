import 'package:flutter/material.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/chat_screen/chatbot/ui/chatbot_screen.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/chat_screen/chatbot/web_services/chatbot_api.dart';
import 'package:ocdear/utils/text_style.dart';

class NavToChatBot extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subtitle;
  final ChatBot chatBot;

  const NavToChatBot({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.chatBot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatBotScreen(
              chatBot: chatBot,
            ),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 27,
          backgroundImage: AssetImage(image!),
        ),
        title: Text(
          title!,
          style: AppTextStyle.textStyleBlack14,
        ),
        subtitle: Text(
          subtitle!,
          style: AppTextStyle.textStyleGrey14,
        ),
        trailing: const Text('07:00 Am'),
      ),
    );
  }
}
