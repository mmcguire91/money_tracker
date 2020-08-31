import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:money_tracker/Widgets/user_transactions.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
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
            Icon(Icons.add),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(15.0),
                child: Card(
                  //Card is a freestyle container
                  color: Color(0xff01655e),
                  child: Text('Chart'),
                  elevation: 5.0,
                ),
              ),
              UserTransactions(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
          backgroundColor: Color(0xff01655e),
        ),
      ),
    );
  }
}
