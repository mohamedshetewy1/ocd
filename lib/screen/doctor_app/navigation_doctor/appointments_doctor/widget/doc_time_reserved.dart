import 'package:flutter/material.dart';
import 'package:ocdear/utils/text_style.dart';

class CustomDoctorTimeReserved extends StatelessWidget {
  const CustomDoctorTimeReserved({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 247, 226, 226),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(255, 124, 123, 123)),
      ),
      child: const Center(
        child: Text(
          "02:00 pm",
          style: AppTextStyle.textStyleGrey14,
        ),
      ),
    );
  }
}
