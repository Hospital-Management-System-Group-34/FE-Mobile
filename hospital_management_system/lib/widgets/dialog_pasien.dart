import 'package:flutter/material.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';

Widget dialogPasien(
    {required BuildContext context,
    required String nik,
    required String noRekamMedis,
    required String poli,
    required String nama,
    required String jenisKelamin,
    required String handphone,
    required String keluhan}) {
  return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding:
          const EdgeInsets.only(top: 25, bottom: 25, left: 30, right: 15),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PoppinsText.neutral9SemiBold('Detail Pasien', 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: MyColors.neutral5(),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(1),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Icon(
                  Icons.close_rounded,
                  color: MyColors.white(),
                  size: 27,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          PoppinsText.neutral6Medium('NIK', 12),
          const SizedBox(height: 5),
          PoppinsText.neutral9SemiBold(nik, 14),
          const SizedBox(height: 10),
          PoppinsText.neutral6Medium('No. Rekam Medis', 12),
          const SizedBox(height: 5),
          PoppinsText.neutral9SemiBold(noRekamMedis, 14),
          const SizedBox(height: 10),
          PoppinsText.neutral6Medium('Poli', 12),
          const SizedBox(height: 5),
          PoppinsText.neutral9SemiBold(poli, 14),
          const SizedBox(height: 10),
          PoppinsText.neutral6Medium('Nama Lengkap', 12),
          const SizedBox(height: 5),
          PoppinsText.neutral9SemiBold(nama, 14),
          const SizedBox(height: 10),
          PoppinsText.neutral6Medium('Jenis Kelamin', 12),
          const SizedBox(height: 5),
          PoppinsText.neutral9SemiBold(jenisKelamin, 14),
          const SizedBox(height: 10),
          PoppinsText.neutral6Medium('No. Handphone', 12),
          const SizedBox(height: 5),
          PoppinsText.neutral9SemiBold(handphone, 14),
          const SizedBox(height: 10),
          PoppinsText.neutral6Medium('Keluhan', 12),
          const SizedBox(height: 5),
          PoppinsText.neutral9SemiBold(keluhan, 14),
          const SizedBox(height: 10),
        ],
      ));
}
