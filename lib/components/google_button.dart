import 'package:flutter/material.dart';
import 'package:ocdear/utils/colors.dart';

class ButtonWithGoogle extends StatelessWidget {
  const ButtonWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.greyColor,
        ),
      ),
      child: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Google Logos.png"),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "تسجيل الدخول بإستخدام جوجل",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: "ReadexPro",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
