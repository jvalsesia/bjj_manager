import 'dart:convert';

import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:bjj_manager/models/student.dart';

class HttpService {
  final log = Logger('HttpService');
  final String studentsURL =
      "http://127.0.0.1x:8080/api/v1/students/page/size/100/number/1";

  Future<List<Student>> pageStudents() async {
    log.info("pageStudents");
    Response res = await get(Uri.parse(studentsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      log.info(res);
      List<Student> students = body
          .map(
            (dynamic item) => Student.fromJson(item),
          )
          .toList();

      return students;
    } else {
      throw "Unable to retrieve students.";
    }
  }
}
