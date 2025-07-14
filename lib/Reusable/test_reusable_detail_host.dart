import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormLabel extends StatelessWidget {
  final String text;
  final double fontSize;

  const FormLabel(this.text, {super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 6),
      child: Text(
        text,
        style: GoogleFonts.bricolageGrotesque(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
