import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PoppinsText {
  static blueBold(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 9, 87, 222),
            fontSize: fontSize,
            fontWeight: FontWeight.bold));
  }

  static whiteBold(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 253, 253, 253),
            fontSize: fontSize,
            fontWeight: FontWeight.bold));
  }

  static blackBold(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: fontSize,
            fontWeight: FontWeight.bold));
  }

  static black(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
          color: const Color.fromARGB(255, 0, 0, 0),
          fontSize: fontSize,
        ));
  }
}
