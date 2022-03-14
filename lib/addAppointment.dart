import 'dart:convert';

import 'package:exams/showAppointments.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:core';
import 'appointments.dart';





class AddAppointment extends StatefulWidget {
  final AddAppCallback appCallback;

  const AddAppointment(this.appCallback);

  @override
  State<StatefulWidget> createState() {
    return _AddAppointmentState(appCallback);
  }
}

class _AddAppointmentState extends State<AddAppointment> {
  AddAppCallback appCallback;

  _AddAppointmentState(this.appCallback);
 


  //  final List<Appointment> appointments = <Appointment>[];
  //   appointments.add(Appointment(
  //     startTime: DateTime.now().add(Duration(hours: 4)),
  //     endTime: DateTime.now().add(Duration(hours: 5)),
  //     subject: 'Meeting',
  //     color: Colors.red,
  //   ));

  final startTimeController = TextEditingController();
   final endTimeController =TextEditingController();
final  appNameController=TextEditingController();
  DateTime dateTime = DateTime.now();







  @override
  void initState() {
    super.initState();

    
  }



  void _onSubmit() {
  appCallback(startTimeController.text,endTimeController.text,appNameController.text);

    

    setState(() {
      appNameController.text = "";
      startTimeController.text = "";
      endTimeController.text = "";
         dateTime = DateTime.now();
     
     
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Appointment successfully added.')),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Appointment'),
      ),
      body: Form(
        child: Scrollbar(
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...[
                        TextFormField(
                          controller: appNameController,
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: 'Enter title',
                            labelText: 'Appointment Title',
                          ),
                        ),
                       
                       
                       _FormDatePicker(
                       // _FormDatePicker(
                          date: dateTime,
                          onChanged: (value) {
                            setState(() {
                              dateTime = value;

                              String formatedDate =
                                  intl.DateFormat('dd/MM/yyyy').format(dateTime);

                              startTimeController.text = formatedDate;
                            });
                          },
                        ),
                         _FormDatePicker(
                       // _FormDatePicker(
                          date: dateTime,
                          onChanged: (value) {
                            setState(() {
                              dateTime = value;

                              String formatedDate =
                                  intl.DateFormat('dd/MM/yyyy').format(dateTime);

                              endTimeController.text = formatedDate;
                            });
                          },
                        ),
                      ].expand(
                        (widget) => [
                          widget,
                          const SizedBox(
                            height: 24,
                          )
                        ],
                      ),
                      ElevatedButton(
                        child: const Text('Submit'),
                        onPressed: _onSubmit,
                      ),
                     
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  const _FormDatePicker({
    required this.date,
    required this.onChanged,
  });

  @override
  _FormDatePickerState createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              intl.DateFormat.yMd().format(widget.date),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        TextButton(
          child: const Text('Edit'),
          onPressed: () async {
            var newDate = await showDatePicker(
              context: context,
              initialDate: widget.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            // Don't change the date if the date picker returns null.
            if (newDate == null) {
              return;
            }
          

            widget.onChanged(newDate);
          },
        ),
      ],
    );
  }
}