import 'package:flutter/material.dart';
import 'package:ocdear/utils/text_style.dart';

class CustomTimeReserved extends StatelessWidget {
  const CustomTimeReserved({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 247, 226, 226),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.red),
      ),
      child: const Center(
        child: Text(
          "02:00 pm",
          style: AppTextStyle.textStylerRed14,
        ),
      ),
    );
  }
}
