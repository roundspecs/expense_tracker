import 'package:expense_tracker/screens/home/view/main_screen.dart';
import 'package:expense_tracker/screens/stats/views/stats_screen.dart';
import 'package:flutter/material.dart';

const _pages = [
  MainScreen(),
  StatsScreen(),
];

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 40,
          onTap: (value) => setState(() => selectedPageIndex = value),
          currentIndex: selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: "Transactions",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: "Statistics",
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: _pages[selectedPageIndex],
    );
  }
}
