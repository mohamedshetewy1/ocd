import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/progress_screen/charts/bar%20graph/bar_graph.dart';
import 'package:ocdear/utils/text_style.dart';

class BarChartProgress extends StatefulWidget {
  const BarChartProgress({Key? key}) : super(key: key);

  @override
  State<BarChartProgress> createState() => _BarChartProgressState();
}

class _BarChartProgressState extends State<BarChartProgress> {
  List<double> weeklySummary = [
    25.0,
    36.0,
    56.6,
    10.6,
    93.0,
    83.5,
    6.8,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(5),
                width: 108,
                height: 35,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xff737373), width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xff737373),
                    ),
                    Spacer(),
                    Text(
                      "هذا الأسبوع",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff737373),
                        fontFamily: 'ReadexPro',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            const Text(
              "الحالة التقدمية للطفل",
              style: AppTextStyle.textStyleBlack17,
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ممتاز",
                  style: AppTextStyle.textStyleBlack10,
                ),
                SizedBox(height: 16),
                Text(
                  "جيد جدا",
                  style: AppTextStyle.textStyleBlack10,
                ),
                SizedBox(height: 16),
                Text(
                  "جيد",
                  style: AppTextStyle.textStyleBlack10,
                ),
                SizedBox(height: 16),
                Text(
                  "سيئ",
                  style: AppTextStyle.textStyleBlack10,
                ),
                SizedBox(height: 20),
              ],
            ),
            const Gap(10),
            SizedBox(
              height: 197,
              width: 280,
              child: MyBarGraph(
                weeklySummary: weeklySummary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
