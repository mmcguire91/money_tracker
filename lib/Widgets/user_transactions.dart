import 'package:flutter/material.dart';
import 'package:money_tracker/models/transaction_list.dart';
import 'new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      title: 'course',
      amount: 11.99,
      dateTime: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'milk',
      amount: 2.87,
      dateTime: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TransactionList(),
      ],
    );
  }
}
