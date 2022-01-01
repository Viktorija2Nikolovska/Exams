import 'package:flutter/material.dart';
import 'homeExam.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Exam planner',
      theme: ThemeData(primaryColor: Colors.blue[600]), 
    home: Home());
  }
}