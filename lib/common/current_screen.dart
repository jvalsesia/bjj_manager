import 'package:flutter/material.dart';

class CurrentScreen {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const CurrentScreen(
      {required this.name, required this.route, required this.builder});
}
