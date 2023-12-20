import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'package:bjj_manager/models/student.dart';
import 'package:logger/logger.dart';

class HttpService {
  var logger = Logger();

  // A function that converts a response body into a List<Student>.
  List<Student> parseStudents(String responseBody) {
    final parsed =
        (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();
    logger.i(parsed);

    List<Student> students =
        parsed.map<Student>((json) => Student.fromJson(json)).toList();
    logger.i(students.length);
    return students;
  }

  Future<List<Student>> pageStudents() async {
    const String studentsURL =
        "http://127.0.0.1:8080/api/v1/students/page/size/100/number/1";
    Response response = await get(Uri.parse(studentsURL));

    // Use the compute function to run parseStudents in a separate isolate.
    return compute(parseStudents, response.body);
  }
}
