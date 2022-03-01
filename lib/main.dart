import 'package:flutter/material.dart';
import 'homeExam.dart';
// Да се надгради апликацијата за термини за колоквиуми и испити. 

// Да се имплементира календар кој ќе овозможи преглед на распоредот за студентот.
// Да овозможи повеќе корисници со памтење на состојбата за секој корисник со едноставна автентификација.
// Да овозможи нотификации (локални или push) за потсетување за некој настан.

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