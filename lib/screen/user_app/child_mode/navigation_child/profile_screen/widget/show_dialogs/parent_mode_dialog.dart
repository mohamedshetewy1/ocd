import 'package:flutter/material.dart';
import 'package:ocdear/components/custom_text_field.dart';
import 'package:ocdear/components/main_button.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/nav_parent.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

void changeParentModeDialog(BuildContext context, {Function()? function}) {
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
              "التغيير إلى وضع الوالدين",
              style: AppTextStyle.textStyle16w500,
            ),
            SizedBox(
              height: 70,
              child: CustomTextField(
                text: "أدخل كلمة المرور",
                suffixIcon: Icons.visibility,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 47,
              child: MainButton(
                text: "تغيير",
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavParent(),
                    ),
                  );
                },
                buttonColor: AppColors.normalActive,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
