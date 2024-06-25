import 'package:flutter/material.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/doctors_screen/list_doctors/list_doctors.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

// ignore: must_be_immutable
class DoctorsBar extends StatelessWidget {
  String? title;
  DoctorsBar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title!,
              style: AppTextStyle.textStyle22,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const ListDoctors(),
                ));
              },
              child: const Text(
                'عرض المزيد',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.normalActive,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
