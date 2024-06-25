import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAvatar extends StatelessWidget {
  String image;
  CustomAvatar({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 137,
        width: 137,
        child: CircleAvatar(
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
