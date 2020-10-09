import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      //determine the day of the week according to the current dateTime.now() and subtracting the index

      var totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].dateTime.day == weekDay.day &&
            recentTransactions[i].dateTime.month == weekDay.month &&
            recentTransactions[i].dateTime.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      //calculate the totalSum according to the time

      print(DateFormat.E(weekDay));
      print(totalSum);

      return {
        'day': DateFormat.E(weekDay),
        'amount': totalSum,
      };
      // 'day': DateFormat.E(weekDay) = retrieve the current day of the week and store it as a string
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
