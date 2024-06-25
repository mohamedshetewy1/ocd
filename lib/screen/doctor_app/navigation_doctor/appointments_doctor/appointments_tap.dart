import 'package:flutter/material.dart';
import 'package:ocdear/screen/doctor_app/navigation_doctor/appointments_doctor/appointments_clinic.dart';
import 'package:ocdear/screen/doctor_app/navigation_doctor/appointments_doctor/appointments_online.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class AppointmentsOnLineDoctor extends StatelessWidget {
  const AppointmentsOnLineDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            ' تحديد الموعد',
            style: AppTextStyle.textStyleNormal20,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.normalActive,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(indicatorColor: AppColors.normalActive, tabs: [
            Tab(
              child: Text(
                "العيادة",
                style: AppTextStyle.textStyleBlack17,
              ),
            ),
            Tab(
              child: Text(
                "عبر الانترنت",
                style: AppTextStyle.textStyleBlack17,
              ),
            ),
          ]),
        ),
        body: const TabBarView(
          children: [
            OppointmentClinic(),
            OppointmentOnline(),
          ],
        ),
      ),
    );
  }
}
