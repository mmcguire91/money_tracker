import 'package:flutter/foundation.dart';

class Transaction {
  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.dateTime});

  final String id;
  final String title;
  final double amount;
  final DateTime dateTime;
}
