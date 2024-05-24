import 'package:flutter/material.dart';
import 'package:todo_app/screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primaryColor: const Color(0xFF2a9d8f),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF2a9d8f),
        ),
      ),
      home: const StartScreen(),
    );
  }
}
