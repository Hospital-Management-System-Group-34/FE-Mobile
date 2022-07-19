import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_system/widgets/warna.dart';

Widget myDisabledTextField(String textInput) {
  var myController = TextEditingController();
  myController.text = textInput;

  return TextField(
    minLines: 1,
    maxLines: 3,
    controller: myController,
    style: GoogleFonts.poppins(
      color: MyColors.neutral7(),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    decoration: InputDecoration(
      enabled: false,
      filled: true,
      fillColor: MyColors.textFieldColor(),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColors.textFieldBorderColor(),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ),
  );
}
