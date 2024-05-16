import 'package:expense_tracker/screens/home/view/main_screen.dart';
import 'package:expense_tracker/screens/stats/widgets/bar_graph.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Text("Weekly Spending"),
                Text(
                  formatCurrency.format(1000),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.7,
                  child: const BarGraph(
                    weeklySpending: [100, 200, 300, 400, 500, 600, 700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
