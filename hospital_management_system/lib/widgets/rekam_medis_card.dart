import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_system/models/patient_id_model.dart';
import 'package:hospital_management_system/view/screens/detail_rekam_medis_screen.dart';
import 'package:hospital_management_system/widgets/warna.dart';

Widget rekamMedisCard(
    {required BuildContext context,
    required MedicalRecords medicalRecords,
    required Sessions sessions,
    required String poli}) {
  return Container(
    height: 82,
    width: double.infinity,
    decoration: BoxDecoration(
      color: MyColors.white(),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: MyColors.neutral4(),
      ),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.05),
          offset: Offset(1, 1),
          blurRadius: 14,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: defaultTextStyle(),
                  children: <TextSpan>[
                    const TextSpan(text: 'Tanggal Sesi: '),
                    TextSpan(
                      text: sessions.date,
                      style: blueTextStyle(),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: defaultTextStyle(),
                  children: <TextSpan>[
                    const TextSpan(text: 'Poli: '),
                    TextSpan(
                      text: poli,
                      style: blueTextStyle(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: const Color.fromARGB(255, 9, 194, 255),
                shape: const CircleBorder(),
                fixedSize: const Size(40, 40)),
            child: Icon(
              Icons.navigate_next_rounded,
              color: MyColors.white(),
              size: 34,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailRekamMedis(
                      medicalRecords: medicalRecords,
                      tanggalSesi: sessions.date!,
                    ),
                  ));
            },
          )
        ],
      ),
    ),
  );
}

TextStyle defaultTextStyle() {
  return GoogleFonts.poppins(
    color: MyColors.neutral6(),
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
}

TextStyle blueTextStyle() {
  return GoogleFonts.poppins(
    color: const Color.fromARGB(255, 8, 194, 222),
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );
}
