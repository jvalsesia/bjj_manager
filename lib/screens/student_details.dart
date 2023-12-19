import 'package:flutter/material.dart';
import 'package:bjj_manager/models/student.dart';

class StudentDetails extends StatelessWidget {
  final Student student;

  const StudentDetails({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(student.id as String),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: const Text("CPF / RG"),
                        subtitle: Text(student.cpfRg),
                      ),
                      ListTile(
                        title: const Text("id"),
                        subtitle: Text(student.id as String),
                      ),
                      ListTile(
                        title: const Text("First Name"),
                        subtitle: Text(student.firstName),
                      ),
                      ListTile(
                        title: const Text("Last Nave"),
                        subtitle: Text(student.lastName),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
