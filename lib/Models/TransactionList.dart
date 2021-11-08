import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_espenses/Trabsaction.dart';

class TransactionList extends StatelessWidget{
  final List<Transaction>transaction;
  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(

            children:transaction.map((tx){
              return Card(
                child: Row(
                  children: [
                    Container(

                        child: Container(

                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text('\$'+tx.amount.toString(),style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                        )

                    ),
                    Column(

                      children: [
                        Text(tx.title,style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),),

                        Text(DateFormat.yMMMd().format(tx.Date),style: TextStyle(
                            fontWeight: FontWeight.w500,
                          fontSize: 20,

                        ),)

                      ],
                    )
                  ],
                ),
              );

            }).toList()
        ),
      ),
    );

  }
}