import '../../core/database_helper.dart';
import '../../domain/models/expense.dart';

/**

 * Author: Aamil Silawat
 * Created Date: 13/03/25 10:07 pm
 * Email: aamilraza56@gmail.com

 ***/

class ExpenseRepository {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  Future<int> addExpense(Expense expense) async {
    final db = await dbHelper.database;
    return await db.insert('expenses', expense.toMap());
  }

  Future<List<Expense>> getExpenses() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('expenses');
    return maps.map((e) => Expense.fromMap(e)).toList();
  }

  Future<int> updateExpense(Expense expense) async {
    final db = await dbHelper.database;
    return await db.update('expenses', expense.toMap(), where: 'id = ?', whereArgs: [expense.id]);
  }

  Future<int> deleteExpense(int id) async {
    final db = await dbHelper.database;
    return await db.delete('expenses', where: 'id = ?', whereArgs: [id]);
  }
}