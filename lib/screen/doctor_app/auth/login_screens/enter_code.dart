import 'package:flutter/material.dart';
import 'package:ocdear/components/custom_text_field.dart';
import 'package:ocdear/components/main_button.dart';
import 'package:ocdear/screen/auth/login_screens/new_password.dart';

import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class EnterCodeDoctor extends StatefulWidget {
  const EnterCodeDoctor({super.key});

  @override
  State<EnterCodeDoctor> createState() => _EnterCodeState();
}

class _EnterCodeState extends State<EnterCodeDoctor> {
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
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/ocd logo.png",
                      ),
                      scale: 1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("ادخل الرمز",
                    textAlign: TextAlign.start,
                    style: AppTextStyle.textStyleNormal20),
                const SizedBox(height: 14),
                const Row(
                  children: [
                    Text("الرجاء ادخال الرمز المكون من",
                        textAlign: TextAlign.start,
                        style: AppTextStyle.textStyleBlack17),
                    Text(
                      "٤ ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.normalActive),
                    ),
                    Text("ارقام",
                        textAlign: TextAlign.start,
                        style: AppTextStyle.textStyleBlack17),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 22),
                        child: CustomTextField(
                          text: "_",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 22),
                        child: CustomTextField(
                          text: "_",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 22),
                        child: CustomTextField(
                          text: "_",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 22),
                        child: CustomTextField(
                          text: "_",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                MainButton(
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewPassword(),
                        ));
                  },
                  text: "التحقق من الرمز",
                  buttonColor: AppColors.normalActive,
                  textColor: Colors.white,
                ),
                const SizedBox(height: 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "اعادة ارسال ",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.normalActive,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "الكود في غضون .. : ٢٣",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
