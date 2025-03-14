/**

 * Author: Aamil Silawat
 * Created Date: 13/03/25 10:12 pm
 * Email: aamilraza56@gmail.com

 ***/
import 'package:get/get.dart';
import '../../domain/models/expense.dart';

class ExpenseController extends GetxController {
  var expenses = <Expense>[].obs;
  var isLoading = false.obs;

  void addExpense(Expense expense) {
    expenses.add(expense);
  }

  void deleteExpense(int id) {
    expenses.removeWhere((expense) => expense.id == id);
  }

  void updateExpense(Expense updatedExpense) {
    int index = expenses.indexWhere((expense) => expense.id == updatedExpense.id);
    if (index != -1) {
      expenses[index] = updatedExpense;
    }
  }

  Map<String, double> getExpenseSummary() {
    Map<String, double> summary = {};
    for (var expense in expenses) {
      if (summary.containsKey(expense.category)) {
        summary[expense.category] = summary[expense.category]! + expense.amount;
      } else {
        summary[expense.category] = expense.amount;
      }
    }
    return summary;
  }
}