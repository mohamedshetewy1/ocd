import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/progress_screen/charts/bar%20graph/chart_progress.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/progress_screen/charts/pie_chart/pie_chart.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/widgets/welcome_parent.dart';
import '../widgets/slider_p.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const WelcomeParent(),
              const SizedBox(height: 25),
              const SliderParent(),
              const Gap(15),
              Container(
                padding: const EdgeInsets.all(15),
                width: 329,
                height: 282,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const BarChartProgress(),
              ),
              const SizedBox(height: 25),
              const MYPieChart(),
              const Gap(20),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset(
                  "assets/images/progress_3.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
