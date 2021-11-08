import 'package:flutter/material.dart';

import 'HomePage.dart';

void main(){
  runApp(MyApplication());
}
class MyApplication extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       title: 'personal Expenses',
       home: HomePage(),
       theme: ThemeData(
         primarySwatch: Colors.red,

       ),

     );
  }
}