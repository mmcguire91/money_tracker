import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  final List<Transaction> transactions = [
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Money Tracker',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff01655e),
          actions: <Widget>[
            Icon(Icons.add),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(15.0),
              child: Card(
                //Card is a freestyle container
                color: Colors.lightBlue[300],
                child: Text('Chart'),
                elevation: 5.0,
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Text(tx.title),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
