import 'dart:math' show max;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraph extends StatelessWidget {
  final List<double> weeklySpending;
  static const weekDays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  const BarGraph({super.key, required this.weeklySpending});

  @override
  Widget build(BuildContext context) {
    var maxY = weeklySpending.reduce(max) + 100;
    return BarChart(
      BarChartData(
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                rod.toY.round().toString(),
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        maxY: maxY,
        minY: 0,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) => Text(
                weekDays[value.toInt()],
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        barGroups: [
          for (int i = 0; i < weeklySpending.length; i++)
            BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: weeklySpending[i],
                  color: Theme.of(context).colorScheme.secondary,
                  width: 25,
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: maxY,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.1),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
