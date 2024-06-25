import 'package:flutter/material.dart';
import 'package:ocdear/components/custom_text_field.dart';
import 'package:ocdear/components/google_button.dart';
import 'package:ocdear/components/main_button.dart';
import 'package:ocdear/components/main_logo.dart';
import 'package:ocdear/components/password_field.dart';
import 'package:ocdear/screen/doctor_app/auth/login_screens/forget_password.dart';
import 'package:ocdear/screen/doctor_app/auth/sign_up_screen/sign_up_screen.dart';
import 'package:ocdear/screen/doctor_app/navigation_doctor/nav_doctor.dart';

import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';
import 'package:ocdear/utils/validator.dart';

class LoginScreenDoctors extends StatefulWidget {
  const LoginScreenDoctors({super.key});

  @override
  State<LoginScreenDoctors> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenDoctors> {
  bool isPasswordSecure = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const MainLogo(),
                const Text(
                  " ! مرحبا بعودتك ",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.normalActive,
                    fontFamily: "ReadexPro",
                  ),
                ),
                const SizedBox(height: 14),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "OCDEAR",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.normalActive,
                        fontFamily: "ReadexPro",
                      ),
                    ),
                    Text("اهلا بيك في تطبيقنا ",
                        textAlign: TextAlign.end,
                        style: AppTextStyle.textStyleBlack14),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  text: "رقم الهاتف او الإيميل",
                  validator: (value) => Validator.validateEmail(value),
                  type: TextInputType.emailAddress,
                  action: TextInputAction.next,
                ),
                PasswordFormField(
                  text: "كلمة المرور",
                  validator: (value) => Validator.validatePassword(value!),
                  type: TextInputType.visiblePassword,
                  action: TextInputAction.done,
                ),
                const SizedBox(height: 14),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgetPasswordDoctor(),
                      ),
                    );
                  },
                  child: const Text(
                    "هل نسيت كلمة المرور ؟",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.normalActive,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: "ReadexPro"),
                  ),
                ),
                const SizedBox(height: 40),
                MainButton(
                  text: "تسجيل الدخول",
                  buttonColor: AppColors.normalActive,
                  textColor: Colors.white,
                  function: () {
                    if (formKey.currentState?.validate() ?? false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NavDoctor(),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "او",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyColor,
                        fontFamily: "ReadexPro",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const ButtonWithGoogle(),
                const SizedBox(height: 20),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "ليس لديك حساب ؟ ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "ReadexPro",
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (_) => const SignUpScreenDoctor(),
                          ));
                        },
                        child: const Text(
                          "انشاء حساب",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.normalActive,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "ReadexPro",
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
