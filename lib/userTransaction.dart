import 'package:flutter/material.dart';
import 'package:personal_espenses/Models/TransactionList.dart';
import 'package:personal_espenses/NewTransaction.dart';

import 'Trabsaction.dart';
class UserTransaction extends StatefulWidget{
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addNewTransaction),


      ],
    );
  }
}