// import 'package:flutter/material.dart';

// class LineChart extends StatelessWidget {
//   List<SalesData> data = [
//     SalesData('السبت', 'مذعور'),
//     SalesData('الحد','مشمئز'),
//     SalesData('الاثنين', 'متوتر'),
//     SalesData('الثلاثاء', 'غضبان'),
//      SalesData('الاربع', 'متحمس'),
//       SalesData('الخميس', 'متحير'),
//        SalesData('الجمعه', 'سعيد'),
//         SalesData('', 'خجول'),
   
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//      child: SfCartesianChart(
//        primaryXAxis: CategoryAxis(),
//        title: ChartTitle(text: 'Half Yearly Sales Analysis'),
//        legend: Legend(
//          isVisible: true,
//        ),
//        tooltipBehavior: TooltipBehavior(enable: true),
//        series: <ChartSeries<SalesData, String>>[
//          LineSeries<SalesData, String>(
//            dataSource: data,
//            xValueMapper: (SalesData sales, _) => sales.month,
//            yValueMapper: (SalesData sales, _) => sales.sales,
//            name: 'cases',
//            dataLabelSettings: DataLabelSettings(isVisible: true),
//          ),
//        ],
//      ),
//           );
//   }
// }

// class SalesData {
//   final String weak;
//   final String cases;

//   SalesData(this.weak, this.cases);
// }
