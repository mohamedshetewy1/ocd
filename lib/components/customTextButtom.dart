import 'package:flutter/material.dart';
import 'package:ocdear/utils/colors.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  String text;
  Color? buttonColor;
  Color? textColor;
  Color? borderColor;
  void Function()? function;

  CustomTextButton({
    super.key,
    required this.text,
    this.buttonColor,
    this.textColor,
    this.borderColor,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20,
              fontFamily: 'ReadexPro',
              fontWeight: FontWeight.w500,
              color: AppColors.normalActive),
        ),
      ),
    );
  }
}
