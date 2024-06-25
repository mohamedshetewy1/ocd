import 'package:flutter/material.dart';
import 'package:ocdear/components/main_button.dart';
import 'package:ocdear/components/password_field.dart';
import 'package:ocdear/screen/auth/login_screens/forget_password.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class ChangePasswordDialog extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const ChangePasswordDialog({
    required this.formKey,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 334,
        width: 328,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "تغيير كلمة المرور",
              style: AppTextStyle.textStyle16w500,
            ),
            SizedBox(
              height: 70,
              child: PasswordFormField(
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
            ),
            SizedBox(
              height: 70,
              child: PasswordFormField(
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
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgetPassword(),
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
                  fontFamily: "ReadexPro",
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 47,
              child: MainButton(
                text: "تغيير",
                function: () {
                  if (formKey.currentState?.validate() ?? false) {
                    Navigator.pop(context);
                  }
                },
                buttonColor: AppColors.normalActive,
              ),
            )
          ],
        ),
      ),
    );
  }
}
