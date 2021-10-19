import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/calc_btn.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _history = '';
  String _expr = '';

  btnClick(String text) {
    setState(() {
      _expr += text;
    });
  }

  clearAllClick(String text) {
    setState(() {
      _history = '';
      _expr = '';
    });
  }

  clearClick(String text) {
    setState(() {
      _expr = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expr);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expr;
      _expr = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Calculator',
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  fontSize: 27,
                  color: Colors.black,
                  fontWeight: FontWeight.w700)),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                _history,
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w200,
                    ),
                    color: Colors.grey),
              ),
              alignment: const Alignment(1, 1),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Text(
                _expr,
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                    color: Colors.black),
              ),
              alignment: const Alignment(1, 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: 'AC',
                  bgColor: Colors.red,
                  textColor: Colors.white,
                  textSize: 25,
                  func: clearAllClick,
                ),
                CalcButton(
                  text: 'C',
                  bgColor: Colors.yellowAccent,
                  textColor: Colors.white,
                  textSize: 25,
                  func: clearClick,
                ),
                CalcButton(
                  text: '%',
                  bgColor: Colors.grey,
                  textColor: Colors.white,
                  textSize: 25,
                  func: btnClick,
                ),
                CalcButton(
                  text: '/',
                  bgColor: Colors.grey,
                  textColor: Colors.white,
                  textSize: 25,
                  func: btnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '1',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  textSize: 25,
                  func: btnClick,
                ),
                CalcButton(
                  text: '2',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  textSize: 25,
                  func: btnClick,
                ),
                CalcButton(
                  text: '3',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  textSize: 25,
                  func: btnClick,
                ),
                CalcButton(
                  text: '+',
                  bgColor: Colors.grey.shade800,
                  textColor: Colors.white,
                  textSize: 25,
                  func: btnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '4',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  textSize: 25,
                  func: btnClick,
                ),
                CalcButton(
                  text: '5',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  textSize: 25,
                  func: btnClick,
                ),
                CalcButton(
                  text: '6',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  textSize: 25,
                  func: btnClick,
                ),
                CalcButton(
                  text: '-',
                  bgColor: Colors.grey.shade800,
                  textColor: Colors.white,
                  textSize: 25,
                  func: btnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '7',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  textSize: 25,
                  func: btnClick,
                ),
                CalcButton(
                  text: '8',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  textSize: 25,
                  func: btnClick,
                ),
                CalcButton(
                  text: '9',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  textSize: 25,
                  func: btnClick,
                ),
                CalcButton(
                  text: '*',
                  bgColor: Colors.grey.shade800,
                  textColor: Colors.white,
                  textSize: 25,
                  func: btnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '.',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  textSize: 25,
                  func: btnClick,
                ),
                CalcButton(
                  text: '0',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  textSize: 25,
                  func: btnClick,
                ),
                CalcButton(
                  text: 'Sc',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  textSize: 25,
                  func: btnClick,
                ),
                CalcButton(
                  text: '=',
                  bgColor: Colors.grey.shade800,
                  textColor: Colors.white,
                  textSize: 25,
                  func: evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
