import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/chat_screen/chatbot/web_services/chatbot_api.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/chat_screen/widget/nav_bot.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/doctors_screen/widget/search_field.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/nav_parent.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatBot chatBot;
  bool _isChatBotLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadChatBot();
  }

  Future<void> _loadChatBot() async {
    chatBot = await ChatBot.loadIntents('assets/intents.json');
    setState(() {
      _isChatBotLoaded = true;
    }); // Update the state to reflect the loaded chatbot
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 85),
          child: Text(
            ' المحادثات',
            style: AppTextStyle.textStyleNormal20,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NavParent(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.normalActive,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          const SearchField(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .7,
            child: _isChatBotLoaded
                ? ListView.separated(
                    itemCount: 1,
                    separatorBuilder: (context, index) => const Gap(10),
                    itemBuilder: (context, index) => NavToChatBot(
                      image: "assets/images/ai_chat.png",
                      title: "AI ChatBot",
                      subtitle: "AI Chatbot ابدأ المحادثة مع ",
                      chatBot: chatBot,
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ]),
      ),
    );
  }
}
