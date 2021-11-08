import 'package:flutter/material.dart';
import 'package:personal_espenses/Models/TransactionList.dart';
import 'package:personal_espenses/NewTransaction.dart';
import 'package:personal_espenses/chart.dart';

import 'Trabsaction.dart';

class HomePage extends StatefulWidget{


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction>userTransactions=[

  ];

  List<Transaction>get recentTransaction{
    return userTransactions.where((tx){
      return tx.Date.isAfter(DateTime.now().subtract(Duration(days: 7)),
      );

    }).toList();

}

  void addNewTransaction(String txtittle,double txamount){
    final newtax=Transaction(id: DateTime.now().toString(), title: txtittle, amount: txamount, Date: DateTime.now());
    setState(() {
      userTransactions.add(newtax);
    });
  }

  void StartAddNewTransaction(){
    showModalBottomSheet(context: (context), builder: (_){
      return GestureDetector(
        onTap: (){

        },

        child:  NewTransaction(addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Personal Expenses',style: TextStyle(
          fontWeight: FontWeight.bold
        ),),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Chart(recentTransaction),
            TransactionList(userTransactions)


          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed:StartAddNewTransaction,
        child:Icon(Icons.add),backgroundColor: Colors.red,
      ),

    );
  }
}