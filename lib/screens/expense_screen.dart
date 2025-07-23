import 'package:expense_tracker/screens/new_expense_screen.dart';
import 'package:expense_tracker/widgets/expense_list/expense_list.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<ExpenseModel> _registerExpense = [
    ExpenseModel(
      amount: 64.09,
      category: Category.food,
      date: DateTime.now(),
      title: 'title',
    ),
  ];

  void _openAddExpenseOverLay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpenseScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.purple,
        title: Text('Controle de Despesas'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverLay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Text('Chart'),
            const SizedBox(height: 12),
            Expanded(child: ExpenseList(expenses: _registerExpense)),
          ],
        ),
      ),
    );
  }
}
