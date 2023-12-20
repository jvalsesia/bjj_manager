import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/student.dart';

Future<List<Student>> fetchStudents(http.Client client) async {
  final response = await client.get(Uri.parse(
      'http://127.0.0.1:8080/api/v1/students/page/size/100/number/1'));

  // Use the compute function to run parseStudents in a separate isolate.
  return compute(parseStudents, response.body);
}

// A function that converts a response body into a List<Student>.
List<Student> parseStudents(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Student>((json) => Student.fromJson(json)).toList();
}

class StudentScreen extends StatelessWidget {
  const StudentScreen(String s, {super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Student>>(
        future: fetchStudents(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return StudentsList(students: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class StudentsList extends StatelessWidget {
  const StudentsList({super.key, required this.students});

  final List<Student> students;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      prototypeItem: const ListTile(
        title: Text('Students'),
      ),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(students[index].firstName),
        );
      },
    );
  }
}
