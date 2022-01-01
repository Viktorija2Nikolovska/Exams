import 'package:exams/homeExam.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:core';
import 'homeExam.dart';


class AddExam extends StatefulWidget {
  final AddExamCallback callback;
  const AddExam(this.callback);

  @override
  State<StatefulWidget> createState() {
    
  
     return _AddExamState(callback);
  }
}

class _AddExamState extends State<AddExam> {

 

  AddExamCallback callback;
 
  _AddExamState(this.callback);

  final subjectNameController = TextEditingController();
  final dateController = TextEditingController();
  DateTime dateTime = DateTime.now();

  void onSubmit() {
    callback(subjectNameController.text, dateController.text);

    setState(() {
      subjectNameController.text = "";
      dateController.text = "";
      dateTime = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Exam'),
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
                          controller: subjectNameController,
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: 'Enter exam name',
                            labelText: 'Exam',
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

                              dateController.text = formatedDate;
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
                          child: const Text('Submit'), onPressed: onSubmit),
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