
/**

 * Author: Aamil Silawat
 * Created Date: 13/03/25 10:15 pm
 * Email: aamilraza56@gmail.com

 ***/
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/expense.dart';
import '../controllers/expenses_controller.dart';

class EditExpenseScreen extends StatelessWidget {
  final Expense expense;
  final ExpenseController controller = Get.find();
  final TextEditingController amountController;
  final TextEditingController descriptionController;
  final TextEditingController dateController;
  final TextEditingController categoryController;

  EditExpenseScreen({super.key, required this.expense})
      : amountController = TextEditingController(text: expense.amount.toString()),
        descriptionController = TextEditingController(text: expense.description),
        dateController = TextEditingController(text: expense.date),
        categoryController = TextEditingController(text: expense.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Expense')),
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
                final updatedExpense = Expense(
                  id: expense.id,
                  amount: double.parse(amountController.text),
                  date: dateController.text,
                  description: descriptionController.text,
                  category: categoryController.text,
                );
                controller.updateExpense(updatedExpense);
                Get.back();
              },
              child: Text('Update Expense'),
            ),
          ],
        ),
      ),
    );
  }
}