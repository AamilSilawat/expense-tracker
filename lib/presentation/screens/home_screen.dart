import 'package:flutter/material.dart';
import 'package:task/presentation/screens/summary_screen.dart';

import '../../core/notification_service.dart';
import '../controllers/expenses_controller.dart';

/**

 * Author: Aamil Silawat
 * Created Date: 13/03/25 10:04 pm
 * Email: aamilraza56@gmail.com

 ***/
import 'package:get/get.dart';

import 'add_expense_screen.dart';
import 'edit_expense_screen.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ExpenseController controller = Get.put(ExpenseController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense Tracker')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.expenses.length,
          itemBuilder: (context, index) {
            final expense = controller.expenses[index];
            return ListTile(
              title: Text(expense.description),
              subtitle: Text(expense.date),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('\$${expense.amount.toStringAsFixed(2)}'),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => Get.to(EditExpenseScreen(expense: expense)),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => controller.deleteExpense(expense.id!),
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => Get.to(AddExpenseScreen()),
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => Get.to(SummaryScreen()),
            child: Icon(Icons.pie_chart),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              NotificationService.scheduleDailyNotification();
              Get.snackbar('Reminder Set', 'You will be reminded daily to log expenses.');
            },
            child: Icon(Icons.notifications),
          )
        ],
      ),
    );
  }
}