import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:money_tracker/Widgets/new_transaction.dart';
import './models/transaction_list.dart';
import './models/transaction.dart';
import './Widgets/chart.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: '1',
    //   title: 'course',
    //   amount: 11.99,
    //   dateTime: DateTime.now(),
    // ),
    // Transaction(
    //   id: '2',
    //   title: 'milk',
    //   amount: 2.87,
    //   dateTime: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transaction) {
      return transaction.dateTime.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }
  //function to run through transactions over the past 7 days

  void _addNewTransaction(String txTitle, double amount) {
    final newTx = Transaction(
        title: txTitle,
        amount: amount,
        dateTime: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _transactionModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: GradientAppBar(
          centerTitle: true,
          gradient: LinearGradient(
            colors: [Colors.green, Color(0xff01655e)],
          ),
          title: Text(
            'Money Tracker',
            style: TextStyle(color: Colors.white),
          ),
//          backgroundColorStart: Color(0xff01655e),
          actions: <Widget>[
            //Use Builder widget to get new context with MaterialApp ancestor
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _transactionModal(context),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Chart(_recentTransactions),
              TransactionList(_userTransactions),
            ],
          ),
        ),
        //Use Builder widget to get new context with MaterialApp ancestor
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () => _transactionModal(context),
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
            // Color(0xff01655e),
          ),
        ),
      ),
    );
  }
}
