import 'dart:io';

import 'package:bjj_manager/common/contants.dart';
import 'package:bjj_manager/common/current_page.dart';
import 'package:bjj_manager/pages/home_page.dart';
import 'package:bjj_manager/screens/photo.dart';
import 'package:bjj_manager/screens/signup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bjj_manager/common/current_screen.dart';
import 'package:bjj_manager/screens/home.dart';
import 'package:bjj_manager/screens/login.dart';
import 'package:logger/logger.dart';

import 'package:window_size/window_size.dart';

const double windowWidth = 400;
const double windowHeight = 800;

var logger = Logger();

void main() {
  logger.i("Logger is working!");

  runApp(const MyApp());
}

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Provider CurrentScreen');
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: windowWidth,
        height: windowHeight,
      ));
    });
  }
}

final screens = [
  CurrentScreen(
    name: 'Login',
    route: 'login',
    builder: (context) => const LoginScreen(),
  ),
  CurrentScreen(
    name: 'Home',
    route: 'home',
    builder: (context) => const StudentScreen(
      'Student',
      title: 'Student',
    ),
  ),
  CurrentScreen(
    name: 'Photo',
    route: 'photo',
    builder: (context) => const PhotoScreen(
      'Photo',
      title: 'Photo',
    ),
  ),
  CurrentScreen(
    name: 'SignUp',
    route: 'signup',
    builder: (context) => const SignupScreen(),
  ),
];

final pages = [
  CurrentPage(
      name: 'HOme', route: 'home', builder: (context) => const HomePage())
];

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        for (final currentPage in pages)
          GoRoute(
            path: currentPage.route,
            builder: (context, state) => currentPage.builder(context),
          ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MyApp CurrentScreen',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: kAppBackgroundColor,
        ),
        scaffoldBackgroundColor: kAppBackgroundColor,
      ),
      routerConfig: router,
    );
  }
}
