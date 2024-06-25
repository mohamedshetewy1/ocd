import 'package:flutter/material.dart';
import 'package:ocdear/utils/text_style.dart';

class WelcomeParent extends StatelessWidget {
  const WelcomeParent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                " مرحبا بعودتك",
                style: AppTextStyle.textStyleNormal20,
              ),
              Text(
                " تابع مراحل تقدم طفلك وشعوره اليومي",
                style: AppTextStyle.textStyleBlack17,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
