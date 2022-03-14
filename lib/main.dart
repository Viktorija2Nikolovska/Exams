import 'package:exams/login.dart';
import 'package:flutter/material.dart';
import 'homeExam.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
// Да се надгради апликацијата за термини за колоквиуми и испити. 

// Да се имплементира календар кој ќе овозможи преглед на распоредот за студентот.
// Да овозможи повеќе корисници со памтење на состојбата за секој корисник со едноставна автентификација.
// Да овозможи нотификации (локални или push) за потсетување за некој настан.


// Лаб 5
// Да се додадат локациски сервиси на апликацијата за распоред и да се овозможи креирање на локациски базирани потсетници.

// Да се додаде мапа со локациите на кои има зачувано настани.

// Да се имплементира комуникација со Google Maps за најкратка рута до местото на настанот и истата да се прикаже.
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

//   void loginSharedPreferences() async{
//   SharedPreferences _pref=await SharedPreferences.getInstance();
//   _pref.setInt('student',"finki_student".hashCode);
 
// }
  @override
  Widget build(BuildContext context) {
    // loginSharedPreferences();
    return MaterialApp(
      title:'Exam planner',
      theme: ThemeData(primaryColor: Colors.blue[600]), 
    home: MyLoginPage());
  }
}