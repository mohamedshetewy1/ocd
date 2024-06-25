import 'package:flutter/material.dart';
import 'package:ocdear/utils/text_style.dart';

class WelcomeChild extends StatelessWidget {
  const WelcomeChild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(60))),
                height: 60,
                width: 60,
              ),
              const Positioned.fill(
                right: 0,
                top: 5,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage('assets/images/home/Ellipse 69.png'),
                ),
              )
            ],
          ),
          const Directionality(
            textDirection: TextDirection.rtl,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "اهلا مستخدم",
                style: AppTextStyle.textStyleNormal20,
              ),
              Text(
                "اهلا بك في تطبيقك المفضل",
                style: AppTextStyle.textStyleBlack17,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
