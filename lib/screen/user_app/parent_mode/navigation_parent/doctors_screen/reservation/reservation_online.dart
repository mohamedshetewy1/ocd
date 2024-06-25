import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/doctors_screen/reservation/payment.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/doctors_screen/reservation/widget/calendar.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/doctors_screen/reservation/widget/time_available.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/doctors_screen/reservation/widget/time_reserved.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class ReservationOnLine extends StatelessWidget {
  const ReservationOnLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(30),
        const CalendarView(),
        const Gap(20),
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Text(
                  "الاثنين",
                  style: AppTextStyle.textStyleBlackBold16,
                ),
              ],
            ),
          ),
        ),
        const Gap(20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTimeReserved(),
            CustomTimeAvailable(),
            CustomTimeAvailable()
          ],
        ),
        const Gap(20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTimeAvailable(),
            CustomTimeReserved(),
            CustomTimeReserved()
          ],
        ),
        const Gap(20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text(
                  "متاح ",
                  style: AppTextStyle.textStyleBlack14,
                ),
                Gap(5),
                CircleAvatar(
                  backgroundColor: AppColors.lightActive,
                  radius: 6,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "محجوزة",
                  style: AppTextStyle.textStyleBlack14,
                ),
                Gap(5),
                CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  radius: 6,
                ),
              ],
            ),
          ],
        ),
        const Gap(40),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PaymentMethods(),
              ),
            );
          },
          child: Container(
            width: 350,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.dark,
            ),
            child: const Center(
              child: Text(
                "إستمرار ",
                style: AppTextStyle.textStyleMain20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
