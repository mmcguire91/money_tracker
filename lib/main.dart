import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                return Container(
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.all(0.5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Text(
                            '\$${tx.amount}',
//                            .toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(tx.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0)),
                            Text(
                              DateFormat().format(tx.dateTime),
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
