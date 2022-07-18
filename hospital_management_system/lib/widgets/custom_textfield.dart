import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_system/widgets/warna.dart';

Widget myTextField({
  required TextEditingController controller,
  required TextInputType textInputType,
  required int maxLines,
  required int minLines,
  required String hintText,
}) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return '*required field';
      }
      return null;
    },
    controller: controller,
    keyboardType: textInputType,
    maxLines: maxLines,
    minLines: minLines,
    style: GoogleFonts.poppins(
      fontSize: 14,
      color: MyColors.black(),
      fontWeight: FontWeight.w400,
    ),
    decoration: InputDecoration(
      hintStyle: GoogleFonts.poppins(
        fontSize: 14,
        color: MyColors.neutral6(),
        fontWeight: FontWeight.w400,
      ),
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColors.neutral7(),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
