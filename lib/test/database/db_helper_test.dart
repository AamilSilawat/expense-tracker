/**

 * Author: Aamil Silawat
 * Created Date: 13/03/25 10:33 pm
 * Email: aamilraza56@gmail.com

 ***/

import 'package:flutter_test/flutter_test.dart';
import 'package:task/core/database_helper.dart';

import 'package:task/domain/models/expense.dart';




void main() {
  late DatabaseHelper dbHelper;

  setUpAll(() async {
    dbHelper = DatabaseHelper.instance;
    await dbHelper.initDB(testMode: true); // Use test mode to create an in-memory DB
  });

  test('Should insert an expense into the database', () async {
    final expense = Expense(
      amount: 50.0,
      date: '2025-03-13',
      description: 'Dinner',
      category: 'Food',
    );

    int id = await dbHelper.insertExpense(expense);
    final retrievedExpenses = await dbHelper.getExpenses();

    expect(retrievedExpenses.any((e) => e.id == id), true);
  });
}



