import 'package:flutter/material.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/doctors_screen/chat_doctors/chat_doctor.dart';
import 'package:ocdear/utils/text_style.dart';

class CustomCardChat extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subtitle;

  const CustomCardChat(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ChatDoctors(),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 27,
          backgroundImage: AssetImage(image!),
        ),
        title: Text(
          title!,
          style: AppTextStyle.textStyleBlack14,
        ),
        subtitle: Text(
          subtitle!,
          style: AppTextStyle.textStyleGrey14,
        ),
        trailing: const Text('07:00 Am'),
      ),
    );
  }
}
