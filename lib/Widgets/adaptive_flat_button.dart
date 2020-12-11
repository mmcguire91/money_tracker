import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
AdaptiveFlatButton(this.text, this.handler);

final String text;
final Function handler;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? 
    CupertinoButton(
      onPressed: handler,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.green,
           ),
          ),
        ) :
    FlatButton(
      onPressed: handler,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.green,
           ),
         ),
       );
  }
}