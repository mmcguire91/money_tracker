import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this.transactions);
  final List<Transaction> transactions;
  List<Color> _txColors = [Color(0xff228B22), Colors.green];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transactions yet',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xff01655e),
                      foregroundColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index]
                          .dateTime), //format to only include DAY, MONTH, YEAR
                    ),
                  ),
                ); //preconfigured widget that works well with lists

//below is colored tiles to meet the theme of the app bar
//                 return Container(
//                   margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                   padding: EdgeInsets.all(3.0),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: _txColors,
//                     ),
//                     border: Border.all(color: Colors.grey, width: 2.0),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(15.0),
//                     ),
//                     color: Colors.greenAccent,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       Container(
//                         child: Text(
//                           '\$${transactions[index].amount.toStringAsFixed(2)}',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20.0,
//                             color: Colors.white,
// //                    Color(0xffC5CED4),
//                           ),
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             transactions[index].title,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Text(
//                             DateFormat().format(transactions[index].dateTime),
//                             style: TextStyle(color: Colors.white70),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
