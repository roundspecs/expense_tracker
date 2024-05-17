import 'package:flutter/material.dart';

enum TrxType {
  income,
  expense;

  String get name {
    switch (this) {
      case TrxType.income:
        return "Income";
      case TrxType.expense:
        return "Expense";
      default:
        return "";
    }
  }
}

List<String> categories = [
  "Food",
  "Transport",
  "Health",
  "Clothing",
  "Education",
  "Entertainment",
  "Others",
];

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TrxType selectedType = TrxType.expense;
  String selectedCategory = categories[0];
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Expense"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Add new transaction",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  decoration: InputDecoration(
                    prefix: const Text('৳ '),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Amount",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                readOnly: true,
                onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => ModalBottomSheet(
                    options: [TrxType.income.name, TrxType.expense.name],
                    onTaps: [
                      () {
                        setState(() {
                          selectedType = TrxType.income;
                        });
                      },
                      () {
                        setState(() {
                          selectedType = TrxType.expense;
                        });
                      }
                    ],
                    selectedOption: selectedType.name,
                  ),
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.swap_vert_circle,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: selectedType.name,
                  hintStyle: const TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                readOnly: true,
                onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => ModalBottomSheet(
                    options: categories,
                    onTaps: [
                      for (var category in categories)
                        () {
                          setState(() {
                            selectedCategory = category;
                          });
                        }
                    ],
                    selectedOption: selectedCategory,
                  ),
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.category,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: selectedCategory,
                  hintStyle: const TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                readOnly: true,
                onTap: () async {
                  final newDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  setState(() {
                    selectedDate = newDate ?? selectedDate;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.calendar_month_sharp,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText:
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                  hintStyle: const TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const Expanded(child: SizedBox(height: 10)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text("Add Transaction"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({
    super.key,
    required this.options,
    required this.onTaps,
    required this.selectedOption,
  });
  final List<String> options;
  final List<Function> onTaps;
  final String selectedOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) {
          return ListTile(
            trailing: selectedOption == options[index]
                ? const Icon(Icons.check)
                : null,
            title: Text(options[index]),
            onTap: () {
              onTaps[index]();
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
