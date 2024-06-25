import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SubmitQuesButton extends StatelessWidget {
  String text;
  Color? buttonColor;
  Color? textColor;
  void Function()? function;
  Color activeColor;

  SubmitQuesButton(
      {super.key,
      required this.text,
      this.buttonColor,
      this.textColor,
      required this.function,
      required this.activeColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: activeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: textColor,
            fontFamily: "ReadexPro",
          ),
        ),
      ),
    );
  }
}
