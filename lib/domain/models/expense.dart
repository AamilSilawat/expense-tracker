/**

 * Author: Aamil Silawat
 * Created Date: 13/03/25 10:07 pm
 * Email: aamilraza56@gmail.com

 ***/

class Expense {
  final int? id;
  final double amount;
  final String date;
  final String description;
  final String category;

  Expense({this.id, required this.amount, required this.date, required this.description, required this.category});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'date': date,
      'description': description,
      'category': category,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      amount: map['amount'],
      date: map['date'],
      description: map['description'],
      category: map['category'],
    );
  }
}