import 'package:flutter/material.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

// ignore: must_be_immutable
class PasswordFormField extends StatefulWidget {
  IconData? icon;
  String? text;
  TextEditingController? controller;
  TextInputType? type;
  TextInputAction? action;
  String? Function(String?)? validator;

  PasswordFormField(
      {super.key,
      this.validator,
      this.icon,
      this.text,
      this.controller,
      this.action,
      this.type});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isPasswordSecure = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: TextFormField(
          obscureText: isPasswordSecure,
          validator: widget.validator,
          controller: widget.controller,
          keyboardType: widget.type,
          textInputAction: widget.action,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: widget.text,
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
            suffixIcon: togglePassword(),
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
        onPressed: () {
          isPasswordSecure = !isPasswordSecure;
          setState(() {});
        },
        icon: isPasswordSecure
            ? const Icon(
                Icons.visibility,
                color: Colors.grey,
              )
            : const Icon(
                Icons.visibility_off,
                color: Colors.grey,
              ));
  }
}
