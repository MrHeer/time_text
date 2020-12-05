import 'package:flutter/material.dart';
import 'package:time_text/time_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TimeText(),
        ),
      ),
    );
  }
}
