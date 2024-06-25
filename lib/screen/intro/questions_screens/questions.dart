import 'package:flutter/material.dart';
import 'package:ocdear/components/main_logo.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/nav_child.dart';
import 'package:ocdear/screen/intro/questions_screens/widgets/quiz_screen.dart';
import 'package:ocdear/utils/colors.dart';

import 'package:ocdear/utils/text_style.dart';

class Questions extends StatelessWidget {
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.normalActive,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const NavChild()),
                  (route) => false,
                );
              },
              child: const Text(
                "تخطي",
                style: TextStyle(
                  color: AppColors.normalActive,
                  fontFamily: "ReadexPro",
                ),
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MainLogo(),
                Text("الاسئلة",
                    textAlign: TextAlign.start,
                    style: AppTextStyle.textStyleNormal20),
                SizedBox(height: 14),
                Text("برجاء اختيار إجابه واحدة فقط",
                    textAlign: TextAlign.start,
                    style: AppTextStyle.textStyleBlack14),
                SizedBox(height: 20),
                QuizScreen(),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
