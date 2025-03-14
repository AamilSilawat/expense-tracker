/**

 * Author: Aamil Silawat
 * Created Date: 13/03/25 10:15 pm
 * Email: aamilraza56@gmail.com

 ***/

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/expense.dart';
import '../controllers/expenses_controller.dart';

/// UI Screens - Adding, Editing, and Deleting Expenses
class AddExpenseScreen extends StatelessWidget {
  AddExpenseScreen({super.key});

  final ExpenseController controller = Get.find();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Expense')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final expense = Expense(
                  amount: double.parse(amountController.text),
                  date: dateController.text,
                  description: descriptionController.text,
                  category: categoryController.text,
                );
                controller.addExpense(expense);
                Get.back();
              },
              child: Text('Save Expense'),
            ),
          ],
        ),
      ),
    );
  }
}