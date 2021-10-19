import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator.dart';

void main() {
  runApp(const CalculatorApp());
}
 

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Calculator(),
      title: 'Calculator App',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
    );
  }
}
