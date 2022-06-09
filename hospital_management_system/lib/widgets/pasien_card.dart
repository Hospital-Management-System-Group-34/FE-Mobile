import 'package:flutter/material.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';

Widget pasienCard() {
  return Container(
    height: 153,
    width: 156,
    decoration: BoxDecoration(
      color: MyColors.blue(),
      borderRadius: BorderRadius.circular(5.0),
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
              PoppinsText.whiteMedium('Nama Pasien', 12),
              PoppinsText.whiteSemiBold('Alteeza Akbar budi santosa', 14),
              const SizedBox(
                height: 10,
              ),
              PoppinsText.whiteMedium('No. Pasien', 12),
              PoppinsText.whiteSemiBold('1098765432', 14),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            child: PoppinsText.whiteMedium('Lihat Detail Pasien', 10),
            height: 35,
            decoration: BoxDecoration(
              color: MyColors.blue2(),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    ),
  );
}
