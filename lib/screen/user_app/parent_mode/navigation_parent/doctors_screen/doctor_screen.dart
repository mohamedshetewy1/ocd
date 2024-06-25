import 'package:flutter/material.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/doctors_screen/widget/doctors_bar.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/doctors_screen/widget/doctors_card.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/doctors_screen/widget/search_field.dart';

import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/widgets/welcome_parent.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

import '../widgets/slider_p.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 55),
            child: Text(
              ' أشهر الأطباء',
              style: AppTextStyle.textStyleNormal20,
            ),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.normalActive,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const WelcomeParent(),
              const SizedBox(height: 20),
              const SearchField(),
              const SizedBox(height: 20),
              const SliderParent(),
              const SizedBox(height: 32),
              DoctorsBar("أشهر الأطباء"),
              const SizedBox(height: 15),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [DoctorsCard(), DoctorsCard()]),
              const SizedBox(height: 30),
              DoctorsBar('أطباء مقترحه'),
              const SizedBox(height: 15),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [DoctorsCard(), DoctorsCard()]),
            ],
          ),
        ),
      ),
    );
  }
}
