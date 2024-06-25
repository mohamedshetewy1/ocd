import 'package:flutter/material.dart';
import 'package:ocdear/screen/auth/login_screens/login_screen.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

void logoutDialog(BuildContext context, {Function()? function}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 236,
        width: 328,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "تسجيل الخروج",
              style: AppTextStyle.textStyle16w500,
            ),
            const Text(
              '''هل تريد تسجيل الخروج ؟ إذا كان لديك أي أسئلة أو استفسارات في المستقبل، فلا تتردد في العودة وطرحها.''',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: "ReadexPro",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 47,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "الغاء",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'ReadexPro',
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )),
                ),
                const SizedBox(width: 16),
                Container(
                  height: 47,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.normalActive),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "تسجيل الخروج",
                        style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'ReadexPro',
                            fontWeight: FontWeight.w500,
                            color: AppColors.normalActive),
                      )),
                ),
                const Spacer()
              ],
            )
          ],
        ),
      ),
    ),
  );
}
