// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class graficBar extends StatelessWidget {
  final double value;
  final List groupedTransaction;
  final int index;
  final double percentage;

  graficBar(this.value, this.groupedTransaction, this.index, this.percentage);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        children: [
          SizedBox(
            height: 20,
            child: FittedBox(
              child: Text(value.toStringAsFixed(2)),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 60,
            width: 10,
            child: Stack(alignment: Alignment.bottomLeft, children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(220, 220, 220, 1)),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ]),
          ),
          SizedBox(height: 5),
          Text(groupedTransaction[index]["day"]),
        ],
      ),
    );
  }
}
