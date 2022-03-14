import 'package:exams/addExam.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:core';
import 'addExam.dart';
import 'addAppointment.dart';

typedef AddAppCallback = void Function(
    String appNameController, String endDateController,String startDateController);

class AppointmentsHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppointmentsHomeState();
  }
}

class AppointmentsHomeState extends State<AppointmentsHome> {
  List<dynamic> appList = [];




  void _addAppointment(String appName, String startDate,String endDate) {
    setState(() {
      appList.add({"AppointmentName": appName, "start": startDate,"end":endDate});
    });
  }
  void _addAppForm() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddAppointment (_addAppointment)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointments", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.add), onPressed: _addAppForm)
      
        ]), //AppBar
      body: ListView.builder(
        itemCount: appList.length,
        itemBuilder: (listViewContext, index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              title: Text(appList[index]["AppointmentName"].toString(),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              subtitle: Text(appList[index]["start"].toString(), 
           style: TextStyle(fontSize: 17, color: Colors.grey)),
             
         
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    appList.removeAt(index);
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
