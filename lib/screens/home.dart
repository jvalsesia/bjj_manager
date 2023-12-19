import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bjj_manager/models/student.dart';
import 'package:bjj_manager/screens/student_details.dart';
import 'package:bjj_manager/services/http_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HttpService httpService = HttpService();

  late Future<List<Student>> futureStudents;
  @override
  void initState() {
    super.initState();
    futureStudents = httpService.pageStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('This is a snackbar'),
                duration: Duration(seconds: 2),
              ));
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => {context.go('/login')},
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: futureStudents,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Student> students = snapshot.data!;
              return ListView(
                children: students
                    .map(
                      (Student student) => ListTile(
                        title: Text(student.lastName),
                        subtitle: Text(student.firstName),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => StudentDetails(
                              student: student,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
