import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ocdear/screen/doctor_app/navigation_doctor/appointments_doctor/widget/doc_time_available.dart';
import 'package:ocdear/screen/doctor_app/navigation_doctor/appointments_doctor/widget/doc_time_reserved.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/doctors_screen/reservation/widget/calendar.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class OppointmentClinic extends StatelessWidget {
  const OppointmentClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Gap(30),
        CalendarView(),
        Gap(20),
        Padding(
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
        Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomDoctorTimeReserved(),
            CustomDoctorTimeAvailable(),
            CustomDoctorTimeAvailable()
          ],
        ),
        Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomDoctorTimeAvailable(),
            CustomDoctorTimeReserved(),
            CustomDoctorTimeReserved()
          ],
        ),
        Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text(
                  "لم تتم ",
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
                  "تمت",
                  style: AppTextStyle.textStyleBlack14,
                ),
                Gap(5),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 6,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
