import 'package:expense_tracker/screens/home/views/home_view.dart';
import 'package:flutter/material.dart';

class AppView extends MaterialApp {
  AppView({super.key})
      : super(
          debugShowCheckedModeBanner: false,
          title: "Expense Tracker",
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.light(
              surface: Colors.grey.shade100,
              primary: Colors.black,
              secondary: Colors.white,
            ),
          ),
          home: const HomeView(),
        );
}
