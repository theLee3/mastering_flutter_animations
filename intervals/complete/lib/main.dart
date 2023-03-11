import 'package:flutter/material.dart';

import 'single_animated_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fun with Intervals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SingleAnimatedWidgetDemo(),
      // home: const MultipleAnimatedWidgetsDemo(),
    );
  }
}
