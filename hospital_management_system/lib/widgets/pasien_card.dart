import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';

Widget pasienCard() {
  return Container(
    height: 110,
    width: 330,
    decoration: BoxDecoration(
        border: Border.all(color: MyColors.blue(), width: 2),
        borderRadius: BorderRadius.circular(5.0)),
    child: Stack(
      children: [
        Positioned(
          top: 10,
          left: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PoppinsText.blue('Nama Pasien', 12),
              PoppinsText.blackSemiBold('Alteeza Akbar', 14),
              const SizedBox(
                height: 10,
              ),
              PoppinsText.blue('No. Peserta', 12),
              PoppinsText.blackSemiBold('1098765432', 14),
            ],
          ),
        ),
        Positioned(
          right: 10,
          child: myPopUpMenu(),
        ),
      ],
    ),
  );
}

Widget myPopUpMenu() {
  return PopupMenuButton(
    icon: Icon(
      Icons.more_horiz,
      color: MyColors.blue(),
      size: 30,
    ),
    itemBuilder: (context) => [
      PopupMenuItem(value: 'Edit', child: PoppinsText.black('Edit', 12)),
      PopupMenuItem(value: 'Hapus', child: PoppinsText.black('Hapus', 12)),
    ],
    onSelected: (value) {
      if (value == 'Edit') {
        log('edit edit edit');
      } else {
        log('hapus hapus hapus');
      }
    },
  );
}
