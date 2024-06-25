import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ocdear/screen/auth/login_screens/login_screen.dart';
import 'package:ocdear/screen/doctor_app/auth/login_screens/login_screen_doctors.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class DoctorOrParent extends StatefulWidget {
  const DoctorOrParent({super.key});

  @override
  State<DoctorOrParent> createState() => _OnboardingScreenState();
}

PageController pageController = PageController();

class _OnboardingScreenState extends State<DoctorOrParent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFe6f9ef),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Image.asset(
                  "assets/images/onboarding/bro.png",
                  height: 244,
                ),
              ),
              const Gap(50),
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.7,
                    width: MediaQuery.sizeOf(context).width,
                    child: Image.asset(
                      "assets/images/onboarding/Rectangle 26.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 150,
                    right: 5,
                    left: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: Column(
                        children: [
                          const Text("تسجيل الدخول ك",
                              textAlign: TextAlign.center,
                              style: AppTextStyle.textStyle22),
                          const Gap(70),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: 330,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.dark,
                              ),
                              child: const Center(
                                child: Text(
                                  "والد ",
                                  style: AppTextStyle.textStyleMain20,
                                ),
                              ),
                            ),
                          ),
                          const Gap(15),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginScreenDoctors(),
                                ),
                              );
                            },
                            child: Container(
                              width: 330,
                              height: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: AppColors.normalActive)),
                              child: const Center(
                                child: Text(
                                  "طبيب ",
                                  style: AppTextStyle.textStyleNormal20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
