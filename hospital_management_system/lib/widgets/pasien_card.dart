import 'package:flutter/material.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';

Widget pasienCard() {
  return Container(
    height: 153,
    width: 156,
    decoration: BoxDecoration(
      color: MyColors.white(),
      borderRadius: BorderRadius.circular(5.0),
      border: Border.all(color: MyColors.blue(), width: 1.3),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 15,
          left: 20,
          right: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PoppinsText.grey2Medium('Nama Pasien', 12),
              PoppinsText.blueSemiBold('Alteeza Akbar budi santosa', 14),
              const SizedBox(
                height: 10,
              ),
              PoppinsText.grey2Medium('No. Rekam Medis', 12),
              PoppinsText.blueSemiBold('1098765432', 14),
            ],
          ),
        ),
        Positioned(
          bottom: -1,
          left: -1,
          right: -1,
          child: Container(
            alignment: Alignment.center,
            child: PoppinsText.whiteMedium('Lihat Detail Pasien', 10),
            height: 35,
            decoration: BoxDecoration(
              color: MyColors.blue(),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(5.0)),
            ),
          ),
        ),
      ],
    ),
  );
}
