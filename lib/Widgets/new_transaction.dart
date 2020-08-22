import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final title = TextEditingController();
  final amount = TextEditingController();

  NewTransaction(addNewTransaction, {this.addTx});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text(
              'Add New Transaction',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: title,
//              onChanged: (value) {
//                title = value;
//              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amount,
//              onChanged: (value) {
//                amount = value;
//              },
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: FlatButton(
                padding: EdgeInsets.all(10.0),
                color: Colors.green,
                onPressed: () {
                  addTx(
                    title.text,
                    double.parse(amount.text),
                  );
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
