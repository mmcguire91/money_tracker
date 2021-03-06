import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _title = TextEditingController();

  final _amount = TextEditingController();

  DateTime _selectedDate;

  void _submitData() {
    if (_amount.text.isEmpty) {
      return;
    }

    final txTitle = _title.text;
    final txAmount = double.parse(_amount.text);

    if (txTitle.isEmpty || txAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      txTitle,
      txAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
        // if the user did not pick a date then do nothing
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    }); // then = execute a function once a future retrieves a value
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //make bottom modal scrollable. A better solution here would be ShowModalBottomSheet()
      child: Card(
        elevation: 5.0,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            left: 15.0,
            top: 15.0,
            right: 15.0,
            bottom: MediaQuery.of(context).viewInsets.bottom +
                15, //make bottom modal scrollable.
          ),
          child: Column(
            children: <Widget>[
              Text(
                'Add New Transaction',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.green,
                ),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _title,
                onSubmitted: (_) => _submitData(),
                //onSubmitted only takes string values so when passing in numbers you have to pass in an anonymous function
//              onChanged: (value) {
//                title = value;
//              },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amount,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
                //onSubmitted only takes string values so when passing in numbers you have to pass in an anonymous function
//              onChanged: (value) => amount = value,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 8.0, 0.0, 0.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'Date: N/A'
                          : 'Date: ${DateFormat.yMd().format(_selectedDate)}'),
                    ),
                    AdaptiveFlatButton('Select Date', _presentDatePicker),
                    //extracted into separate widget to save space, typically this is done in areas that are used frequently throughout code
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: RaisedButton(
                      padding: EdgeInsets.all(10.0),
                      color: Colors.green,
                      onPressed: _submitData,
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
