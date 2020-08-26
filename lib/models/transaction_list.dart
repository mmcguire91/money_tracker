import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this.transactions);
  final List<Transaction> transactions;
  List<Color> _txColors = [Color(0xff01655e), Colors.green];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Container(
          margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          padding: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: _txColors),
            border: Border.all(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
            color: Colors.greenAccent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text(
                  '\$${tx.amount}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
//                    Color(0xffC5CED4),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tx.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    DateFormat().format(tx.dateTime),
                    style: TextStyle(color: Colors.white70),
                  )
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
