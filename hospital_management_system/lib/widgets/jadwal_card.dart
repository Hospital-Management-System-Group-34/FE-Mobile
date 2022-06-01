import 'package:flutter/material.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';

Widget jadwal1Card() {
  return Container(
    height: 125,
    width: 328,
    decoration: BoxDecoration(
      color: MyColors.blue(),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 18,
          left: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PoppinsText.whiteMedium('Nama Pasien', 12),
              PoppinsText.whiteSemiBold('Cassandra Winter', 14),
            ],
          ),
        ),
        Positioned(
          top: 18,
          right: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PoppinsText.whiteMedium('No. Peserta', 12),
              PoppinsText.whiteSemiBold('1098361345', 14),
            ],
          ),
        ),
        Positioned(bottom: 18, left: 18, right: 18, child: myWaktuSesi()),
      ],
    ),
  );
}

Widget jadwal2Card() {
  return Container(
    height: 180,
    width: 328,
    decoration: BoxDecoration(
      color: MyColors.blue(),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 18,
          left: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PoppinsText.whiteMedium('Nama Pasien', 12),
              PoppinsText.whiteSemiBold('Cassandra Winter', 14),
            ],
          ),
        ),
        Positioned(
          top: 18,
          right: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PoppinsText.whiteMedium('No. Peserta', 12),
              PoppinsText.whiteSemiBold('1098361345', 14),
            ],
          ),
        ),
        Positioned(bottom: 75, left: 18, right: 18, child: myWaktuSesi()),
        Positioned(
            bottom: 18,
            left: 18,
            right: 18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: PoppinsText.whiteSemiBold('Re-schedule', 12),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(140, 10),
                    primary: MyColors.blue(),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(
                        color: MyColors.white(),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: PoppinsText.blueSemiBold('Proses Pasien', 12),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(140, 10),
                    primary: MyColors.white(),
                    elevation: 0,
                  ),
                ),
              ],
            )),
      ],
    ),
  );
}

Widget myWaktuSesi() {
  return Container(
    height: 35,
    decoration: BoxDecoration(
      color: MyColors.blue2(),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.event,
                  color: MyColors.white(),
                ),
                const SizedBox(
                  width: 6,
                ),
                PoppinsText.white('Minggu, 27 Mei 2022', 12),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.watch_later,
                  color: MyColors.white(),
                ),
                const SizedBox(
                  width: 6,
                ),
                PoppinsText.white('08.00 - 08.30', 12),
              ],
            ),
          ],
        )),
  );
}
