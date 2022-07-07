import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_system/viewmodels/provider/auth_provider.dart';
import 'package:hospital_management_system/widgets/warna.dart';
import 'package:provider/provider.dart';

Widget dialogAuth(BuildContext context, String title, String subtitle) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    contentPadding: const EdgeInsets.only(top: 30),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
          child: Column(
            children: [
              Text(title,
                  style: GoogleFonts.poppins(
                      color: MyColors.black(),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  color: MyColors.neutral6(),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
          height: 1,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.transparent,
            minimumSize: const Size(double.infinity, 45),
          ),
          onPressed: () {
            Navigator.pop(context);
            Provider.of<LoginProvider>(context, listen: false)
                .changeState(LoginState.standby);
          },
          child: Text(
            'Coba Lagi',
            style: GoogleFonts.poppins(
              color: MyColors.black(),
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ),
      ],
    ),
  );
}
