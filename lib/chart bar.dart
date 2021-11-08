import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget{
  final String label;
  final double SpendingAmount;
  final double SpendingPctOfTotal;
  ChartBar({ required this.label,required this.SpendingAmount,required this.SpendingPctOfTotal});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox
            (

              child: Text('\$${SpendingAmount.toStringAsFixed(0)}')),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white10,width: 1.0),
                color: Color.fromARGB(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
              ),

            ),
              FractionallySizedBox(heightFactor: SpendingPctOfTotal,
                child:Container(decoration:BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),

                )
                  ,) ,)
            ],
          ),
        )
      ],
    );
  }
}