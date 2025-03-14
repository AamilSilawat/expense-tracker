
/**

 * Author: Aamil Silawat
 * Created Date: 13/03/25 10:19 pm
 * Email: aamilraza56@gmail.com

 ***/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/expenses_controller.dart';





class SummaryScreen extends StatelessWidget {
  SummaryScreen({super.key});

  final ExpenseController controller = Get.find();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense Summary')),
      body: Obx(() {
        final summary = controller.getExpenseSummary();
        return ListView.builder(
          itemCount: summary.length,
          itemBuilder: (context, index) {
            final category = summary.keys.elementAt(index);
            final amount = summary[category]!.toStringAsFixed(2);
            return ListTile(
              title: Text(category),
              trailing: Text('\$ $amount', style: TextStyle(fontWeight: FontWeight.bold)),
            );
          },
        );
      }),
    );
  }
}