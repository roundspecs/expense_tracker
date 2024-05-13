import 'package:flutter/material.dart';

class AppView extends MaterialApp {
  AppView({super.key})
      : super(
          debugShowCheckedModeBanner: false,
          title: "Expense Tracker",
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.light(
              background: Colors.grey.shade100,
              primary: Colors.white,
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.dark(
              background: Colors.black,
              primary: Colors.grey.shade800,
            ),
          ),
          home: const Scaffold(),
        );
}
