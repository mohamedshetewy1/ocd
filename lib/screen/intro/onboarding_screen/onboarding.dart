import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ocdear/screen/intro/onboarding_screen/doctor_or_parent.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/screen/intro/onboarding_screen/contents_model.dart';
import 'package:ocdear/utils/text_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

bool lastPage = false;
PageController pageController = PageController();

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFe6f9ef),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            buildAppBar(),
            Expanded(
              child: PageView.builder(
                itemCount: contents.length,
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    lastPage = value == 2;
                  });
                },
                itemBuilder: (_, i) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          contents[i].image!,
                          height: 200,
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.7,
                              width: MediaQuery.sizeOf(context).width,
                              child: Image.asset(
                                contents[i].image2!,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              top: 150,
                              right: 10,
                              left: 10,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 35, vertical: 20),
                                child: Column(
                                  children: [
                                    Center(
                                      child: SmoothPageIndicator(
                                        controller: pageController,
                                        count: contents.length,
                                        effect: const ExpandingDotsEffect(
                                            dotWidth: 10,
                                            dotHeight: 13,
                                            activeDotColor: AppColors.dark,
                                            dotColor: AppColors.lightHover,
                                            spacing: 16),
                                        onDotClicked: (index) {
                                          pageController.animateToPage(index,
                                              duration: const Duration(
                                                  milliseconds: 600),
                                              curve: Curves.easeOutCubic);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(contents[i].subtitle!,
                                            textAlign: TextAlign.center,
                                            style: AppTextStyle.textStyle22),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(contents[i].description!,
                                            textAlign: TextAlign.center,
                                            style:
                                                AppTextStyle.textStyleGrey16),
                                        const SizedBox(
                                          height: 60,
                                        ),
                                        Container(
                                          width: 130,
                                          decoration: BoxDecoration(
                                            color: lastPage
                                                ? AppColors.dark
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              width: 1,
                                              color: AppColors.dark,
                                            ),
                                          ),
                                          child: MaterialButton(
                                            textColor: const Color(0XFF00994F),
                                            onPressed: () {
                                              lastPage
                                                  ? Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const DoctorOrParent(),
                                                      ))
                                                  : pageController.nextPage(
                                                      duration: const Duration(
                                                          seconds: 1),
                                                      curve: Curves.ease);
                                            },
                                            child: Text(
                                              lastPage ? "هيا نبدأ" : 'التالى',
                                              style: TextStyle(
                                                color: lastPage
                                                    ? Colors.white
                                                    : AppColors.dark,
                                                fontSize: 18,
                                                fontFamily: 'ReadexPro',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: const Color(0XFFe6f9ef),
        elevation: 0,
        actions: <Widget>[
          lastPage
              ? const SizedBox()
              : IconButton(
                  icon: SvgPicture.asset("assets/icons/skip.svg"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorOrParent(),
                        ));
                  })
        ]);
  }
}
