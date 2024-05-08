import 'package:flutter/material.dart';
import 'package:todo_app/screens/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primaryColor: Color(0xFF2a9d8f),
        appBarTheme: AppBarTheme(
          color: Color(0xFF2a9d8f),
        ),
      ),
      home: StartScreen(),
    );
  }
}
