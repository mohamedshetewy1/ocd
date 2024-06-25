// import 'package:flutter/material.dart';

// class LineChartSample extends StatelessWidget {
//   final List<charts.Series<LinearSales, int>> seriesList = [
//     charts.Series<LinearSales, int>(
//       id: 'Sales',
//       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//       domainFn: (LinearSales sales, _) => sales.year,
//       measureFn: (LinearSales sales, _) => sales.sales,
//       data: [
//         LinearSales(0, 5),
//         LinearSales(1, 25),
//         LinearSales(2, 100),
//         LinearSales(3, 75),
//       ],
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 400,
//       child: charts.LineChart(
//         seriesList,
//         animate: true,
//       ),
//     );
//   }
// }

// class LinearSales {
//   final int year;
//   final int sales;

//   LinearSales(this.year, this.sales);
// }