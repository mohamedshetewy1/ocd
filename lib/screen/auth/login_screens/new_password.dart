import 'package:flutter/material.dart';
import 'package:ocdear/components/main_button.dart';
import 'package:ocdear/components/main_logo.dart';
import 'package:ocdear/components/password_field.dart';
import 'package:ocdear/screen/intro/questions_screens/questions.dart';

import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool isPasswordSecure = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const MainLogo(),
                  const Text("كتابة كلمة المرور الجديدة",
                      textAlign: TextAlign.start,
                      style: AppTextStyle.textStyleNormal20),
                  const SizedBox(height: 14),
                  const Text("يجب ان تكون كلمة المرور مختلفه",
                      textAlign: TextAlign.start,
                      style: AppTextStyle.textStyleBlack14),
                  const SizedBox(height: 20),
                  PasswordFormField(
                    controller: passwordController,
                    text: "كلمة المرور الجديدة",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    type: TextInputType.visiblePassword,
                    action: TextInputAction.next,
                  ),
                  const SizedBox(height: 20),
                  PasswordFormField(
                    controller: confirmPasswordController,
                    text: "تأكيد كلمة المرور",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value != passwordController.text) {
                        return "Passwords don't match";
                      }
                      return null;
                    },
                    type: TextInputType.visiblePassword,
                    action: TextInputAction.done,
                  ),
                  const SizedBox(height: 60),
                  MainButton(
                    function: () {
                      if (formKey.currentState?.validate() ?? false) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Questions(),
                          ),
                        );
                      }
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
      ),
    );
  }
}
