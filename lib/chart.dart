import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_espenses/Trabsaction.dart';
import 'package:personal_espenses/chart%20bar.dart';
 class Chart extends StatelessWidget{
  final List<Transaction>recentTransactions;
    Chart(this.recentTransactions);
 List<Map<String,Object>> get groupedTransactionValue{
   return
     List.generate(7, (index){
       final weekday = DateTime.now().subtract(Duration(days: index),);
       var totalSum = 0.0;
       for (var i = 0; i < recentTransactions.length; i++) {
         if (recentTransactions[i].Date.day == weekday.day &&
             recentTransactions[i].Date.month == weekday.month &&
             recentTransactions[i].Date.year == weekday.year) {
           totalSum+=recentTransactions[i].amount;

         };
       };
       return {'day': DateFormat.E().format(weekday).substring(0, 1),
         'amount': totalSum,

       };




         }).reversed.toList();

 }
 double get totalSpending{
   return groupedTransactionValue.fold(0.0,(sum, item){
       return sum;
   });


 }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment:  MainAxisAlignment.spaceAround,
          children: groupedTransactionValue.map((data){
            return
              Flexible(
                fit: FlexFit.tight,
                child: ChartBar(label: data['day'].toString(), SpendingAmount: (data['amount']as double),
                  SpendingPctOfTotal:totalSpending==0.0?0.0: (data['amount']as double)/ totalSpending),
              );

          }).toList(),




        ),
      ),
    );
  }


}