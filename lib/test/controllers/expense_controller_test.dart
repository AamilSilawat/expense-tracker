/**

 * Author: Aamil Silawat
 * Created Date: 13/03/25 10:29 pm
 * Email: aamilraza56@gmail.com

 ***/

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import '../../domain/models/expense.dart';
import '../../presentation/controllers/expenses_controller.dart';

void main() {
  late ExpenseController controller;

  setUp(() {
    controller = Get.put(ExpenseController());
  });

  test('Should add an expense', () {
    final expense = Expense(
      id: 1,
      amount: 100.0,
      date: '2025-03-13',
      description: 'Groceries',
      category: 'Food',
    );

    controller.addExpense(expense);

    expect(controller.expenses.contains(expense), true);
  });

  test('Should delete an expense', () {
    final expense = Expense(
      id: 1,
      amount: 100.0,
      date: '2025-03-13',
      description: 'Groceries',
      category: 'Food',
    );

    controller.addExpense(expense);
    controller.deleteExpense(expense.id!);

    expect(controller.expenses.contains(expense), false);
  });
}
