import 'package:expense_tracker/screens/home/view/view.dart';
import 'package:flutter/material.dart';

class AppView extends MaterialApp {
  AppView({super.key})
      : super(
          debugShowCheckedModeBanner: false,
          title: "Expense Tracker",
          theme: ThemeData(
              useMaterial3: true,
              appBarTheme: AppBarTheme(
                color: Colors.grey.shade200,
              ),
              colorScheme: ColorScheme.light(
                primary: Colors.black,
                secondary: Colors.grey.shade800,
              ),
              scaffoldBackgroundColor: Colors.grey.shade200,
              segmentedButtonTheme: SegmentedButtonThemeData(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.resolveWith(
                    (states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.white;
                      }
                      return Colors.grey.shade800;
                    },
                  ),
                ),
              )),
          home: const HomeView(),
        );
}
