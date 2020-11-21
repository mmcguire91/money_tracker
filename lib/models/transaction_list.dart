import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this.transactions, this.deleteTransaction);
  final List<Transaction> transactions;
  final Function deleteTransaction;
  // List<Color> _txColors = [Color(0xff228B22), Colors.green];

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
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
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
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
                      padding: EdgeInsets.all(15.0),
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
                  trailing: IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.grey[400],
                    onPressed: () => deleteTransaction(transactions[index].id),
                  ),
                ),
              ); //preconfigured widget that works well with lists
            },
            itemCount: transactions.length,
          );
  }
}
