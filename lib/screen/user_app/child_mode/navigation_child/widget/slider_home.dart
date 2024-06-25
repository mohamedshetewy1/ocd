import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class SliderHomePage extends StatefulWidget {
  const SliderHomePage({super.key});

  @override
  State<SliderHomePage> createState() => _SliderHomePageState();
}

class _SliderHomePageState extends State<SliderHomePage> {
  List<SliderModel> imageList = [
    SliderModel("1", "assets/images/home/slider/S_1.png",
        "اضطراب الوسواس القهري لدى الأطفال هو حالة قد يواجهون فيها أفكارًا أو مخاوف غير مرغوب فيها ويشعرون بأنهم مجبرون على أداء سلوكيات أو طقوس متكررة للتخفيف من قلقهم."),
    SliderModel("2", "assets/images/home/slider/S_2.png",
        "مجموعة الفيديوهات تسلط الضوء على الوسواس القهري وتقدم معلومات قيمة واستراتيجيات فعالة لمساعدة الأشخاص على فهم ومواجهة هذا الاضطراب النفسي."),
    SliderModel("3", "assets/images/home/slider/S_3.png",
        "الألعاب المصممة خصيصًا للأطفال المصابين بالوسواس القهري توفر تجربة تفاعلية ممتعة ومساعدة للأطفال في فهم الوسواس القهري وتعلم استراتيجيات للتعامل معه بطرق إيجابية ومرحة."),
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: () {
          // print(currentIndex);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.lightHover),
            child: CarouselSlider(
              items: imageList
                  .map((item) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: SizedBox(
                              width: 200,
                              height: 140,
                              child: Text(
                                item.text,
                                style: AppTextStyle.textStyleBlack14,
                              ),
                            ),
                          ),
                          Container(
                            width: 130,
                            height: 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(item.image)),
                            ),
                          ),
                        ],
                      ))
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                autoPlayInterval: const Duration(seconds: 10),
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 4),
                scrollPhysics: const BouncingScrollPhysics(),
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => carouselController.animateToPage(entry.key),
            child: Container(
              width: currentIndex == entry.key ? 17 : 7,
              height: 7.0,
              margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: AppColors.dark,
                  ),
                  color: currentIndex == entry.key
                      ? AppColors.dark
                      : AppColors.lightHover),
            ),
          );
        }).toList(),
      )
    ]);
  }
}

class SliderModel {
  final String text;
  final String image;
  final String id;
  SliderModel(this.id, this.image, this.text);
}
