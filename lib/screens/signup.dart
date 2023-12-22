import 'package:bjj_manager/common/contants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  SignupFormState createState() {
    return SignupFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class SignupFormState extends State<SignupScreen> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                style: kLabelTextStyle,
                controller: myController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  hintStyle: kHintTextStyle,
                ),
              ),
              TextFormField(
                style: kLabelTextStyle,
                controller: myController,
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                  hintStyle: kHintTextStyle,
                ),
              ),
              TextFormField(
                style: kLabelTextStyle,
                controller: myController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  hintStyle: kHintTextStyle,
                ),
              ),
              TextFormField(
                controller: myController,
                decoration: const InputDecoration(
                  hintText: 'Phone',
                  hintStyle: kHintTextStyle,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Text(myController.text),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: const Text('Sign Up'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
