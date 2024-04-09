// import 'dart:js_interop';

import 'package:collection/collection.dart';

class ChartData {
  final double x;
  final double y;

  ChartData({required this.x, required this.y});
}

List<ChartData> get chartData {
  final data = <double>[15, 5, 8, 100, 20, 30, 40, 50, 60, 70, 80, 90, 100];
  return data.mapIndexed((index, element) => ChartData(x:  index.toDouble(), y: element)).toList();
}
