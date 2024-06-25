import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/progress_screen/charts/bar%20graph/individual_bar.dart';

class BarData {
  final double satAmount;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;

  BarData({
    required this.satAmount,
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
  });

  List<IndividualBar> barData = [];
  void initializeBarData() {
    barData = [
      //sat
      IndividualBar(x: 0, y: satAmount),
      //sun
      IndividualBar(x: 1, y: sunAmount),
      //mon
      IndividualBar(x: 2, y: monAmount),
      //tue
      IndividualBar(x: 3, y: tueAmount),
      //wed
      IndividualBar(x: 4, y: wedAmount),
      //thur
      IndividualBar(x: 5, y: thurAmount),
      //fri
      IndividualBar(x: 6, y: friAmount),
    ];
  }
}
