import 'package:flutter/material.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/game_screen/widgets/games_card.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/widget/slider_home.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/widget/content_description.dart';
import 'package:ocdear/utils/text_style.dart';

class GamesHome extends StatelessWidget {
  const GamesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'الألعاب',
              style: AppTextStyle.textStyleNormal20,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.white,
        body: const SingleChildScrollView(
          child: Column(
            children: [
              SliderHomePage(),
              SizedBox(
                height: 32,
              ),
              ContentDescription(description: "مغامرة الوسواس القهري"),
              SizedBox(height: 10),
              GamesCard(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
