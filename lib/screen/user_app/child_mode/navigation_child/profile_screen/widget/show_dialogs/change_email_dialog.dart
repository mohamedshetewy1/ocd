import 'package:flutter/material.dart';
import 'package:ocdear/components/custom_text_field.dart';
import 'package:ocdear/components/main_button.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

void changeEmailDialog(BuildContext context, {Function()? function}) {
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
              "تغيير البريد الإلكتروني",
              style: AppTextStyle.textStyle16w500,
            ),
            SizedBox(
              height: 70,
              child: CustomTextField(
                text: "البريد الالكتروني الجديد",
                suffixIcon: Icons.email,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 47,
              child: MainButton(
                text: "تغيير",
                function: function ??
                    () {
                      Navigator.of(context).pop();
                      emailChangedDialog(context);
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

void emailChangedDialog(BuildContext context, {Function()? function}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
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
            Container(
              width: 135,
              height: 135,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.normalActive,
              ),
              child: const Icon(
                Icons.check,
                size: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "! تهانينا",
              style: AppTextStyle.textStyle22,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "تم تغيير البريد الإلكتروني بنجاح",
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleGrey14,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              height: 47,
              child: MainButton(
                text: "رجوع",
                function: () {
                  Navigator.of(context).pop();
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
