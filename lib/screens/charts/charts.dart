import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'data.dart'; // Seu arquivo de dados
class Charts extends StatelessWidget {
  final List<ChartData>? points; // Adicione "?" para tornar points opcional

  Charts([this.points]); // Use colchetes para tornar points opcional no construtor

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LineChart(
        LineChartData(
          lineBarsData: points != null ? [
            LineChartBarData(
              color: Colors.blue,
              barWidth: 5,
              spots: points!.map((point) => FlSpot(point.x, point.y)).toList(),
              dotData: FlDotData(show: true),
            )
          ] : [],
        ),
      ),
    );
  }
}

