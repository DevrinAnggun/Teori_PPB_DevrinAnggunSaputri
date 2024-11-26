import 'package:flutter/material.dart';
import 'package:praktikum_10/view/my_db_view.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Data Storage',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyDatabaseView(),
    );
  }
}