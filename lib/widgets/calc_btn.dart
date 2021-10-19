import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final double textSize;
  final Function func;
  const CalcButton(
      {Key? key,
      required this.text,
      required this.bgColor,
      required this.textColor,
      required this.textSize,
      required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      child: SizedBox(
        height: 65,
        width: 65,
        child: ElevatedButton(
          child: Text(text,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.bold
              ))),
          onPressed: () {
            func(text);
          },
          style: ElevatedButton.styleFrom(
            primary: bgColor,
            onPrimary: textColor,
            shape: const CircleBorder()
          ),
        ),
      ),
    );
  }
}
