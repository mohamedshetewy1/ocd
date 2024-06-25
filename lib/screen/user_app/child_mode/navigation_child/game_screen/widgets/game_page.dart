import 'package:flutter/material.dart';
import 'package:ocdear/components/main_button.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 296,
              width: double.infinity,
              child: Image.asset(
                "assets/images/Game page.png",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image(
                        image: AssetImage("assets/images/home/starRate.png"),
                      ),
                      Spacer(),
                      Text(
                        "اسم اللعبة",
                        style: AppTextStyle.textStyleBold18,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "الوصف",
                    style: AppTextStyle.textStyleBlackBold16,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '''لعبة الوسواس القهري هي تجربة تفاعلية وجذابة
        مصممة لمساعدة الأطفال على فهم وإدارة اضطراب
        الوسواس القهري بطريقة ممتعة وداعمة.''',
                    style: AppTextStyle.textStyleGrey14,
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "بعض الصور من اللعبة",
                    style: AppTextStyle.textStyleBlackBold16,
                  ),
                  const SizedBox(height: 15),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage("assets/images/home/game (1).png"),
                      ),
                      Image(
                        image: AssetImage("assets/images/home/game (2).png"),
                      ),
                      Image(
                        image: AssetImage("assets/images/home/game (3).png"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: MainButton(
                        text: "العب الأن",
                        function: () {},
                        textColor: Colors.white,
                        buttonColor: AppColors.normalActive,
                      ),
                    ),
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
