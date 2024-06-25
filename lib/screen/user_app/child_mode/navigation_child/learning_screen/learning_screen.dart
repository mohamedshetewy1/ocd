import 'package:flutter/material.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/widget/slider_home.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/widget/content_description.dart';
import 'package:ocdear/utils/text_style.dart';

import 'widgets/video_card.dart';

class LearningTab extends StatelessWidget {
  const LearningTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'التعلم',
              style: AppTextStyle.textStyleNormal20,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              SliderHomePage(),
              SizedBox(
                height: 32,
              ),
              ContentDescription(description: "شرح الوسواس القهري"),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    VideoCard(),
                    VideoCard(),
                    VideoCard(),
                    VideoCard(),
                    VideoCard(),
                    VideoCard()
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ContentDescription(description: "التغلب علي الوسواس القهري"),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    VideoCard(),
                    VideoCard(),
                    VideoCard(),
                    VideoCard(),
                    VideoCard(),
                    VideoCard()
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ContentDescription(description: "فهم الوسواس القهري"),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    VideoCard(),
                    VideoCard(),
                    VideoCard(),
                    VideoCard(),
                    VideoCard(),
                    VideoCard()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
