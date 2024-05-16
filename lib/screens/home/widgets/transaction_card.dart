import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.amount,
    required this.date,
    required this.formatCurrency,
  });

  final IconData icon;
  final String title;
  final double amount;
  final String date;
  final NumberFormat formatCurrency;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Icon(icon),
            ],
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(child: Container()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatCurrency.format(amount),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(date),
            ],
          )
        ],
      ),
    );
  }
}
