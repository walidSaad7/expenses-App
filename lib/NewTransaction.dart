import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NewTransaction extends StatefulWidget{
  final Function addtx;


  NewTransaction(this.addtx,);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControllar=TextEditingController();
  final amountControllar=TextEditingController();
 DateTime selectedDay=DateTime.now();
 void submitData(){
   if (amountControllar.text.isEmpty||titleControllar.text.isEmpty||selectedDay==null){
     return;
   }
 }


  void personDataPicker(){
    showDatePicker(context:context, initialDate: DateTime.now(), firstDate: DateTime(2019),
        lastDate:DateTime.now()  ).then((pickedDate){

          if ( selectedDay==DateTime.now()){
            selectedDay==pickedDate;


          }
          setState(() {

          });




    });
  }

  @override
  Widget build(BuildContext context) {
    return   Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(

              controller: titleControllar,

              decoration: InputDecoration(
                  labelText: 'Title'

              ),
            ), TextFormField(


                  controller: amountControllar,
                decoration: InputDecoration(
                    labelText: 'Amount'
                )
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(selectedDay==null?'No Date Chosen !': DateFormat.yMd().format(selectedDay)
                    ,style: TextStyle(
                    fontSize: 15
                  ),),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: (){
                    personDataPicker();
                  }, child: Text('Choose Date'))
                ],
              ),
            ),
            ElevatedButton(onPressed: (){
              widget.addtx(titleControllar.text,double.parse(amountControllar.text) );


            }, child: Text('Add transaction'))
          ],
        ),
      ),
    );

  }
}