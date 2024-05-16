import 'package:expense_tracker/screens/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatCurrency = NumberFormat.simpleCurrency(name: "৳ ");

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          CreditCard(
            income: 10000,
            expense: 500,
            formatCurrency: formatCurrency,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Transactions",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 9,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TransactionCard(
                    title: "Grocery",
                    amount: 200,
                    date: "12-09-2021",
                    icon: Icons.shopping_bag_rounded,
                    formatCurrency: formatCurrency,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
