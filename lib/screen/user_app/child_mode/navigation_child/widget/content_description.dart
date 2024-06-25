import 'package:flutter/material.dart';
import 'package:ocdear/utils/text_style.dart';

class ContentDescription extends StatelessWidget {
  final String? description;
  const ContentDescription({
    super.key,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(right: 18),
        child: Row(
          children: [
            Text(
              description!,
              style: AppTextStyle.textStyle22,
            ),
          ],
        ),
      ),
    );
  }
}
