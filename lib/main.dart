import 'package:flutter/material.dart';
import 'package:my_calculator/pages/calc_page.dart';
import 'package:my_calculator/widget/button_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Calculator',
      home: Scaffold(backgroundColor: Colors.white10, body: CalcPage()),
    );
  }
}
