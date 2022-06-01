import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_system/widgets/warna.dart';

class PoppinsText {
  static blue(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
          color: MyColors.blue(),
          fontSize: fontSize,
        ));
  }

  static blueSemiBold(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: MyColors.blue(),
            fontSize: fontSize,
            fontWeight: FontWeight.w600));
  }

  static blueBold(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: MyColors.blue(),
            fontSize: fontSize,
            fontWeight: FontWeight.bold));
  }

  static white(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
          color: MyColors.white(),
          fontSize: fontSize,
        ));
  }

  static whiteBold(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: MyColors.white(),
            fontSize: fontSize,
            fontWeight: FontWeight.bold));
  }

  static whiteMedium(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: MyColors.white(),
            fontSize: fontSize,
            fontWeight: FontWeight.w500));
  }

  static whiteSemiBold(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: MyColors.white(),
            fontSize: fontSize,
            fontWeight: FontWeight.w600));
  }

  static black(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
          color: MyColors.black(),
          fontSize: fontSize,
        ));
  }

  static blackBold(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: MyColors.black(),
            fontSize: fontSize,
            fontWeight: FontWeight.bold));
  }

  static blackSemiBold(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: MyColors.black(),
            fontSize: fontSize,
            fontWeight: FontWeight.w600));
  }
}
