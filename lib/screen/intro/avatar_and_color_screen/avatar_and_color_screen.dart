import 'package:flutter/material.dart';
import 'package:ocdear/components/custom_avatar.dart';
import 'package:ocdear/components/main_button.dart';
import 'package:ocdear/components/main_logo.dart';
import 'package:ocdear/components/pick_app_theme.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/nav_child.dart';

import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({super.key});

  @override
  State<AvatarScreen> createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const MainLogo(),
                const Text("اختار الصوره الرمزيه الخاصه بك",
                    textAlign: TextAlign.start,
                    style: AppTextStyle.textStyleNormal20),
                const SizedBox(height: 14),
                const Text("اختار الصوره الرمزيه واترك العنان لخيالك !",
                    textAlign: TextAlign.start,
                    style: AppTextStyle.textStyleBlack14),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CustomAvatar(image: "assets/images/avatar/boy.png"),
                    CustomAvatar(image: "assets/images/avatar/girl.png"),
                  ],
                ),
                const SizedBox(height: 60),
                const Text(
                  "تغيير لون التطبيق",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.normalActive,
                      fontFamily: "ReadexPro"),
                ),
                const SizedBox(height: 14),
                const Text(
                  "اختار الالوان الخاصه بك واجلب خيالك إلى الحياة !",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                      fontFamily: "ReadexPro"),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    PickTheme(
                      color: AppColors.normalActive,
                    ),
                    PickTheme(
                      color: AppColors.blue,
                    ),
                    PickTheme(
                      color: AppColors.purple,
                    ),
                    PickTheme(
                      color: AppColors.pink,
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                MainButton(
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavChild(),
                        ));
                  },
                  text: "تأكيد",
                  buttonColor: AppColors.normalActive,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
