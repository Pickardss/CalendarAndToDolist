import 'package:flutter/material.dart';
import 'package:todo_app/screens/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: StartScreen(),
    );
  }
}
