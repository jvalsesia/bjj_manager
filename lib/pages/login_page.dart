import 'package:bjj_manager/common/contants.dart';
import 'package:bjj_manager/common/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
                child: ReusableCard(
              cardColor: kContainerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome',
                    style: kTitleTextStyle,
                  ),
                  TextFormField(
                    style: kHintTextStyle,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      hintStyle: kHintTextStyle,
                    ),
                  ),
                  TextFormField(
                    style: kHintTextStyle,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: kHintTextStyle,
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.pushReplacement('/signup');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text('ENTER'),
                  )
                ],
              ),
              cardHeight: 300.0,
            )),
          ],
        ),
      ],
    ));
  }
}
