import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final title = TextEditingController();

  final amount = TextEditingController();

  void submitData() {
    final txTitle = title.text;
    final txAmount = double.parse(amount.text);

    if (txTitle.isEmpty || txAmount <= 0) {
      return;
    }

    widget.addTx(
      txTitle,
      txAmount,
    );

    Navigator.of(context).pop();
  }

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
                color: Color(0xff01655e),
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: title,
              onSubmitted: (_) => submitData(),
              //onSubmitted only takes string values so when passing in numbers you have to pass in an anonymous function
//              onChanged: (value) {
//                title = value;
//              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amount,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              //onSubmitted only takes string values so when passing in numbers you have to pass in an anonymous function
//              onChanged: (value) {
//                amount = value;
//              },
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: FlatButton(
                padding: EdgeInsets.all(10.0),
                color: Colors.green,
                onPressed: submitData,
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
