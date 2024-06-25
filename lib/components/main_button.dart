import 'package:flutter/material.dart';
import 'package:ocdear/utils/text_style.dart';

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  String text;
  Color? buttonColor;
  Color? textColor;
  void Function()? function;

  MainButton({
    super.key,
    required this.text,
    this.buttonColor,
    this.textColor,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: function,
        child: Text(text, style: AppTextStyle.textStyleMain20),
      ),
    );
  }
}
