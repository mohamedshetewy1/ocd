import 'package:flutter/material.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  IconData? suffixIcon;

  String? text, icon;
  TextEditingController? controller;
  TextInputType? type;
  TextInputAction? action;
  String? Function(String?)? validator;

  CustomTextField(
      {super.key,
      this.validator,
      this.suffixIcon,
      this.text,
      this.controller,
      this.action,
      this.type});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: TextFormField(
          validator: validator,
          controller: controller,
          keyboardType: type,
          textInputAction: action,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: text,
            labelStyle: AppTextStyle.textStyleGrey14,
            hintStyle: AppTextStyle.textStyleGrey14,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.greyColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.greyColor),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.greyColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.greyColor),
            ),
            suffixIcon: Icon(
              suffixIcon,
              color: AppColors.greyColor,
            ),
          ),
        ),
      ),
    );
  }
}
