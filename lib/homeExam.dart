import 'package:exams/addExam.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:core';

typedef AddExamCallback = void Function(
    String subjectNameController, String dateController);

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  List<dynamic> examList = [];

  void _addForm() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddExam(_addExam)));
  }

  void _addExam(String subjectName, String date) {
    setState(() {
      examList.add({"subjectName": subjectName, "dateAndTime": date});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exams", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.add), onPressed: _addForm)],
      ), //AppBar
      body: ListView.builder(
        itemCount: examList.length,
        itemBuilder: (listViewContext, index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              title: Text(examList[index]["subjectName"].toString(),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              subtitle: Text(examList[index]["dateAndTime"].toString(),
                  style: TextStyle(fontSize: 17, color: Colors.grey)),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    examList.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
