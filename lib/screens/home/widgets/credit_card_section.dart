import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreditCardSection extends StatelessWidget {
  const CreditCardSection({
    super.key,
    required this.income,
    required this.title,
    required this.icon,
    required this.formatCurrency,
  });

  final String title;
  final double income;
  final IconData icon;
  final NumberFormat formatCurrency;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 32,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        const SizedBox(width: 8),
        Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
                fontSize: 16,
              ),
            ),
            Text(
              formatCurrency.format(income),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 16,
              ),
            )
          ],
        ),
      ],
    );
  }
}
