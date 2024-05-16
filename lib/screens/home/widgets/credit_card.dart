import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'credit_card_section.dart';


class CreditCard extends StatelessWidget {
  final double income, expense;
  final NumberFormat formatCurrency;
  const CreditCard({
    super.key,
    required this.income,
    required this.expense, required this.formatCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            spreadRadius: 10,
            blurRadius: 30,
            offset: const Offset(0, 2),
          ),
        ],
        gradient: LinearGradient(
          transform: const GradientRotation(0.5),
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Total Balance",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
          Text(
            formatCurrency.format(income - expense),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CreditCardSection(
                income: income,
                icon: Icons.arrow_circle_up_rounded,
                title: "Income",
                formatCurrency: formatCurrency,
              ),
              const SizedBox(width: 10),
              CreditCardSection(
                income: expense,
                title: "Expense",
                icon: Icons.arrow_circle_down_rounded,
                formatCurrency: formatCurrency,
              ),
            ],
          )
        ],
      ),
    );
  }
}
