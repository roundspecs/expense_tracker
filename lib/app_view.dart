import 'package:expense_tracker/screens/home/view/view.dart';
import 'package:flutter/material.dart';

class AppView extends MaterialApp {
  AppView({super.key})
      : super(
          debugShowCheckedModeBanner: false,
          title: "Expense Tracker",
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.light(
              primary: Colors.black,
              secondary: Colors.grey.shade800,
            ),
            scaffoldBackgroundColor: Colors.grey.shade200,
          ),
          home: const HomeView(),
        );
}
