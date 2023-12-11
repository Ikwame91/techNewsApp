import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const ModifiedText(
      {super.key,
      required this.text,
      required this.color,
      required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}

class BoldText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const BoldText(
      {super.key, required this.text, required this.color, required this.size});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
