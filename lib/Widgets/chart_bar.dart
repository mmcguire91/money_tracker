import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //assists in calculating height dynamically
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Container(
              height:
                  constraints.maxHeight * 0.15, //calculate height dynamically
              child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(2)}'),
              ),
            ),
            SizedBox(
              height:
                  constraints.maxHeight * 0.05, //calculate height dynamically
            ),
            Container(
              height:
                  constraints.maxHeight * 0.6, //calculate height dynamically
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(
                        220,
                        220,
                        220,
                        1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff01655e),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  //FractionallySizedBox: Create a box with a value that is a fraction of another value
                ],
              ),
            ),
            SizedBox(
              height:
                  constraints.maxHeight * 0.05, //calculate height dynamically
            ),
            Container(
              height:
                  constraints.maxHeight * 0.15, //calculate height dynamically
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );
  }
}
