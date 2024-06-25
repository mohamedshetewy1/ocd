import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/progress_screen/charts/bar%20graph/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary;
  const MyBarGraph({Key? key, required this.weeklySummary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      satAmount: weeklySummary[0],
      sunAmount: weeklySummary[1],
      monAmount: weeklySummary[2],
      tueAmount: weeklySummary[3],
      wedAmount: weeklySummary[4],
      thurAmount: weeklySummary[5],
      friAmount: weeklySummary[6],
    );

    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: true, verticalInterval: 1),
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: false,
            getTitlesWidget: getLeftTitles,
          )),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getBottomTitles,
          )),
        ),
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color(0xff00994F),
                        Color(0xffB0EBCF),
                      ],
                    ),
                    width: 16,
                    borderRadius: BorderRadius.circular(5),
                    backDrawRodData: BackgroundBarChartRodData(
                      color: Colors.grey[350],
                      show: true,
                      toY: 100,
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(
  double value,
  TitleMeta meta,
) {
  const Style = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: 'ReadexPro',
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text("الجمعة", style: Style);
      break;
    case 1:
      text = const Text(" الخميس", style: Style);
      break;
    case 2:
      text = const Text(" الأربعاء", style: Style);
      break;
    case 3:
      text = const Text(" الثلاثاء", style: Style);
      break;
    case 4:
      text = const Text(" الأثنين", style: Style);
      break;
    case 5:
      text = const Text(" الأحد", style: Style);
      break;
    case 6:
      text = const Text(" السبت", style: Style);
      break;
    default:
      text = const Text(" ", style: Style);
      break;
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}

Widget getLeftTitles(
  double value,
  TitleMeta meta,
) {
  const Style = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text("ممتاز", style: Style);
      break;
    case 1:
      text = const Text("جيد جدا", style: Style);
      break;
    case 2:
      text = const Text("جيد", style: Style);
      break;
    case 3:
      text = const Text("سيئ", style: Style);
      break;
    default:
      text = const Text("", style: Style);
      break;
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
