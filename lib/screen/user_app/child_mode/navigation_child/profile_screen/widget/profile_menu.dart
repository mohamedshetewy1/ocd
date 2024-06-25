import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ocdear/utils/text_style.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    this.text,
    this.icon,
    this.press,
    this.color,
    this.withDivider,
  });
  final String? text, icon;
  final Color? color;
  final bool? withDivider;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: TextButton(
            onPressed: press,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(children: [
                SvgPicture.asset(
                  icon!,
                  width: 25,
                  height: 25,
                  color: color,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  text!,
                  style: AppTextStyle.textStyleBlack14,
                ),
              ]),
            ),
          ),
        ),
        Visibility(
          visible: withDivider ?? false,
          child: const Divider(
            indent: 30,
            endIndent: 30,
          ),
        )
      ],
    );
  }
}
