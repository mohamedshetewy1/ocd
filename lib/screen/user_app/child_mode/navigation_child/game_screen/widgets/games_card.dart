import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/game_screen/widgets/game_page.dart';
import 'package:ocdear/utils/text_style.dart';

class GamesCard extends StatelessWidget {
  final String? image;
  const GamesCard({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const GamePage(),
                  ),
                );
              },
              child: Container(
                width: 320,
                height: 370,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    const Gap(5),
                    Container(
                      width: 350,
                      height: 200,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/home/game card.png"),
                              fit: BoxFit.fill)),
                    ),
                    const Gap(5),
                    Container(
                      width: 350,
                      height: 155,
                      decoration: const BoxDecoration(),
                      child: const Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("إسم اللعبة",
                                  style: AppTextStyle.textStyleNormal17),
                              SizedBox(height: 14),
                              Expanded(
                                child: Text(
                                    "بدءًا من المغامرات المثيرة في عوالم ملونة وحتى الألغاز المثيرة للعقل والتحديات التعليمية، تقدم ألعابنا مجموعة متنوعة من التجارب التي تلبي الاهتمامات وأساليب التعلم المختلفة. يمكن للأطفال الشروع في مهام مثيرة، وحل الألغاز، وإطلاق العنان لمواهبهم الفنية، وحتى تعلم مهارات جديدة على طول الطريق.",
                                    style: AppTextStyle.textStyleGrey12),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
