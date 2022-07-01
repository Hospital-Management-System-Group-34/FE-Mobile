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

  static blue2semibold(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: MyColors.blue3(),
            fontSize: fontSize,
            fontWeight: FontWeight.w600));
  }

  static blueSemiBold(String text, double fontSize) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
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
        overflow: TextOverflow.ellipsis,
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
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.poppins(
            color: MyColors.black(),
            fontSize: fontSize,
            fontWeight: FontWeight.bold));
  }

  static blackMedium(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: MyColors.black(),
            fontSize: fontSize,
            fontWeight: FontWeight.w500));
  }

  static blackSemiBold(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: MyColors.black(),
            fontSize: fontSize,
            fontWeight: FontWeight.w600));
  }

  static greySemiBold(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: MyColors.grey(),
            fontSize: fontSize,
            fontWeight: FontWeight.w600));
  }

  static grey2Medium(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
            color: MyColors.grey2(),
            fontSize: fontSize,
            fontWeight: FontWeight.w500));
  }

  static neutral9Normal(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
          color: MyColors.black(),
          fontWeight: FontWeight.w400,
          fontSize: fontSize,
        ));
  }

  static neutral9Medium(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
          color: MyColors.black(),
          fontWeight: FontWeight.w500,
          fontSize: fontSize,
        ));
  }

  static neutral9Bold(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
          color: MyColors.black(),
          fontWeight: FontWeight.w700,
          fontSize: fontSize,
        ));
  }

  static neutral6Normal(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
          color: MyColors.neutral6(),
          fontWeight: FontWeight.w400,
          fontSize: fontSize,
        ));
  }

  static neutral6Medium(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
          color: MyColors.neutral6(),
          fontWeight: FontWeight.w500,
          fontSize: fontSize,
        ));
  }

  static neutral6SemiBold(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
          color: MyColors.neutral6(),
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
        ));
  }

  static neutral5Bold(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.poppins(
          color: MyColors.neutral5(),
          fontWeight: FontWeight.w700,
          fontSize: fontSize,
        ));
  }
}
