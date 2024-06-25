import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class SliderParent extends StatefulWidget {
  const SliderParent({super.key});

  @override
  State<SliderParent> createState() => _SliderHomePageState();
}

class _SliderHomePageState extends State<SliderParent> {
  List<SliderModel> imageList = [
    SliderModel("1", "assets/images/slider_parent/mother.png",
        "تابع التقدم الذي يصل إليه طفلك و متابعة شعوره اليومي والتحدث إلي الاطباء المتخصصون في تشخيص حالة طفلك."),
    SliderModel("2", "assets/images/slider_parent/mother.png",
        "تابع التقدم الذي يصل إليه طفلك و متابعة شعوره اليومي والتحدث إلي الاطباء المتخصصون في تشخيص حالة طفلك."),
    SliderModel("3", "assets/images/slider_parent/mother.png",
        "تابع التقدم الذي يصل إليه طفلك و متابعة شعوره اليومي والتحدث إلي الاطباء المتخصصون في تشخيص حالة طفلك."),
    SliderModel("4", "assets/images/slider_parent/mother.png",
        "تابع التقدم الذي يصل إليه طفلك و متابعة شعوره اليومي والتحدث إلي الاطباء المتخصصون في تشخيص حالة طفلك."),
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            height: 165,
            child: CarouselSlider(
              items: imageList
                  .map((item) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.lightHover),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 160,
                                    height: 150,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/slider_parent/Vector.png"),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: SizedBox(
                                        width: 160,
                                        height: 150,
                                        child: Center(
                                          child: Text(
                                            item.text,
                                            style:
                                                AppTextStyle.textStyleBlack14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 35,
                              child: Image(
                                image: AssetImage(item.image),
                              ),
                            )
                          ],
                        ),
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
              width: currentIndex == entry.key ? 30 : 7,
              height: 7.0,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
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
