import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';

Widget jadwalHomeCard() {
  return Container(
    height: 125,
    width: double.infinity,
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
              SizedBox(
                width: 180,
                child: PoppinsText.whiteSemiBold('Cassandra Winter steve', 14),
              ),
            ],
          ),
        ),
        Positioned(
          top: 18,
          right: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PoppinsText.whiteMedium('No. Pasien', 12),
              SizedBox(
                width: 82,
                child: PoppinsText.whiteSemiBold('1098361345', 14),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 18,
          left: 18,
          right: 18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(flex: 1, child: antrian()),
              const SizedBox(
                width: 15,
              ),
              Flexible(flex: 2, child: jadwal()),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget jadwalAkanDatangCard(BuildContext context) {
  return Container(
    height: 180,
    width: double.infinity,
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
              SizedBox(
                width: 180,
                child: PoppinsText.whiteSemiBold(
                    'Cassandra Winter steve john', 14),
              ),
            ],
          ),
        ),
        Positioned(
          top: 18,
          right: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PoppinsText.whiteMedium('No. Pasien', 12),
              SizedBox(
                width: 82,
                child: PoppinsText.whiteSemiBold('1098361345', 14),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 75,
          left: 18,
          right: 18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(flex: 1, child: antrian()),
              const SizedBox(
                width: 15,
              ),
              Flexible(flex: 2, child: jadwal()),
            ],
          ),
        ),
        Positioned(
            bottom: 18,
            left: 18,
            right: 18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      popUpBatal(context);
                    },
                    child: PoppinsText.whiteSemiBold('Batalkan', 12),
                    style: ElevatedButton.styleFrom(
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
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: PoppinsText.blueSemiBold('Proses Pasien', 12),
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.white(),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            )),
      ],
    ),
  );
}

Widget jadwalSelesaiCard() {
  return Container(
    height: 140,
    width: double.infinity,
    decoration: BoxDecoration(
      color: MyColors.blue(),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText.whiteMedium('Nama Pasien', 12),
                  SizedBox(
                    width: 180,
                    child: PoppinsText.whiteSemiBold(
                        'Cassandra Winter steve udin', 14),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText.whiteMedium('No Pasien', 12),
                  SizedBox(
                    width: 82,
                    child: PoppinsText.whiteSemiBold('123897382', 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: PoppinsText.blueSemiBold('Lihat Hasil Sesi', 12),
                style: ElevatedButton.styleFrom(
                  primary: MyColors.white(),
                  elevation: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget jadwalBatalCard() {
  return Container(
    height: 140,
    width: double.infinity,
    decoration: BoxDecoration(
      color: MyColors.grey(),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText.whiteMedium('Nama Pasien', 12),
                  SizedBox(
                    width: 180,
                    child: PoppinsText.whiteSemiBold(
                        'Cassandra Winter steve udin', 14),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText.whiteMedium('No Pasien', 12),
                  SizedBox(
                    width: 82,
                    child: PoppinsText.whiteSemiBold('123897382', 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: PoppinsText.greySemiBold('Lihat Hasil Sesi', 12),
                style: ElevatedButton.styleFrom(
                  primary: MyColors.white(),
                  elevation: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget antrian() {
  return Container(
    alignment: Alignment.center,
    height: 35,
    decoration: BoxDecoration(
      color: MyColors.blue2(),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: PoppinsText.whiteBold('UM01', 12),
    ),
  );
}

Widget jadwal() {
  return Container(
    height: 35,
    decoration: BoxDecoration(
      color: MyColors.blue2(),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event,
            color: MyColors.white(),
          ),
          const SizedBox(
            width: 6,
          ),
          PoppinsText.whiteMedium('Minggu, 27 Mei 2022', 12),
        ],
      ),
    ),
  );
}

popUpBatal(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Container(
        height: 240,
        color: MyColors.white(),
        child: Column(
          children: [
            PoppinsText.black('Anda Yakin ingin membatalkan sesi ini?', 12),
            const SizedBox(
              height: 7,
            ),
            SvgPicture.asset('assets/popup1.svg'),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: PoppinsText.blueSemiBold('Ya, batalkan', 12),
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.white(),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: MyColors.blue(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: PoppinsText.whiteSemiBold('Tidak', 12),
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.blue(),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
