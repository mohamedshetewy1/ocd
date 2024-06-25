import 'package:flutter/material.dart';
import 'package:ocdear/components/main_button.dart';
import 'package:ocdear/screen/intro/avatar_and_color_screen/avatar_and_color_screen.dart';
import 'package:ocdear/utils/colors.dart';

class ResultPage extends StatelessWidget {
  final String resultText;
  final String endResult;

  const ResultPage(
      {super.key, required this.endResult, required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: 227,
                  width: 360,
                  child: Image.asset("assets/images/survey_result.png"),
                ),
                Text(
                  endResult,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    resultText,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.greyColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 60),
                MainButton(
                  text: "لنبدأ رحلتنا",
                  textColor: Colors.white,
                  buttonColor: AppColors.normalActive,
                  function: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AvatarScreen()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
