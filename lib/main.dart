import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//used to import properties to set device orientation to portait only
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:money_tracker/Widgets/new_transaction.dart';
import './models/transaction_list.dart';
import './models/transaction.dart';
import './Widgets/chart.dart';

void main() {
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  //set device orientation to portait only
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
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

  bool _showChart = false; //additional logic of switch toggle in header

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

  void _addNewTransaction(
      String txTitle, double amount, DateTime selectedDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: amount,
        dateTime: selectedDate,
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

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((transaction) => transaction.id == id);
    }); //delete the user transaction where the transaction id is = id of the current item
  }

  @override
  Widget build(BuildContext context) {
    final appBar = GradientAppBar(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Chart'),
            //Use Builder widget to get new context with MaterialApp ancestor
            Builder(
              builder: (context) => Switch(
                  value: _showChart,
                  onChanged: (value) {
                    setState(() {
                      _showChart = value;
                    });
                  }),
              //Switch toggle to show chart
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Text('Chart'),
              //     Switch(
              //         value: _showChart,
              //         onChanged: (value) {
              //           setState(() {
              //             _showChart = value;
              //           });
              //         }),
              //   ],
            ),
            _showChart
                ? Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.8, //calculate the height dynamically subtracting the height of the appBar and the status bar
                    // in order to use mediq query you must move the material app up into a stateless widget
                    child: Chart(_recentTransactions),
                  )
                : Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.7, //calculate the height dynamically subtracting the height of the appBar and the status bar
                    child:
                        TransactionList(_userTransactions, _deleteTransaction),
                  ), // pass these variables over to TransactionList
          ],
        ),
      ),
      //Use Builder widget to get new context with MaterialApp ancestor
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () => _transactionModal(context),
          child: Icon(Icons.add),
          backgroundColor: Color(0xff01655e),
          // Color(0xff01655e),
        ),
      ),
    );
  }
}
