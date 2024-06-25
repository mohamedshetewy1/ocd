import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/chat_screen/widget/custom_card_chat.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/doctors_screen/widget/search_field.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/nav_parent.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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
            child: ListView.separated(
              itemCount: 20,
              // physics: const NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              separatorBuilder: (context, index) => const Gap(10),
              itemBuilder: (context, index) => const CustomCardChat(
                image: "assets/images/ai_chat.png",
                title: "AI Chat",
                subtitle: " ......اهلا دكتورة سارة محتاجه حضرتك ",
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
